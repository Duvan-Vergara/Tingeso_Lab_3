# ============================================================================================================
# SISTEMA EJECUTOR DE PRUEBAS REALES - TINGESO LAB 3
# ============================================================================================================
# Este script ejecuta PRUEBAS REALES (no simuladas) contra servicios desplegados:
# - JMeter: Backend + BD en Kubernetes con poblamiento automático
# - Selenium: Frontend + Backend completo desplegado
# - Resultados reales almacenados y reportados
# ============================================================================================================

param(
    [string]$TestType = "ALL",  # ALL, JMETER, SELENIUM, FUNCTIONAL
    [switch]$SkipBuild = $false,
    [switch]$KeepDeployment = $false,
    [int]$TimeoutMinutes = 30
)

# Variables globales
$script:TestResults = @()
$script:StartTime = Get-Date
$script:ReportPath = "jmeter-results"
$script:SeleniumResultsPath = "selenium-results"

# Crear directorios de resultados
if (!(Test-Path $script:ReportPath)) { New-Item -ItemType Directory -Path $script:ReportPath }
if (!(Test-Path $script:SeleniumResultsPath)) { New-Item -ItemType Directory -Path $script:SeleniumResultsPath }

function Write-Header {
    param([string]$Title)
    $line = "=" * 80
    Write-Host "`n$line" -ForegroundColor Cyan
    Write-Host " $Title" -ForegroundColor White
    Write-Host "$line" -ForegroundColor Cyan
}

function Write-Step {
    param([string]$Message, [string]$Type = "INFO")
    $timestamp = Get-Date -Format "HH:mm:ss"
    switch ($Type) {
        "SUCCESS" { Write-Host "[$timestamp] ✅ $Message" -ForegroundColor Green }
        "ERROR"   { Write-Host "[$timestamp] ❌ $Message" -ForegroundColor Red }
        "WARNING" { Write-Host "[$timestamp] ⚠️ $Message" -ForegroundColor Yellow }
        "INFO"    { Write-Host "[$timestamp] ℹ️ $Message" -ForegroundColor White }
    }
}

function Add-TestResult {
    param($Category, $TestName, $Result, $Details = "", $Duration = 0, $MetricsFile = "")
    $script:TestResults += [PSCustomObject]@{
        Timestamp = Get-Date
        Category = $Category
        TestName = $TestName
        Result = $Result
        Details = $Details
        Duration = $Duration
        MetricsFile = $MetricsFile
    }
}

function Test-Prerequisites {
    Write-Header "🔍 VERIFICANDO PRERREQUISITOS"
    
    $tools = @{
        "kubectl" = "kubectl version --client -o json 2>nul"
        "docker" = "docker --version"
        "jmeter" = "jmeter --version"
        "node" = "node --version"
    }
    
    $allGood = $true
    foreach ($tool in $tools.Keys) {
        try {
            $null = Invoke-Expression $tools[$tool]
            Write-Step "$tool disponible" "SUCCESS"
        } catch {
            Write-Step "$tool NO disponible - requerido para pruebas reales" "ERROR"
            $allGood = $false
        }
    }
    
    # Verificar Minikube/Docker Desktop
    try {
        $null = kubectl cluster-info 2>$null
        Write-Step "Cluster Kubernetes disponible" "SUCCESS"
    } catch {
        Write-Step "Cluster Kubernetes NO disponible - iniciando..." "WARNING"
        try {
            minikube start
            Write-Step "Minikube iniciado" "SUCCESS"
        } catch {
            Write-Step "No se pudo iniciar cluster Kubernetes" "ERROR"
            $allGood = $false
        }
    }
    
    return $allGood
}

function Deploy-ForJMeter {
    Write-Header "🚀 DESPLEGANDO BACKEND + BD PARA JMETER"
    
    try {
        # Limpiar despliegue anterior
        Write-Step "Limpiando despliegue anterior..."
        & ".\clean_k8s.ps1" -Force

        Write-Step "Construyendo imágenes si es necesario..."
        if (!$SkipBuild) {
            & ".\build_and_push_all.ps1"
        }

        # Desplegar solo servicios necesarios para JMeter (Backend + BD)
        Write-Step "Desplegando MySQL y servicios backend..."
        
        # MySQL primero
        kubectl apply -f deployment/mysql-config-map.yaml
        kubectl apply -f deployment/mysql-root-secret.yaml
        kubectl apply -f deployment/mysql-user-secret.yaml
        kubectl apply -f deployment/mysql-deployment.yaml
        
        # Esperar MySQL
        Write-Step "Esperando MySQL..."
        kubectl wait --for=condition=ready pod -l app=mysql --timeout=300s
        
        # Servicios backend (orden correcto)
        $backendServices = @(
            "eureka-service-deployment-service.yaml",
            "config-service-deployment-service.yaml",
            "rack-service-deployment.yaml",
            "reserve-service-db-deployment-service.yaml",
            "reports-service-deployment.yaml",
            "tariff-service-deployment.yaml",
            "special-rates-service-deployment.yaml",
            "discount-frequent-service-db-deployment-service.yaml",
            "discount-people-service-db-deployment-service.yaml",
            "gateway-service-deployment-service.yaml"
        )
        
        foreach ($service in $backendServices) {
            Write-Step "Desplegando $service..."
            kubectl apply -f "deployment/$service"
            Start-Sleep 2
        }
        
        # Esperar que los servicios estén listos
        Write-Step "Esperando servicios backend..."
        Start-Sleep 30
        
        # Poblar BD con datos para pruebas
        Write-Step "Poblando base de datos con datos de prueba..."
        
        # Determinar el escenario de población basado en el tipo de prueba
        $populationScenario = switch ($TestType.ToUpper()) {
            "JMETER" { "LOAD" }  # Para JMeter usar escenario Load por defecto
            "ALL" { "ALL" }      # Para todas las pruebas usar todos los escenarios
            default { "LOAD" }
        }
        
        # Ejecutar poblamiento
        Write-Step "Ejecutando poblamiento de BD (escenario: $populationScenario)..."
        try {
            & ".\POBLADOR-BD-PRUEBAS.ps1" -ScenarioType $populationScenario -BaseReservations 500 -Force
            
            # Aplicar el ConfigMap y Job de población correspondiente
            $scenario = $populationScenario.ToLower()
            if ($populationScenario -eq "ALL") { $scenario = "load" }  # Usar load como default para ALL
            
            kubectl apply -f "deployment\karting-db-populate-$scenario-configmap.yaml"
            Start-Sleep 5
            kubectl apply -f "deployment\karting-db-populate-$scenario-job.yaml"
            
            # Esperar que el job complete
            Write-Step "Esperando completación del poblamiento de BD..."
            $timeout = 180  # 3 minutos
            $elapsed = 0
            $populationCompleted = $false
            
            do {
                Start-Sleep 10
                $elapsed += 10
                $jobStatus = kubectl get job "karting-db-populate-$scenario-job" -o jsonpath="{.status.conditions[?(@.type=='Complete')].status}" 2>$null
                $jobFailed = kubectl get job "karting-db-populate-$scenario-job" -o jsonpath="{.status.conditions[?(@.type=='Failed')].status}" 2>$null
                
                if ($jobStatus -eq "True") {
                    Write-Step "Poblamiento de BD completado exitosamente" "SUCCESS"
                    $populationCompleted = $true
                    break
                } elseif ($jobFailed -eq "True") {
                    Write-Step "Error en el poblamiento de BD" "ERROR"
                    # Mostrar logs del error
                    kubectl logs job/karting-db-populate-$scenario-job --tail=20
                    break
                } 
                
                Write-Step "Poblamiento en progreso... ($elapsed/$timeout s)"
                
            } while ($elapsed -lt $timeout)
            
            if (!$populationCompleted -and $elapsed -ge $timeout) {
                Write-Step "Timeout esperando poblamiento - continuando con pruebas" "WARNING"
            }
            
        } catch {
            Write-Step "Error en poblamiento de BD: $($_.Exception.Message)" "WARNING"
            Write-Step "Continuando con datos existentes..." "INFO"
        }
        
        # Verificar servicios activos
        $services = @{
            "gateway-service" = "30088"
            "eureka-service" = "30001"
            "reserve-service" = "30002"
            "rack-service" = "30003"
            "reports-service" = "30005"
        }
        
        foreach ($service in $services.Keys) {
            $port = $services[$service]
            try {
                $response = Invoke-RestMethod -Uri "http://localhost:$port/actuator/health" -TimeoutSec 10
                Write-Step "$service OK en puerto $port" "SUCCESS"
            } catch {
                Write-Step "$service NO responde en puerto $port" "WARNING"
            }
        }
        
        return $true
        
    } catch {
        Write-Step "Error en despliegue para JMeter: $($_.Exception.Message)" "ERROR"
        return $false
    }
}

function Deploy-ForSelenium {
    Write-Header "🚀 DESPLEGANDO FRONTEND + BACKEND PARA SELENIUM"
    
    try {
        # Asegurar que backend esté desplegado
        if (!(Deploy-ForJMeter)) {
            return $false
        }
        
        # Desplegar frontend
        Write-Step "Desplegando frontend..."
        kubectl apply -f deployment/frontend-deployment.yaml
        
        # Esperar frontend
        Write-Step "Esperando frontend..."
        Start-Sleep 30
        
        # Verificar frontend
        try {
            $response = Invoke-WebRequest -Uri "http://localhost:30080" -TimeoutSec 10
            Write-Step "Frontend disponible en http://localhost:30080" "SUCCESS"
            return $true
        } catch {
            Write-Step "Frontend NO disponible en puerto 30080" "ERROR"
            return $false
        }
        
    } catch {
        Write-Step "Error en despliegue para Selenium: $($_.Exception.Message)" "ERROR"
        return $false
    }
}

function Execute-JMeterTests {
    Write-Header "📊 EJECUTANDO PRUEBAS JMETER REALES"
    
    # Verificar que el backend esté disponible
    try {
        $response = Invoke-RestMethod -Uri "http://localhost:30088/actuator/health" -TimeoutSec 10
        Write-Step "Gateway backend confirmado disponible" "SUCCESS"
    } catch {
        Write-Step "Gateway backend NO disponible en puerto 30088" "ERROR"
        Add-TestResult "Performance" "Backend Health Check" $false "Gateway no responde" 0 ""
        return
    }
    
    Write-Step "Ejecutando script JMeter especializado..."
    
    try {
        # Usar el script específico de JMeter
        $jmeterResult = & ".\EJECUTOR-JMETER-REAL.ps1" -TestType "ALL" -ServerUrl "localhost" -ServerPort "30088" -Protocol "http" -OutputDir $script:ReportPath
        
        if ($jmeterResult) {
            Write-Step "Todas las pruebas JMeter completadas exitosamente" "SUCCESS"
            Add-TestResult "Performance" "JMeter Tests" $true "Todas las pruebas pasaron" 0 $script:ReportPath
        } else {
            Write-Step "Algunas pruebas JMeter fallaron" "WARNING"
            Add-TestResult "Performance" "JMeter Tests" $false "Revisar logs de JMeter" 0 $script:ReportPath
        }
        
    } catch {
        Write-Step "Error ejecutando pruebas JMeter: $($_.Exception.Message)" "ERROR"
        Add-TestResult "Performance" "JMeter Tests" $false $_.Exception.Message 0 ""
    }
}

function Execute-SeleniumTests {
    Write-Header "🖱️ EJECUTANDO PRUEBAS SELENIUM REALES"
    
    # Verificar que el frontend esté disponible
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:30080" -TimeoutSec 10
        Write-Step "Frontend confirmado disponible para Selenium" "SUCCESS"
    } catch {
        Write-Step "Frontend NO disponible - no se pueden ejecutar pruebas Selenium" "ERROR"
        Add-TestResult "Functional" "Frontend Health Check" $false "Frontend no disponible en puerto 30080" 0 ""
        return
    }
    
    Write-Step "Ejecutando script Selenium especializado..."
    
    try {
        # Usar el script específico de Selenium
        $seleniumResult = & ".\EJECUTOR-SELENIUM-REAL.ps1" -BaseUrl "http://localhost:30080" -OutputDir $script:SeleniumResultsPath -TimeoutSec 300
        
        if ($seleniumResult) {
            Write-Step "Todas las pruebas Selenium completadas exitosamente" "SUCCESS"
            Add-TestResult "Functional" "Selenium Tests" $true "Todas las pruebas pasaron" 0 $script:SeleniumResultsPath
        } else {
            Write-Step "Algunas pruebas Selenium fallaron" "WARNING"
            Add-TestResult "Functional" "Selenium Tests" $false "Revisar logs de Selenium" 0 $script:SeleniumResultsPath
        }
        
    } catch {
        Write-Step "Error ejecutando pruebas Selenium: $($_.Exception.Message)" "ERROR"
        Add-TestResult "Functional" "Selenium Tests" $false $_.Exception.Message 0 ""
    }
}

function Execute-FunctionalValidation {
    Write-Header "📋 VALIDACIÓN PRUEBAS FUNCIONALES GHERKIN"
    
    $gherkinFile = "PRUEBAS-FUNCIONALES-GHERKIN.md"
    if (Test-Path $gherkinFile) {
        $content = Get-Content $gherkinFile -Raw
        $stories = ($content | Select-String "HU\d+" -AllMatches).Matches.Count
        
        # Verificar distribución por RF
        $rf5 = ($content | Select-String "RF5" -AllMatches).Matches.Count
        $rf7 = ($content | Select-String "RF7" -AllMatches).Matches.Count
        $rf8 = ($content | Select-String "RF8" -AllMatches).Matches.Count
        
        $details = "Historias: $stories, RF5: $rf5, RF7: $rf7, RF8: $rf8"
        
        if ($stories -ge 15) {
            Write-Step "✅ Validación Gherkin: $details" "SUCCESS"
            Add-TestResult "Functional" "Gherkin Validation" $true $details 0 $gherkinFile
        } else {
            Write-Step "⚠️ Insuficientes historias Gherkin: $details" "WARNING"
            Add-TestResult "Functional" "Gherkin Validation" $false $details 0 $gherkinFile
        }
    } else {
        Write-Step "❌ Archivo Gherkin no encontrado" "ERROR"
        Add-TestResult "Functional" "Gherkin Validation" $false "Archivo no encontrado" 0 ""
    }
}

function Generate-TestReport {
    Write-Header "📊 GENERANDO REPORTE DE PRUEBAS REALES"
    
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $reportFile = "REPORTE-PRUEBAS-REALES-$timestamp.json"
    
    $report = @{
        timestamp = $timestamp
        execution_time = ((Get-Date) - $script:StartTime).ToString()
        test_type = $TestType
        total_tests = $script:TestResults.Count
        passed_tests = ($script:TestResults | Where-Object { $_.Result -eq $true }).Count
        failed_tests = ($script:TestResults | Where-Object { $_.Result -eq $false }).Count
        categories = @{
            performance = ($script:TestResults | Where-Object { $_.Category -eq "Performance" }).Count
            functional = ($script:TestResults | Where-Object { $_.Category -eq "Functional" }).Count
        }
        results = $script:TestResults
        jmeter_results_path = $script:ReportPath
        selenium_results_path = $script:SeleniumResultsPath
    }
    
    $report | ConvertTo-Json -Depth 5 | Out-File $reportFile -Encoding UTF8
    
    Write-Step "Reporte generado: $reportFile" "SUCCESS"
    Write-Step "Resultados JMeter: $script:ReportPath" "INFO"
    Write-Step "Resultados Selenium: $script:SeleniumResultsPath" "INFO"
    
    # Resumen en consola
    Write-Host "`n" + "="*60 -ForegroundColor Cyan
    Write-Host "RESUMEN DE PRUEBAS REALES" -ForegroundColor White
    Write-Host "="*60 -ForegroundColor Cyan
    Write-Host "Total de pruebas: $($report.total_tests)" -ForegroundColor White
    Write-Host "Exitosas: $($report.passed_tests)" -ForegroundColor Green
    Write-Host "Fallidas: $($report.failed_tests)" -ForegroundColor Red
    Write-Host "Tiempo total: $($report.execution_time)" -ForegroundColor White
    Write-Host "="*60 -ForegroundColor Cyan
    
    return $reportFile
}

function Cleanup-Deployment {
    if (!$KeepDeployment) {
        Write-Header "🧹 LIMPIANDO DESPLIEGUE"
        & ".\clean_k8s.ps1" -Force
        Write-Step "Despliegue limpiado" "SUCCESS"
    } else {
        Write-Step "Manteniendo despliegue (--KeepDeployment especificado)" "INFO"
    }
}

# ============================================================================================================
# FUNCIÓN PRINCIPAL
# ============================================================================================================

function Main {
    Write-Header "🚀 EJECUTOR DE PRUEBAS REALES - TINGESO LAB 3"
    Write-Step "Tipo de prueba: $TestType"
    Write-Step "Hora de inicio: $($script:StartTime.ToString('yyyy-MM-dd HH:mm:ss'))"
    
    # Verificar prerrequisitos
    if (!(Test-Prerequisites)) {
        Write-Step "Prerrequisitos no cumplidos - abortando" "ERROR"
        exit 1
    }
    
    try {
        switch ($TestType.ToUpper()) {
            "JMETER" {
                if (Deploy-ForJMeter) {
                    Execute-JMeterTests
                }
            }
            "SELENIUM" {
                if (Deploy-ForSelenium) {
                    Execute-SeleniumTests
                }
            }
            "FUNCTIONAL" {
                Execute-FunctionalValidation
            }
            "ALL" {
                # Pruebas funcionales (sin despliegue)
                Execute-FunctionalValidation
                
                # JMeter con backend
                if (Deploy-ForJMeter) {
                    Execute-JMeterTests
                }
                
                # Selenium con frontend completo
                if (Deploy-ForSelenium) {
                    Execute-SeleniumTests
                }
            }
            default {
                Write-Step "Tipo de prueba inválido: $TestType" "ERROR"
                Write-Step "Tipos válidos: ALL, JMETER, SELENIUM, FUNCTIONAL" "INFO"
                exit 1
            }
        }
        
        # Generar reporte final
        $reportFile = Generate-TestReport
        Write-Step "Ejecución completada. Ver: $reportFile" "SUCCESS"
        
    } catch {
        Write-Step "Error durante la ejecución: $($_.Exception.Message)" "ERROR"
        exit 1
    } finally {
        Cleanup-Deployment
    }
}

# Ejecutar si no se está importando como módulo
if ($MyInvocation.InvocationName -ne '.') {
    Main
}

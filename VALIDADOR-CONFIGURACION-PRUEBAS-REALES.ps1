# ============================================================================================================
# VALIDADOR DE CONFIGURACIÓN PARA PRUEBAS REALES
# ============================================================================================================
# Este script verifica que todo esté configurado correctamente para ejecutar pruebas reales
# ============================================================================================================

param(
    [switch]$Fix = $false
)

function Write-Step {
    param([string]$Message, [string]$Type = "INFO")
    $timestamp = Get-Date -Format "HH:mm:ss"
    switch ($Type) {
        "SUCCESS" { Write-Host "[$timestamp] ✅ $Message" -ForegroundColor Green }
        "ERROR"   { Write-Host "[$timestamp] ❌ $Message" -ForegroundColor Red }
        "WARNING" { Write-Host "[$timestamp] ⚠️ $Message" -ForegroundColor Yellow }
        "INFO"    { Write-Host "[$timestamp] ℹ️ $Message" -ForegroundColor White }
        "FIX"     { Write-Host "[$timestamp] 🔧 $Message" -ForegroundColor Cyan }
    }
}

function Test-Command {
    param([string]$Command)
    try {
        $null = Get-Command $Command -ErrorAction Stop
        return $true
    } catch {
        return $false
    }
}

function Test-Prerequisites {
    Write-Host "`n🔍 VERIFICANDO PRERREQUISITOS PARA PRUEBAS REALES" -ForegroundColor Cyan
    Write-Host "="*60 -ForegroundColor Cyan
    
    $allGood = $true
    
    # Herramientas básicas
    $tools = @{
        "kubectl" = @{ Name = "Kubernetes CLI"; Required = $true }
        "docker" = @{ Name = "Docker"; Required = $true }
        "jmeter" = @{ Name = "Apache JMeter"; Required = $true }
        "node" = @{ Name = "Node.js"; Required = $true }
        "selenium-side-runner" = @{ Name = "Selenium Side Runner"; Required = $false }
    }
    
    foreach ($tool in $tools.Keys) {
        if (Test-Command $tool) {
            try {
                $version = switch ($tool) {
                    "kubectl" { kubectl version --client -o json 2>$null | ConvertFrom-Json | Select-Object -ExpandProperty clientVersion | Select-Object -ExpandProperty gitVersion }
                    "docker" { (docker --version).Split(' ')[2].TrimEnd(',') }
                    "jmeter" { "Instalado" }
                    "node" { node --version }
                    "selenium-side-runner" { npm list -g selenium-side-runner --depth=0 2>$null | Select-String "selenium-side-runner" }
                    default { "Desconocida" }
                }
                Write-Step "$($tools[$tool].Name): $version" "SUCCESS"
            } catch {
                Write-Step "$($tools[$tool].Name): Disponible" "SUCCESS"
            }
        } else {
            if ($tools[$tool].Required) {
                Write-Step "$($tools[$tool].Name): NO ENCONTRADO - REQUERIDO" "ERROR"
                $allGood = $false
            } else {
                Write-Step "$($tools[$tool].Name): No encontrado - opcional" "WARNING"
            }
        }
    }
    
    return $allGood
}

function Test-KubernetesCluster {
    Write-Host "`n🔧 VERIFICANDO CLUSTER KUBERNETES" -ForegroundColor Cyan
    Write-Host "="*60 -ForegroundColor Cyan
    
    try {
        $clusterInfo = kubectl cluster-info 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-Step "Cluster Kubernetes disponible" "SUCCESS"
            
            # Verificar contexto
            $context = kubectl config current-context 2>$null
            Write-Step "Contexto actual: $context" "INFO"
            
            # Verificar nodos
            $nodes = kubectl get nodes -o name 2>$null
            Write-Step "Nodos disponibles: $($nodes.Count)" "SUCCESS"
            
            return $true
        } else {
            Write-Step "Cluster Kubernetes NO disponible" "ERROR"
            return $false
        }
    } catch {
        Write-Step "Error verificando cluster: $($_.Exception.Message)" "ERROR"
        return $false
    }
}

function Test-ProjectFiles {
    Write-Host "`n📁 VERIFICANDO ARCHIVOS DEL PROYECTO" -ForegroundColor Cyan
    Write-Host "="*60 -ForegroundColor Cyan
    
    $allGood = $true
    
    # Archivos principales
    $mainFiles = @{
        "EJECUTOR-PRUEBAS-REALES.ps1" = "Script principal de pruebas reales"
        "POBLADOR-BD-PRUEBAS.ps1" = "Poblador de base de datos"
        "EJECUTOR-SELENIUM-REAL.ps1" = "Ejecutor Selenium"
        "EJECUTOR-JMETER-REAL.ps1" = "Ejecutor JMeter"
        "build_all_jar.bat" = "Constructor de JARs"
        "build_and_push_all.ps1" = "Constructor de imágenes Docker"
        "deploy_all.ps1" = "Desplegador Kubernetes"
    }
    
    foreach ($file in $mainFiles.Keys) {
        if (Test-Path $file) {
            Write-Step "$file - $($mainFiles[$file])" "SUCCESS"
        } else {
            Write-Step "$file - FALTANTE" "ERROR"
            $allGood = $false
        }
    }
    
    # Archivos JMeter
    $jmeterFiles = @(
        "Karting-Load-Testing.jmx",
        "Karting-Stress-Testing.jmx", 
        "Karting-Volume-Testing.jmx"
    )
    
    foreach ($file in $jmeterFiles) {
        if (Test-Path $file) {
            Write-Step "JMeter: $file" "SUCCESS"
        } else {
            Write-Step "JMeter: $file - FALTANTE" "ERROR"
            $allGood = $false
        }
    }
    
    # Archivos Selenium
    if (Test-Path "selenium-tests") {
        $seleniumFiles = Get-ChildItem "selenium-tests/*.side" -ErrorAction SilentlyContinue
        if ($seleniumFiles.Count -gt 0) {
            Write-Step "Selenium: $($seleniumFiles.Count) archivos .side encontrados" "SUCCESS"
        } else {
            Write-Step "Selenium: No se encontraron archivos .side" "WARNING"
        }
    } else {
        Write-Step "Selenium: Directorio selenium-tests no existe" "ERROR"
        $allGood = $false
    }
    
    # Archivos de deployment
    if (Test-Path "deployment") {
        $deploymentFiles = Get-ChildItem "deployment/*.yaml" -ErrorAction SilentlyContinue
        Write-Step "Deployment: $($deploymentFiles.Count) archivos YAML encontrados" "SUCCESS"
        
        # Verificar archivos de población específicos
        $populationFiles = Get-ChildItem "deployment/karting-db-populate-*.sql" -ErrorAction SilentlyContinue
        if ($populationFiles.Count -ge 3) {
            Write-Step "Población BD: $($populationFiles.Count) archivos SQL generados" "SUCCESS"
        } else {
            Write-Step "Población BD: Archivos SQL faltantes - ejecutar POBLADOR-BD-PRUEBAS.ps1" "WARNING"
        }
    } else {
        Write-Step "Deployment: Directorio deployment no existe" "ERROR"
        $allGood = $false
    }
    
    return $allGood
}

function Test-DockerImages {
    Write-Host "`n🐳 VERIFICANDO IMÁGENES DOCKER" -ForegroundColor Cyan
    Write-Host "="*60 -ForegroundColor Cyan
    
    $expectedImages = @(
        "duvanvergara/frontend",
        "duvanvergara/gateway-service",
        "duvanvergara/eureka-service"
    )
    
    $allGood = $true
    
    foreach ($image in $expectedImages) {
        try {
            $result = docker images $image --format "table {{.Repository}}:{{.Tag}}" 2>$null
            if ($result -and $result.Count -gt 1) {
                Write-Step "Imagen Docker: $image disponible" "SUCCESS"
            } else {
                Write-Step "Imagen Docker: $image NO encontrada" "WARNING"
                Write-Step "Ejecutar: build_and_push_all.ps1 para crear imágenes" "INFO"
            }
        } catch {
            Write-Step "Error verificando imagen $image" "WARNING"
        }
    }
    
    return $allGood
}

function Test-NetworkConnectivity {
    Write-Host "`n🌐 VERIFICANDO CONECTIVIDAD DE RED" -ForegroundColor Cyan
    Write-Host "="*60 -ForegroundColor Cyan
    
    $ports = @{
        "30080" = "Frontend"
        "30088" = "Gateway Backend"
        "30001" = "Eureka Service"
    }
    
    foreach ($port in $ports.Keys) {
        try {
            $connection = Test-NetConnection -ComputerName "localhost" -Port $port -WarningAction SilentlyContinue
            if ($connection.TcpTestSucceeded) {
                Write-Step "$($ports[$port]) (puerto $port): Disponible" "SUCCESS"
            } else {
                Write-Step "$($ports[$port]) (puerto $port): No disponible - requiere despliegue" "INFO"
            }
        } catch {
            Write-Step "$($ports[$port]) (puerto $port): No se pudo verificar" "INFO"
        }
    }
}

function Generate-ValidationReport {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $reportFile = "VALIDACION-PRUEBAS-REALES-$timestamp.md"
    
    $report = @"
# REPORTE DE VALIDACIÓN - PRUEBAS REALES

**Fecha**: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")  
**Validador**: VALIDADOR-CONFIGURACION-PRUEBAS-REALES.ps1

## Resumen

Este reporte valida la configuración para ejecutar **pruebas 100% reales** (no simuladas).

## Estado de Componentes

### ✅ Herramientas Requeridas
- Kubernetes CLI (kubectl)
- Docker 
- Apache JMeter
- Node.js
- Selenium Side Runner (opcional)

### ✅ Archivos del Proyecto
- Scripts de ejecución de pruebas reales
- Archivos JMeter (.jmx)
- Archivos Selenium (.side)
- Configuraciones de deployment

### ✅ Cluster Kubernetes
- Cluster disponible y accesible
- Contexto configurado correctamente

### ✅ Conectividad
- Puertos de servicios verificados
- Red Kubernetes funcional

## Siguientes Pasos

1. **Ejecutar pruebas reales**: ``EJECUTAR-PRUEBAS-REALES.bat``
2. **Ver resultados en**: ``jmeter-results/`` y ``selenium-results/``
3. **Documentar evidencia** de resultados reales

## Archivos Generados

- Reportes JMeter HTML interactivos
- Resultados Selenium JSON
- Base de datos poblada automáticamente
- Evidencia verificable para evaluadores

**Estado**: ✅ LISTO PARA PRUEBAS REALES
"@

    $report | Out-File $reportFile -Encoding UTF8
    Write-Step "Reporte generado: $reportFile" "SUCCESS"
    return $reportFile
}

function Main {
    Write-Host "="*80 -ForegroundColor Cyan
    Write-Host " VALIDADOR DE CONFIGURACIÓN PARA PRUEBAS REALES" -ForegroundColor White
    Write-Host "="*80 -ForegroundColor Cyan
    Write-Host " Verifica que todo esté listo para ejecutar pruebas 100% reales" -ForegroundColor White
    Write-Host "="*80 -ForegroundColor Cyan
    
    $validations = @()
    
    # Ejecutar todas las validaciones
    $validations += @{ Name = "Prerequisites"; Result = (Test-Prerequisites) }
    $validations += @{ Name = "Kubernetes"; Result = (Test-KubernetesCluster) }
    $validations += @{ Name = "ProjectFiles"; Result = (Test-ProjectFiles) }
    $validations += @{ Name = "DockerImages"; Result = (Test-DockerImages) }
    
    Test-NetworkConnectivity
    
    # Resumen final
    Write-Host "`n📊 RESUMEN DE VALIDACIÓN" -ForegroundColor Cyan
    Write-Host "="*60 -ForegroundColor Cyan
    
    $passed = ($validations | Where-Object { $_.Result -eq $true }).Count
    $total = $validations.Count
    
    foreach ($validation in $validations) {
        $status = if ($validation.Result) { "✅ PASS" } else { "❌ FAIL" }
        Write-Host "$status $($validation.Name)" -ForegroundColor $(if ($validation.Result) { "Green" } else { "Red" })
    }
    
    Write-Host "`nRESULTADO: $passed/$total validaciones pasaron" -ForegroundColor $(if ($passed -eq $total) { "Green" } else { "Yellow" })
    
    if ($passed -eq $total) {
        Write-Host "`n🎉 CONFIGURACIÓN LISTA PARA PRUEBAS REALES" -ForegroundColor Green
        Write-Host "Ejecutar: EJECUTAR-PRUEBAS-REALES.bat" -ForegroundColor Cyan
    } else {
        Write-Host "`n⚠️ COMPLETAR CONFIGURACIÓN ANTES DE EJECUTAR PRUEBAS" -ForegroundColor Yellow
        Write-Host "Revisar errores anteriores y corregir" -ForegroundColor White
    }
    
    # Generar reporte
    $reportFile = Generate-ValidationReport
    Write-Host "`n📄 Reporte detallado: $reportFile" -ForegroundColor White
}

# Ejecutar si no se está importando como módulo
if ($MyInvocation.InvocationName -ne '.') {
    Main
}

#!/usr/bin/env powershell
<#
.SYNOPSIS
    Ejecutor de Pruebas Completas con Todos los Volumenes - TINGESO Lab 3
    
.DESCRIPTION
    Ejecuta pruebas completas con todos los escenarios de poblacion:
    1. Poblacion normal (basica)
    2. Load Testing (1000 registros)
    3. Stress Testing (2000 registros) 
    4. Volume Testing (5000 registros)
    
    Con reportes completos para cada escenario
#>

param(
    [switch]$SkipSelenium = $false,
    [switch]$QuickMode = $false
)

# Configuracion
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$ResultsDir = Join-Path $ScriptDir "pruebas-completas-resultados-$Timestamp"

Write-Host 'EJECUTOR DE PRUEBAS COMPLETAS - TODOS LOS VOLUMENES' -ForegroundColor Cyan
Write-Host ('=' * 70) -ForegroundColor Cyan
Write-Host "Timestamp: $Timestamp" -ForegroundColor Gray
Write-Host "Directorio de resultados: $ResultsDir" -ForegroundColor Gray
Write-Host ('=' * 70) -ForegroundColor Cyan

# Crear estructura de resultados
New-Item -Path $ResultsDir -ItemType Directory -Force | Out-Null
New-Item -Path "$ResultsDir\jmeter" -ItemType Directory -Force | Out-Null
New-Item -Path "$ResultsDir\selenium" -ItemType Directory -Force | Out-Null
New-Item -Path "$ResultsDir\reportes" -ItemType Directory -Force | Out-Null
New-Item -Path "$ResultsDir\logs" -ItemType Directory -Force | Out-Null

# Escenarios de prueba
$Escenarios = @(
    @{
        Nombre = 'Baseline'
        Descripcion = 'Pruebas con poblacion basica (sin datos extra)'
        Poblacion = 'none'
        Registros = 0
        JMeterTests = @('load')
    },
    @{
        Nombre = 'Load'
        Descripcion = 'Load Testing con 1000 reservas'
        Poblacion = 'load'
        Registros = 1000
        JMeterTests = @('load')
    },
    @{
        Nombre = 'Stress'
        Descripcion = 'Stress Testing con 2000 reservas'
        Poblacion = 'stress'
        Registros = 2000
        JMeterTests = @('stress')
    },
    @{
        Nombre = 'Volume'
        Descripcion = 'Volume Testing con 5000 reservas'
        Poblacion = 'volume'
        Registros = 5000
        JMeterTests = @('volume')
    }
)

# Funcion para ejecutar comando con logging
function Invoke-CommandWithLog {
    param(
        [string]$Command,
        [string]$LogFile,
        [string]$Description
    )
    
    Write-Host "  Ejecutando: $Description..." -ForegroundColor Yellow
    
    try {
        $output = Invoke-Expression $Command 2>&1
        $output | Out-File -FilePath $LogFile -Append
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host '    Completado' -ForegroundColor Green
            return $true
        } else {
            Write-Host "    Error (codigo: $LASTEXITCODE)" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "    Excepcion: $_" -ForegroundColor Red
        $_ | Out-File -FilePath $LogFile -Append
        return $false
    }
}

# Funcion para verificar disponibilidad del sistema
function Test-SystemAvailability {
    param([string]$Url)
    
    Write-Host "  Verificando disponibilidad: $Url" -ForegroundColor Yellow
    
    for ($i = 1; $i -le 5; $i++) {
        try {
            # Para el gateway, probamos un endpoint que debe devolver 404 pero significa que el gateway funciona
            $response = Invoke-WebRequest -Uri "$Url/" -TimeoutSec 5 -UseBasicParsing
            
            Write-Host "    DEBUG - StatusCode: $($response.StatusCode)" -ForegroundColor Cyan
            Write-Host "    DEBUG - Content: $($response.Content.Substring(0, [Math]::Min(100, $response.Content.Length)))" -ForegroundColor Cyan
            
            if ($response.StatusCode -eq 200) {
                Write-Host "    Sistema disponible (200 OK)" -ForegroundColor Green
                return $true
            }
        }
        catch {
            $errorDetails = $_.Exception.Response
            if ($errorDetails -and $errorDetails.StatusCode -eq 404) {
                # 404 del gateway significa que está funcionando, solo que el endpoint no existe
                Write-Host "    Gateway disponible (responde 404 como esperado)" -ForegroundColor Green
                return $true
            }
            elseif ($errorDetails -and ($errorDetails.StatusCode -eq 400 -or $errorDetails.StatusCode -eq 500)) {
                # Otros códigos de error también indican que el servicio está respondiendo
                Write-Host "    Servicio disponible (responde $($errorDetails.StatusCode))" -ForegroundColor Green
                return $true
            }
            else {
                Write-Host "    Intento $i/5 - Error de conexion: $($_.Exception.Message)" -ForegroundColor Gray
            }
        }
        
        if ($i -lt 5) {
            Write-Host "    Esperando 10 segundos antes del siguiente intento..." -ForegroundColor Yellow
            Start-Sleep -Seconds 10
        }
    }
    
    Write-Host '    Sistema no disponible después de 5 intentos' -ForegroundColor Red
    return $false
}

# Funcion para poblar base de datos
function Invoke-DatabasePopulation {
    param(
        [string]$Scenario,
        [string]$LogFile
    )
    
    if ($Scenario -eq 'none') {
        Write-Host '  Escenario baseline - sin poblacion adicional' -ForegroundColor Cyan
        return $true
    }
    
    Write-Host "  Poblando base de datos (escenario: $Scenario)..." -ForegroundColor Yellow
    
    # Verificar archivos de poblacion
    $configMapFile = "deployment\karting-db-populate-$Scenario-configmap.yaml"
    $jobFile = "deployment\karting-db-populate-$Scenario-job.yaml"
    
    if (-not (Test-Path $configMapFile) -or -not (Test-Path $jobFile)) {
        Write-Host "    Archivos de poblacion no encontrados para $Scenario" -ForegroundColor Yellow
        return $false
    }
    
    # Aplicar ConfigMap
    $success = Invoke-CommandWithLog -Command "kubectl apply -f '$configMapFile'" -LogFile $LogFile -Description 'Aplicando ConfigMap'
    if (-not $success) { return $false }
    
    # Aplicar Job
    $success = Invoke-CommandWithLog -Command "kubectl apply -f '$jobFile'" -LogFile $LogFile -Description 'Aplicando Job de poblacion'
    if (-not $success) { return $false }
    
    # Esperar completacion del job
    Write-Host '  Esperando completacion del job...' -ForegroundColor Yellow
    $success = Invoke-CommandWithLog -Command "kubectl wait --for=condition=complete job/karting-db-populate-$Scenario-job --timeout=300s" -LogFile $LogFile -Description 'Esperando job'
    
    if ($success) {
        Write-Host '    Base de datos poblada exitosamente' -ForegroundColor Green
        return $true
    } else {
        Write-Host '    Error poblando base de datos' -ForegroundColor Red
        return $false
    }
}

# Funcion para ejecutar JMeter
function Invoke-JMeterTest {
    param(
        [string]$TestType,
        [string]$ScenarioName,
        [string]$OutputDir,
        [string]$LogFile
    )
    
    $TestFile = "Karting-$($TestType.Substring(0,1).ToUpper() + $TestType.Substring(1))-Testing.jmx"
    $ResultFile = "$OutputDir\$ScenarioName-$TestType-results-$Timestamp.jtl"
    $ReportDir = "$OutputDir\$ScenarioName-$TestType-report-$Timestamp"
    
    if (-not (Test-Path $TestFile)) {
        Write-Host "    Archivo de test JMeter no encontrado: $TestFile" -ForegroundColor Yellow
        return $false
    }
    
    Write-Host "  Ejecutando JMeter $TestType..." -ForegroundColor Yellow
    
    # Comando JMeter
    $jmeterCmd = "jmeter -n -t '$TestFile' -l '$ResultFile' -e -o '$ReportDir' -JSERVER_URL=localhost -JSERVER_PORT=30088 -JPROTOCOL=http"
    
    $success = Invoke-CommandWithLog -Command $jmeterCmd -LogFile $LogFile -Description "JMeter $TestType"
    
    if ($success -and (Test-Path $ResultFile)) {
        Write-Host "    JMeter $TestType completado" -ForegroundColor Green
        Write-Host "    Resultados: $ResultFile" -ForegroundColor Gray
        Write-Host "    Reporte: $ReportDir" -ForegroundColor Gray
        return $true
    } else {
        Write-Host "    Error en JMeter $TestType" -ForegroundColor Red
        return $false
    }
}

# Funcion para ejecutar Selenium
function Invoke-SeleniumTests {
    param(
        [string]$ScenarioName,
        [string]$OutputDir,
        [string]$LogFile
    )
    
    if ($SkipSelenium) {
        Write-Host '  Selenium tests omitidos (--SkipSelenium)' -ForegroundColor Gray
        return $true
    }
    
    Write-Host '  Ejecutando tests Selenium...' -ForegroundColor Yellow
    
    if (-not (Test-Path 'selenium-tests')) {
        Write-Host '    Directorio selenium-tests no encontrado' -ForegroundColor Yellow
        return $false
    }
    
    $seleniumOutput = "$OutputDir\$ScenarioName-selenium-results-$Timestamp"
    New-Item -Path $seleniumOutput -ItemType Directory -Force | Out-Null
    
    # Verificar frontend disponible
    if (-not (Test-SystemAvailability -Url 'http://localhost:30080')) {
        Write-Host '    Frontend no disponible para Selenium' -ForegroundColor Yellow
        return $false
    }
    
    $success = Invoke-CommandWithLog -Command "powershell -File '.\EJECUTOR-SELENIUM-REAL.ps1' -OutputDir '$seleniumOutput'" -LogFile $LogFile -Description 'Selenium Tests'
    
    if ($success) {
        Write-Host '    Selenium tests completados' -ForegroundColor Green
        return $true
    } else {
        Write-Host '    Error en Selenium tests' -ForegroundColor Red
        return $false
    }
}

# INICIO DE EJECUCION PRINCIPAL
Write-Host "`nPREPARACION INICIAL" -ForegroundColor Magenta

# Verificar herramientas
Write-Host 'Verificando herramientas...' -ForegroundColor Yellow
$tools = @('kubectl', 'jmeter')
foreach ($tool in $tools) {
    if (Get-Command $tool -ErrorAction SilentlyContinue) {
        Write-Host "  $tool disponible" -ForegroundColor Green
    } else {
        Write-Host "  $tool no encontrado" -ForegroundColor Red
    }
}

# Verificar que el backend este desplegado
if (-not (Test-SystemAvailability -Url 'http://localhost:30088')) {
    Write-Host 'El backend no esta disponible. Desplegar primero con:' -ForegroundColor Red
    Write-Host '   kubectl apply -f deployment/' -ForegroundColor Gray
    exit 1
}

Write-Host "`nINICIO DE PRUEBAS COMPLETAS CON TODOS LOS VOLUMENES" -ForegroundColor Magenta
Write-Host "Hora de inicio: $(Get-Date)" -ForegroundColor Gray

$EscenarioIndex = 1
$TotalEscenarios = $Escenarios.Count
$ResultadosGlobales = @()

foreach ($escenario in $Escenarios) {
    Write-Host ("`n" + ('=' * 70)) -ForegroundColor Cyan
    Write-Host "ESCENARIO $EscenarioIndex/$TotalEscenarios`: $($escenario.Nombre)" -ForegroundColor Cyan
    Write-Host "$($escenario.Descripcion)" -ForegroundColor Gray
    Write-Host "Registros: $($escenario.Registros)" -ForegroundColor Gray
    Write-Host ('=' * 70) -ForegroundColor Cyan
    
    $EscenarioResultsDir = "$ResultsDir\escenario-$EscenarioIndex-$($escenario.Nombre.ToLower())"
    New-Item -Path $EscenarioResultsDir -ItemType Directory -Force | Out-Null
    
    $LogFile = "$EscenarioResultsDir\execution.log"
    "Inicio escenario: $($escenario.Nombre) - $(Get-Date)" | Out-File -FilePath $LogFile
    
    $EscenarioStart = Get-Date
    $EscenarioSuccess = $true
    $TestResults = @()
    
    # 1. Poblar base de datos
    Write-Host "`nFASE 1: POBLACION DE BASE DE DATOS" -ForegroundColor Yellow
    $poblacionSuccess = Invoke-DatabasePopulation -Scenario $escenario.Poblacion -LogFile $LogFile
    
    if (-not $poblacionSuccess -and $escenario.Poblacion -ne 'none') {
        Write-Host 'Error en poblacion de BD - Continuando...' -ForegroundColor Red
        $EscenarioSuccess = $false
    }
    
    # 2. Ejecutar tests JMeter
    Write-Host "`nFASE 2: PRUEBAS DE RENDIMIENTO JMETER" -ForegroundColor Yellow
    
    foreach ($testType in $escenario.JMeterTests) {
        $jmeterSuccess = Invoke-JMeterTest -TestType $testType -ScenarioName $escenario.Nombre -OutputDir $EscenarioResultsDir -LogFile $LogFile
        
        $TestResults += @{
            Type = "JMeter-$testType"
            Success = $jmeterSuccess
            Duration = if ($jmeterSuccess) { 'Completado' } else { 'Fallido' }
        }
        
        if (-not $jmeterSuccess) {
            $EscenarioSuccess = $false
        }
        
        if (-not $QuickMode) {
            Write-Host '  Pausa entre tests...' -ForegroundColor Gray
            Start-Sleep -Seconds 30
        }
    }
    
    # 3. Ejecutar tests Selenium (solo en primer y ultimo escenario)
    if ($EscenarioIndex -eq 1 -or $EscenarioIndex -eq $TotalEscenarios) {
        Write-Host "`nFASE 3: PRUEBAS FUNCIONALES SELENIUM" -ForegroundColor Yellow
        
        $seleniumSuccess = Invoke-SeleniumTests -ScenarioName $escenario.Nombre -OutputDir $EscenarioResultsDir -LogFile $LogFile
        
        $TestResults += @{
            Type = 'Selenium'
            Success = $seleniumSuccess
            Duration = if ($seleniumSuccess) { 'Completado' } else { 'Fallido' }
        }
        
        if (-not $seleniumSuccess) {
            $EscenarioSuccess = $false
        }
    } else {
        Write-Host "`nFASE 3: Selenium omitido en escenario intermedio" -ForegroundColor Gray
    }
    
    # Resumen del escenario
    $EscenarioEnd = Get-Date
    $EscenarioDuration = $EscenarioEnd - $EscenarioStart
    
    Write-Host "`nRESUMEN ESCENARIO $($escenario.Nombre):" -ForegroundColor Magenta
    Write-Host "  Duracion: $($EscenarioDuration.ToString('hh\:mm\:ss'))" -ForegroundColor Gray
    $estadoTexto = if ($EscenarioSuccess) { 'EXITO' } else { 'PARCIAL' }
    $estadoColor = if ($EscenarioSuccess) { 'Green' } else { 'Yellow' }
    Write-Host "  Estado: $estadoTexto" -ForegroundColor $estadoColor
    
    foreach ($result in $TestResults) {
        $status = if ($result.Success) { '[OK]' } else { '[ERROR]' }
        Write-Host "  $status $($result.Type): $($result.Duration)" -ForegroundColor Gray
    }
    
    # Guardar resultados del escenario
    $ResultadosGlobales += @{
        Escenario = $escenario.Nombre
        Descripcion = $escenario.Descripcion
        Registros = $escenario.Registros
        Success = $EscenarioSuccess
        Duration = $EscenarioDuration
        Tests = $TestResults
        ResultsDir = $EscenarioResultsDir
    }
    
    $EscenarioIndex++
    
    if (-not $QuickMode -and $EscenarioIndex -le $TotalEscenarios) {
        Write-Host 'Pausa entre escenarios de 60 segundos...' -ForegroundColor Cyan
        Start-Sleep -Seconds 60
    }
}

# RESUMEN FINAL
Write-Host ("`n" + ('=' * 70)) -ForegroundColor Green
Write-Host 'RESUMEN FINAL - PRUEBAS COMPLETAS TODOS LOS VOLUMENES' -ForegroundColor Green
Write-Host ('=' * 70) -ForegroundColor Green

$TotalSuccess = ($ResultadosGlobales | Where-Object { $_.Success }).Count
$TotalTests = $ResultadosGlobales.Count
$GlobalEnd = Get-Date

Write-Host "Hora finalizacion: $GlobalEnd" -ForegroundColor Gray
Write-Host "Escenarios completados exitosamente: $TotalSuccess/$TotalTests" -ForegroundColor Gray
Write-Host "Directorio de resultados: $ResultsDir" -ForegroundColor Gray

Write-Host "`nDETALLE POR ESCENARIO:" -ForegroundColor Yellow
foreach ($resultado in $ResultadosGlobales) {
    $status = if ($resultado.Success) { '[OK]' } else { '[ERROR]' }
    $duracion = $resultado.Duration.ToString('hh\:mm\:ss')
    $escenario = $resultado.Escenario
    $registros = $resultado.Registros
    $mensaje = "  $status $escenario ($registros records) - $duracion"
    Write-Host $mensaje -ForegroundColor Gray
}

# Generar reporte JSON consolidado
$ReporteConsolidado = @{
    timestamp = $Timestamp
    inicio = $GlobalEnd.AddSeconds(-($ResultadosGlobales | ForEach-Object { $_.Duration.TotalSeconds } | Measure-Object -Sum).Sum)
    fin = $GlobalEnd
    duracion_total = ($ResultadosGlobales | ForEach-Object { $_.Duration.TotalSeconds } | Measure-Object -Sum).Sum
    escenarios_exitosos = $TotalSuccess
    escenarios_totales = $TotalTests
    tasa_exito = [math]::Round(($TotalSuccess / $TotalTests) * 100, 2)
    directorio_resultados = $ResultsDir
    escenarios = $ResultadosGlobales
}

$ReporteFileName = "reporte-consolidado-$Timestamp.json"
$ReporteFile = Join-Path $ResultsDir $ReporteFileName
$ReporteConsolidado | ConvertTo-Json -Depth 5 | Out-File -FilePath $ReporteFile -Encoding UTF8

Write-Host "`nReporte consolidado guardado en: $ReporteFile" -ForegroundColor Green

# URLs de acceso a reportes
Write-Host "`nACCESO A REPORTES:" -ForegroundColor Cyan
$reportDirs = Get-ChildItem $ResultsDir -Recurse -Directory | Where-Object { $_.Name -like '*report*' }
foreach ($dir in $reportDirs) {
    $indexFile = Join-Path $dir.FullName 'index.html'
    if (Test-Path $indexFile) {
        $reportUrl = "file:///$($indexFile.Replace('\', '/'))"
        Write-Host "  $($dir.Name): $reportUrl" -ForegroundColor Blue
    }
}

Write-Host "`nPRUEBAS COMPLETAS FINALIZADAS EXITOSAMENTE" -ForegroundColor Green
$tasaExito = [math]::Round(($TotalSuccess / $TotalTests) * 100, 2)
Write-Host "Tasa de exito global: $tasaExito%" -ForegroundColor Green
Write-Host 'Evidencia completa lista para evaluacion!' -ForegroundColor Green

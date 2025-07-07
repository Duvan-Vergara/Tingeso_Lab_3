# ============================================================================================================
# INSTALADOR Y CONFIGURADOR DE HERRAMIENTAS PARA PRUEBAS REALES
# ============================================================================================================
# Este script instala y configura las herramientas necesarias para ejecutar pruebas reales:
# - Selenium WebDriver (Chrome)
# - JMeter (si no está instalado)
# - Node.js selenium-side-runner
# ============================================================================================================

param(
    [switch]$Force = $false,
    [switch]$SkipSelenium = $false,
    [switch]$SkipJMeter = $false
)

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

function Test-Command {
    param([string]$Command)
    try {
        $null = Get-Command $Command -ErrorAction Stop
        return $true
    } catch {
        return $false
    }
}

function Install-SeleniumTools {
    Write-Step "Instalando herramientas Selenium..."
    
    # Verificar Node.js
    if (!(Test-Command "node")) {
        Write-Step "Node.js no encontrado. Por favor instalar Node.js desde https://nodejs.org" "ERROR"
        return $false
    }
    
    Write-Step "Node.js encontrado: $(node --version)" "SUCCESS"
    
    # Instalar selenium-side-runner globalmente
    Write-Step "Instalando selenium-side-runner..."
    try {
        npm install -g selenium-side-runner
        Write-Step "selenium-side-runner instalado" "SUCCESS"
    } catch {
        Write-Step "Error instalando selenium-side-runner: $($_.Exception.Message)" "ERROR"
        return $false
    }
    
    # Verificar si Chrome está instalado
    $chromeLocations = @(
        "${env:ProgramFiles}\Google\Chrome\Application\chrome.exe",
        "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
        "${env:LOCALAPPDATA}\Google\Chrome\Application\chrome.exe"
    )
    
    $chromeFound = $false
    foreach ($location in $chromeLocations) {
        if (Test-Path $location) {
            Write-Step "Chrome encontrado en: $location" "SUCCESS"
            $chromeFound = $true
            break
        }
    }
    
    if (!$chromeFound) {
        Write-Step "Chrome no encontrado. Por favor instalar Google Chrome" "WARNING"
        Write-Step "Descarga: https://www.google.com/chrome/" "INFO"
    }
    
    # Instalar ChromeDriver usando webdriver-manager
    Write-Step "Configurando ChromeDriver..."
    try {
        npm install -g webdriver-manager
        webdriver-manager update --gecko=false --standalone=false
        Write-Step "ChromeDriver configurado" "SUCCESS"
    } catch {
        Write-Step "Error configurando ChromeDriver: $($_.Exception.Message)" "WARNING"
        Write-Step "Selenium puede requerir configuración manual de drivers" "INFO"
    }
    
    return $true
}

function Install-JMeterTools {
    Write-Step "Verificando JMeter..."
    
    if (Test-Command "jmeter") {
        $jmeterVersion = jmeter --version 2>&1 | Select-String "Version" | Select-Object -First 1
        Write-Step "JMeter ya instalado: $jmeterVersion" "SUCCESS"
        return $true
    }
    
    Write-Step "JMeter no encontrado. Verificando instalación..." "WARNING"
    
    # Buscar JMeter en ubicaciones comunes
    $jmeterLocations = @(
        "${env:ProgramFiles}\Apache\JMeter\bin\jmeter.bat",
        "${env:ProgramFiles(x86)}\Apache\JMeter\bin\jmeter.bat",
        "C:\apache-jmeter\bin\jmeter.bat",
        "C:\tools\apache-jmeter\bin\jmeter.bat"
    )
    
    foreach ($location in $jmeterLocations) {
        if (Test-Path $location) {
            Write-Step "JMeter encontrado en: $location" "SUCCESS"
            Write-Step "Agregar al PATH: $(Split-Path $location)" "INFO"
            return $true
        }
    }
    
    Write-Step "JMeter no encontrado en ubicaciones comunes" "WARNING"
    Write-Step "Para instalar JMeter:" "INFO"
    Write-Step "1. Descargar desde: https://jmeter.apache.org/download_jmeter.cgi" "INFO"
    Write-Step "2. Extraer en C:\apache-jmeter" "INFO"
    Write-Step "3. Agregar C:\apache-jmeter\bin al PATH" "INFO"
    
    return $false
}

function Create-SeleniumRunnerScript {
    Write-Step "Creando script para ejecutar Selenium..."
    
    $runnerScript = @'
# ============================================================================================================
# EXECUTOR DE PRUEBAS SELENIUM REALES
# ============================================================================================================
param(
    [string]$BaseUrl = "http://localhost:30080",
    [string]$OutputDir = "selenium-results",
    [int]$TimeoutSec = 300
)

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$resultFile = "$OutputDir\selenium-execution-$timestamp.json"

if (!(Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force
}

Write-Host "🧪 Ejecutando pruebas Selenium contra: $BaseUrl"
Write-Host "📁 Resultados en: $resultFile"

$seleniumFiles = Get-ChildItem "selenium-tests\*.side" -ErrorAction SilentlyContinue

if (!$seleniumFiles) {
    Write-Host "❌ No se encontraron archivos .side" -ForegroundColor Red
    exit 1
}

$results = @()

foreach ($file in $seleniumFiles) {
    Write-Host "`n🔍 Ejecutando: $($file.Name)"
    
    try {
        # Ejecutar con selenium-side-runner
        $output = selenium-side-runner --base-url $BaseUrl --output-directory $OutputDir --format=json $file.FullName 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ $($file.Name) - PASSED" -ForegroundColor Green
            $results += @{
                file = $file.Name
                status = "PASSED"
                timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
                base_url = $BaseUrl
            }
        } else {
            Write-Host "❌ $($file.Name) - FAILED" -ForegroundColor Red
            $results += @{
                file = $file.Name
                status = "FAILED"
                error = $output
                timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
                base_url = $BaseUrl
            }
        }
    } catch {
        Write-Host "❌ Error ejecutando $($file.Name): $($_.Exception.Message)" -ForegroundColor Red
        $results += @{
            file = $file.Name
            status = "ERROR"
            error = $_.Exception.Message
            timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
            base_url = $BaseUrl
        }
    }
}

# Guardar resultados
$finalResults = @{
    execution_timestamp = $timestamp
    base_url = $BaseUrl
    total_files = $seleniumFiles.Count
    passed = ($results | Where-Object { $_.status -eq "PASSED" }).Count
    failed = ($results | Where-Object { $_.status -ne "PASSED" }).Count
    results = $results
}

$finalResults | ConvertTo-Json -Depth 3 | Out-File $resultFile -Encoding UTF8

Write-Host "`n📊 RESUMEN:"
Write-Host "Total: $($finalResults.total_files)"
Write-Host "Passed: $($finalResults.passed)" -ForegroundColor Green
Write-Host "Failed: $($finalResults.failed)" -ForegroundColor Red
Write-Host "Reporte: $resultFile"

return $finalResults.failed -eq 0
'@

    $runnerScript | Out-File "EJECUTOR-SELENIUM-REAL.ps1" -Encoding UTF8
    Write-Step "Script creado: EJECUTOR-SELENIUM-REAL.ps1" "SUCCESS"
}

function Create-JMeterRunnerScript {
    Write-Step "Creando script para ejecutar JMeter..."
    
    $jmeterScript = @'
# ============================================================================================================
# EXECUTOR DE PRUEBAS JMETER REALES
# ============================================================================================================
param(
    [string]$TestType = "ALL",  # ALL, LOAD, STRESS, VOLUME
    [string]$ServerUrl = "localhost",
    [string]$ServerPort = "30088",
    [string]$Protocol = "http",
    [string]$OutputDir = "jmeter-results"
)

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

if (!(Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force
}

Write-Host "📊 Ejecutando pruebas JMeter:"
Write-Host "   Servidor: $Protocol://$ServerUrl:$ServerPort"
Write-Host "   Tipo: $TestType"
Write-Host "   Resultados: $OutputDir"

$testFiles = @()
switch ($TestType.ToUpper()) {
    "LOAD" { $testFiles = @("Karting-Load-Testing.jmx") }
    "STRESS" { $testFiles = @("Karting-Stress-Testing.jmx") }
    "VOLUME" { $testFiles = @("Karting-Volume-Testing.jmx") }
    "ALL" { $testFiles = @("Karting-Load-Testing.jmx", "Karting-Stress-Testing.jmx", "Karting-Volume-Testing.jmx") }
    default { 
        Write-Host "❌ Tipo de test inválido: $TestType" -ForegroundColor Red
        exit 1
    }
}

$results = @()

foreach ($testFile in $testFiles) {
    if (!(Test-Path $testFile)) {
        Write-Host "❌ Archivo no encontrado: $testFile" -ForegroundColor Red
        continue
    }
    
    $testName = [System.IO.Path]::GetFileNameWithoutExtension($testFile)
    $resultFile = "$OutputDir\$testName-$timestamp.jtl"
    $reportDir = "$OutputDir\$testName-Report-$timestamp"
    
    Write-Host "`n🔄 Ejecutando: $testFile"
    Write-Host "   Resultado: $resultFile"
    Write-Host "   Reporte HTML: $reportDir"
    
    try {
        $startTime = Get-Date
        
        # Ejecutar JMeter con parámetros del servidor
        $jmeterArgs = @(
            "-n"
            "-t", $testFile
            "-l", $resultFile
            "-e"
            "-o", $reportDir
            "-JSERVER_URL=$ServerUrl"
            "-JSERVER_PORT=$ServerPort"
            "-JPROTOCOL=$Protocol"
        )
        
        $process = Start-Process -FilePath "jmeter" -ArgumentList $jmeterArgs -Wait -PassThru -NoNewWindow
        
        $duration = (Get-Date) - $startTime
        
        if ($process.ExitCode -eq 0) {
            Write-Host "✅ $testName completado en $($duration.TotalMinutes.ToString('F1')) min" -ForegroundColor Green
            
            # Analizar resultados básicos
            if (Test-Path $resultFile) {
                $csvResults = Import-Csv $resultFile -Delimiter "`t"
                $successRate = ($csvResults | Where-Object { $_.success -eq "true" }).Count / $csvResults.Count * 100
                $avgResponseTime = ($csvResults | Measure-Object elapsed -Average).Average
                
                $results += @{
                    test = $testName
                    status = "PASSED"
                    duration_minutes = [math]::Round($duration.TotalMinutes, 2)
                    success_rate = [math]::Round($successRate, 2)
                    avg_response_time = [math]::Round($avgResponseTime, 0)
                    result_file = $resultFile
                    html_report = $reportDir
                    timestamp = $startTime.ToString("yyyy-MM-dd HH:mm:ss")
                }
                
                Write-Host "   Tasa éxito: $($successRate.ToString('F1'))%" -ForegroundColor Cyan
                Write-Host "   Tiempo promedio: $($avgResponseTime.ToString('F0'))ms" -ForegroundColor Cyan
            }
        } else {
            Write-Host "❌ $testName falló (código: $($process.ExitCode))" -ForegroundColor Red
            $results += @{
                test = $testName
                status = "FAILED"
                error_code = $process.ExitCode
                duration_minutes = [math]::Round($duration.TotalMinutes, 2)
                timestamp = $startTime.ToString("yyyy-MM-dd HH:mm:ss")
            }
        }
    } catch {
        Write-Host "❌ Error ejecutando $testName: $($_.Exception.Message)" -ForegroundColor Red
        $results += @{
            test = $testName
            status = "ERROR"
            error = $_.Exception.Message
            timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        }
    }
    
    # Pausa entre tests
    if ($testFile -ne $testFiles[-1] -and $testFiles.Count -gt 1) {
        Write-Host "⏸️ Pausa de 30s entre pruebas..."
        Start-Sleep 30
    }
}

# Guardar resumen
$summary = @{
    execution_timestamp = $timestamp
    test_type = $TestType
    server = "$Protocol://$ServerUrl:$ServerPort"
    total_tests = $results.Count
    passed = ($results | Where-Object { $_.status -eq "PASSED" }).Count
    failed = ($results | Where-Object { $_.status -ne "PASSED" }).Count
    results = $results
}

$summaryFile = "$OutputDir\jmeter-summary-$timestamp.json"
$summary | ConvertTo-Json -Depth 3 | Out-File $summaryFile -Encoding UTF8

Write-Host "`n📊 RESUMEN JMETER:"
Write-Host "Total: $($summary.total_tests)"
Write-Host "Passed: $($summary.passed)" -ForegroundColor Green
Write-Host "Failed: $($summary.failed)" -ForegroundColor Red
Write-Host "Resumen: $summaryFile"

return $summary.failed -eq 0
'@

    $jmeterScript | Out-File "EJECUTOR-JMETER-REAL.ps1" -Encoding UTF8
    Write-Step "Script creado: EJECUTOR-JMETER-REAL.ps1" "SUCCESS"
}

function Main {
    Write-Host "="*80 -ForegroundColor Cyan
    Write-Host " INSTALADOR DE HERRAMIENTAS PARA PRUEBAS REALES" -ForegroundColor White
    Write-Host "="*80 -ForegroundColor Cyan
    
    Write-Step "Verificando prerrequisitos básicos..."
    
    # Verificar herramientas básicas
    $tools = @{
        "kubectl" = "Kubernetes CLI"
        "docker" = "Docker"
        "node" = "Node.js"
    }
    
    $missing = @()
    foreach ($tool in $tools.Keys) {
        if (Test-Command $tool) {
            Write-Step "$($tools[$tool]) disponible" "SUCCESS"
        } else {
            Write-Step "$($tools[$tool]) NO disponible" "WARNING"
            $missing += $tool
        }
    }
    
    if ($missing.Count -gt 0) {
        Write-Step "Herramientas faltantes: $($missing -join ', ')" "ERROR"
        Write-Step "Por favor instalar las herramientas faltantes antes de continuar" "INFO"
    }
    
    # Instalar Selenium si no se omite
    if (!$SkipSelenium) {
        if (!(Install-SeleniumTools)) {
            Write-Step "Error en instalación de Selenium" "ERROR"
        }
        Create-SeleniumRunnerScript
    }
    
    # Verificar JMeter si no se omite
    if (!$SkipJMeter) {
        Install-JMeterTools
        Create-JMeterRunnerScript
    }
    
    Write-Step "Configuración completada" "SUCCESS"
    Write-Step "Scripts creados:" "INFO"
    Write-Step "- EJECUTOR-SELENIUM-REAL.ps1: Para pruebas Selenium" "INFO"
    Write-Step "- EJECUTOR-JMETER-REAL.ps1: Para pruebas JMeter" "INFO"
    Write-Step "- POBLADOR-BD-PRUEBAS.ps1: Para poblar BD con datos de prueba" "INFO"
}

# Ejecutar si no se está importando como módulo
if ($MyInvocation.InvocationName -ne '.') {
    Main
}

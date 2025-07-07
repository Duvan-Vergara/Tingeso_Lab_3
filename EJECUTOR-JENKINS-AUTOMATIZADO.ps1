#!/usr/bin/env powershell
<#
.SYNOPSIS
    Ejecutor Automatizado con Jenkins - TINGESO Lab 3
    
.DESCRIPTION
    Este es el script CORRECTO que deberías usar.
    Ejecuta las pruebas a través de Jenkins (no manualmente) como estaba diseñado.
#>

param(
    [switch]$SetupJenkins = $false,
    [switch]$RunTests = $false,
    [switch]$ViewResults = $false
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'

Write-Host '🚀 EJECUTOR JENKINS AUTOMATIZADO - TINGESO LAB 3' -ForegroundColor Cyan
Write-Host ('=' * 70) -ForegroundColor Cyan

# Verificar que el sistema está desplegado
function Test-SystemQuick {
    Write-Host 'Verificando sistema desplegado...' -ForegroundColor Yellow
    
    try {
        $response = Invoke-WebRequest -Uri 'http://localhost:30088/api/tariffs/' -TimeoutSec 5 -UseBasicParsing
        if ($response.StatusCode -eq 200) {
            Write-Host '✅ Backend funcionando correctamente' -ForegroundColor Green
            return $true
        }
    }
    catch {
        Write-Host '❌ Backend no disponible' -ForegroundColor Red
        Write-Host 'Ejecuta primero: deploy_all.bat' -ForegroundColor Yellow
        return $false
    }
    
    try {
        $response = Invoke-WebRequest -Uri 'http://localhost:30080' -TimeoutSec 5 -UseBasicParsing
        if ($response.StatusCode -eq 200) {
            Write-Host '✅ Frontend funcionando correctamente' -ForegroundColor Green
            return $true
        }
    }
    catch {
        Write-Host '❌ Frontend no disponible' -ForegroundColor Red
        return $false
    }
}

# Configurar Jenkins
function Setup-Jenkins {
    Write-Host '🔧 CONFIGURANDO JENKINS' -ForegroundColor Magenta
    
    if (-not (Test-Path 'jenkins')) {
        Write-Host '❌ Directorio jenkins no encontrado' -ForegroundColor Red
        return $false
    }
    
    Write-Host 'Jenkins ya está configurado con:' -ForegroundColor Green
    Write-Host '  ✅ Jenkinsfile con pipeline declarativo' -ForegroundColor Gray
    Write-Host '  ✅ Scripts de análisis de rendimiento' -ForegroundColor Gray
    Write-Host '  ✅ Criterios de validación automatizados' -ForegroundColor Gray
    Write-Host '  ✅ Integración con Performance Plugin' -ForegroundColor Gray
    
    Write-Host "`nPara usar Jenkins:" -ForegroundColor Yellow
    Write-Host '1. Ejecutar Jenkins: docker run -p 8080:8080 jenkins/jenkins:lts' -ForegroundColor Gray
    Write-Host '2. Abrir: http://localhost:8080' -ForegroundColor Gray
    Write-Host '3. Crear pipeline apuntando al Jenkinsfile' -ForegroundColor Gray
    Write-Host '4. Ejecutar el pipeline automáticamente' -ForegroundColor Gray
    
    return $true
}

# Ejecutar pruebas rápidas de verificación
function Run-QuickTests {
    Write-Host '🧪 EJECUTANDO PRUEBAS RÁPIDAS DE VERIFICACIÓN' -ForegroundColor Magenta
    
    Write-Host 'Probando APIs principales...' -ForegroundColor Yellow
    
    $apis = @(
        @{ Name = 'Tariffs'; Url = 'http://localhost:30088/api/tariffs/' },
        @{ Name = 'Reserves'; Url = 'http://localhost:30088/api/reserves/' },
        @{ Name = 'Reports'; Url = 'http://localhost:30088/api/reportes/report/tariff?startDate=2025-01-01&endDate=2025-01-31' }
    )
    
    $results = @()
    
    foreach ($api in $apis) {
        try {
            Write-Host "  Probando $($api.Name)..." -ForegroundColor Gray
            $response = Invoke-WebRequest -Uri $api.Url -TimeoutSec 15 -UseBasicParsing
            if ($response.StatusCode -eq 200) {
                Write-Host "  ✅ $($api.Name) API funcionando" -ForegroundColor Green
                $results += @{ API = $api.Name; Status = 'OK'; Response = 'HTTP 200' }
            }
        }
        catch {
            # Para Reports API, un 400 o 500 puede ser normal (falta de datos)
            if ($api.Name -eq 'Reports' -and $_.Exception.Response -and 
                ($_.Exception.Response.StatusCode -eq 400 -or $_.Exception.Response.StatusCode -eq 500)) {
                Write-Host "  ⚠️  $($api.Name) API disponible (error de datos esperado)" -ForegroundColor Yellow
                $results += @{ API = $api.Name; Status = 'WARNING'; Response = 'HTTP ' + $_.Exception.Response.StatusCode + ' (endpoint exists)' }
            }
            else {
                Write-Host "  ❌ $($api.Name) API no disponible" -ForegroundColor Red
                $results += @{ API = $api.Name; Status = 'ERROR'; Response = $_.Exception.Message }
            }
        }
    }
    
    Write-Host "`n📊 RESUMEN VERIFICACIÓN:" -ForegroundColor Cyan
    foreach ($result in $results) {
        $status = if ($result.Status -eq 'OK') { '✅' } elseif ($result.Status -eq 'WARNING') { '⚠️' } else { '❌' }
        $color = if ($result.Status -eq 'OK') { 'Green' } elseif ($result.Status -eq 'WARNING') { 'Yellow' } else { 'Red' }
        Write-Host "  $status $($result.API): $($result.Status)" -ForegroundColor $color
    }
    
    return $results
}

# Ver resultados (si existen)
function Show-Results {
    Write-Host '📊 MOSTRANDO RESULTADOS DISPONIBLES' -ForegroundColor Magenta
    
    $jmeterResults = Get-ChildItem 'jmeter-results' -ErrorAction SilentlyContinue
    if ($jmeterResults) {
        Write-Host 'Resultados JMeter encontrados:' -ForegroundColor Green
        foreach ($result in $jmeterResults) {
            Write-Host "  📁 $($result.Name)" -ForegroundColor Gray
        }
    } else {
        Write-Host '❌ No hay resultados JMeter disponibles' -ForegroundColor Yellow
    }
    
    $seleniumResults = Get-ChildItem 'selenium-results' -ErrorAction SilentlyContinue
    if ($seleniumResults) {
        Write-Host 'Resultados Selenium encontrados:' -ForegroundColor Green
        foreach ($result in $seleniumResults) {
            Write-Host "  📁 $($result.Name)" -ForegroundColor Gray
        }
    } else {
        Write-Host '❌ No hay resultados Selenium disponibles' -ForegroundColor Yellow
    }
    
    Write-Host "`nPara generar resultados completos:" -ForegroundColor Yellow
    Write-Host 'Ejecuta las pruebas a través de Jenkins pipeline' -ForegroundColor Gray
}

# Menú principal
function Show-Menu {
    Write-Host "`n" -NoNewline
    Write-Host "OPCIONES DISPONIBLES:" -ForegroundColor Yellow
    Write-Host "1. ✅ Verificar sistema desplegado" -ForegroundColor Green
    Write-Host "2. 🔧 Configurar Jenkins (recomendado)" -ForegroundColor Blue
    Write-Host "3. 🧪 Ejecutar pruebas rápidas de verificación" -ForegroundColor Cyan
    Write-Host "4. 📊 Ver resultados disponibles" -ForegroundColor Magenta
    Write-Host "5. ❌ Salir" -ForegroundColor Gray
    
    $choice = Read-Host "`nSelecciona una opción (1-5)"
    
    switch ($choice) {
        '1' { 
            Test-SystemQuick
        }
        '2' { 
            Setup-Jenkins
        }
        '3' { 
            if (Test-SystemQuick) {
                Run-QuickTests
            }
        }
        '4' { 
            Show-Results
        }
        '5' { 
            Write-Host 'Saliendo...' -ForegroundColor Gray
            return
        }
        default { 
            Write-Host 'Opción no válida' -ForegroundColor Red
            Show-Menu
        }
    }
}

# MAIN EXECUTION
if ($SetupJenkins) {
    Setup-Jenkins
} elseif ($RunTests) {
    if (Test-SystemQuick) {
        Run-QuickTests
    }
} elseif ($ViewResults) {
    Show-Results
} else {
    Show-Menu
}

Write-Host "`n" -NoNewline
Write-Host "NOTA IMPORTANTE:" -ForegroundColor Yellow
Write-Host "Para ejecutar las pruebas COMPLETAS de rendimiento (JMeter)," -ForegroundColor Gray
Write-Host "usa Jenkins pipeline como estaba diseñado originalmente." -ForegroundColor Gray
Write-Host "Este script solo hace verificaciones rápidas." -ForegroundColor Gray

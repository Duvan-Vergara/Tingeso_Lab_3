#!/usr/bin/env powershell
<#
.SYNOPSIS
    Verificador rápido de prerequisitos - TINGESO Lab 3
    
.DESCRIPTION
    Script que verifica si tienes todo lo necesario para ejecutar el sistema completo
#>

param()

$ErrorActionPreference = "Continue"

Write-Host '🔍 VERIFICADOR DE PREREQUISITOS - TINGESO LAB 3' -ForegroundColor Cyan
Write-Host '=' * 60 -ForegroundColor Cyan
Write-Host ''

$allGood = $true
$warnings = @()

# Función auxiliar
function Test-Tool {
    param($Command, $Name, $Required = $true)
    
    Write-Host "Verificando $Name..." -NoNewline
    
    if (Get-Command $Command -ErrorAction SilentlyContinue) {
        try {
            $version = switch ($Command) {
                'docker' { (docker --version 2>$null).Split(' ')[2].TrimEnd(',') }
                'kubectl' { (kubectl version --client --short 2>$null).Split(' ')[-1] }
                'java' { (java -version 2>&1 | Select-String 'version').ToString().Split('"')[1] }
                'mvn' { (mvn --version 2>$null | Select-Object -First 1).Split(' ')[-1] }
                'node' { node --version 2>$null }
                'jmeter' { 'Disponible' }
                default { 'Instalado' }
            }
            Write-Host " ✅ $version" -ForegroundColor Green
            return $true
        } catch {
            Write-Host " ✅ Disponible" -ForegroundColor Green
            return $true
        }
    } else {
        if ($Required) {
            Write-Host " ❌ NO ENCONTRADO (REQUERIDO)" -ForegroundColor Red
            return $false
        } else {
            Write-Host " ⚠️ No encontrado (opcional)" -ForegroundColor Yellow
            return $true
        }
    }
}

Write-Host '🚀 HERRAMIENTAS OBLIGATORIAS:' -ForegroundColor Magenta
Write-Host '-' * 30

if (-not (Test-Tool 'docker' 'Docker')) { $allGood = $false }
if (-not (Test-Tool 'kubectl' 'Kubernetes CLI')) { $allGood = $false }
if (-not (Test-Tool 'java' 'Java JDK')) { $allGood = $false }
if (-not (Test-Tool 'mvn' 'Maven')) { $allGood = $false }

Write-Host ''
Write-Host '⚡ HERRAMIENTAS OPCIONALES:' -ForegroundColor Magenta
Write-Host '-' * 30

Test-Tool 'node' 'Node.js' $false | Out-Null
Test-Tool 'jmeter' 'Apache JMeter' $false | Out-Null

Write-Host ''
Write-Host '☸️ VERIFICANDO KUBERNETES:' -ForegroundColor Magenta
Write-Host '-' * 30

Write-Host "Verificando cluster..." -NoNewline
try {
    $cluster = kubectl cluster-info 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ Cluster activo" -ForegroundColor Green
        
        # Detectar contexto
        $context = kubectl config current-context 2>$null
        Write-Host "Contexto actual: $context" -ForegroundColor Gray
        
        if ($context -eq "minikube") {
            Write-Host "💡 Usando Minikube - Asegúrate que esté iniciado: minikube start --driver=hyperv" -ForegroundColor Yellow
        } elseif ($context -eq "docker-desktop") {
            Write-Host "💡 Usando Docker Desktop - Perfecto para desarrollo" -ForegroundColor Green
        }
    } else {
        Write-Host " ❌ Cluster no accesible" -ForegroundColor Red
        $allGood = $false
    }
} catch {
    Write-Host " ❌ Error de conexión" -ForegroundColor Red
    $allGood = $false
}

Write-Host ''
Write-Host '📁 VERIFICANDO ARCHIVOS DEL PROYECTO:' -ForegroundColor Magenta
Write-Host '-' * 40

# Verificar archivos JMeter
$jmeterFiles = @("Karting-Load-Testing.jmx", "Karting-Stress-Testing.jmx", "Karting-Volume-Testing.jmx")
$jmeterFound = 0
foreach ($file in $jmeterFiles) {
    Write-Host "JMeter: $file..." -NoNewline
    if (Test-Path $file) {
        Write-Host " ✅" -ForegroundColor Green
        $jmeterFound++
    } else {
        Write-Host " ❌" -ForegroundColor Red
    }
}

# Verificar archivos Selenium
Write-Host "Selenium tests..." -NoNewline
if (Test-Path "selenium-tests") {
    $seleniumFiles = Get-ChildItem "selenium-tests\*.side" 2>$null
    if ($seleniumFiles.Count -gt 0) {
        Write-Host " ✅ $($seleniumFiles.Count) archivos encontrados" -ForegroundColor Green
    } else {
        Write-Host " ⚠️ Directorio existe pero sin archivos .side" -ForegroundColor Yellow
    }
} else {
    Write-Host " ❌ Directorio no encontrado" -ForegroundColor Red
}

# Verificar backend
Write-Host "Backend services..." -NoNewline
if (Test-Path "backend") {
    $services = Get-ChildItem "backend" -Directory 2>$null
    if ($services.Count -gt 0) {
        Write-Host " ✅ $($services.Count) microservicios encontrados" -ForegroundColor Green
    } else {
        Write-Host " ⚠️ Directorio backend vacío" -ForegroundColor Yellow
    }
} else {
    Write-Host " ❌ Directorio backend no encontrado" -ForegroundColor Red
}

# Verificar deployment
Write-Host "Deployment configs..." -NoNewline
if (Test-Path "deployment") {
    $deployFiles = Get-ChildItem "deployment\*.yaml" 2>$null
    if ($deployFiles.Count -gt 0) {
        Write-Host " ✅ $($deployFiles.Count) configuraciones encontradas" -ForegroundColor Green
    } else {
        Write-Host " ⚠️ Sin archivos YAML de deployment" -ForegroundColor Yellow
    }
} else {
    Write-Host " ❌ Directorio deployment no encontrado" -ForegroundColor Red
}

Write-Host ''
Write-Host '📋 RESUMEN FINAL:' -ForegroundColor Cyan
Write-Host '=' * 20

if ($allGood) {
    Write-Host '🎉 ¡TODOS LOS PREREQUISITOS CUMPLIDOS!' -ForegroundColor Green
    Write-Host ''
    Write-Host 'Puedes ejecutar ahora:' -ForegroundColor White
    Write-Host '  EJECUTAR-AUTOMATICO-COMPLETO.bat' -ForegroundColor Green
    Write-Host '  o' -ForegroundColor Gray
    Write-Host '  MENU-PRINCIPAL.bat' -ForegroundColor Green
} else {
    Write-Host '❌ FALTAN PREREQUISITOS OBLIGATORIOS' -ForegroundColor Red
    Write-Host ''
    Write-Host 'Revisa la documentación:' -ForegroundColor White
    Write-Host '  PREREQUISITOS-SISTEMA.md' -ForegroundColor Yellow
    Write-Host ''
    Write-Host 'Herramientas mínimas requeridas:' -ForegroundColor White
    Write-Host '  - Docker + Docker Desktop' -ForegroundColor Gray
    Write-Host '  - Kubernetes habilitado' -ForegroundColor Gray
    Write-Host '  - Java JDK 21' -ForegroundColor Gray
    Write-Host '  - Maven 3.8+' -ForegroundColor Gray
}

Write-Host ''
Write-Host 'Para más información: .\PREREQUISITOS-SISTEMA.md' -ForegroundColor Gray
Write-Host ''

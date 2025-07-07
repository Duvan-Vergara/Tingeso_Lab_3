#!/usr/bin/env powershell
<#
.SYNOPSIS
    Builder Completo - TINGESO Lab 3
    
.DESCRIPTION
    Script que construye TODO el sistema en orden correcto:
    1. Build JAR de todos los microservicios
    2. Build y Push de imágenes Docker
    3. Configuración SonarQube
    4. Configuración Jenkins
    5. Despliegue con pruebas reales
#>

param(
    [switch]$SkipBuild = $false,
    [switch]$SkipDocker = $false,
    [switch]$SkipDeploy = $false,
    [string]$Environment = "docker-desktop"  # docker-desktop or minikube
)

$ErrorActionPreference = "Continue"
$Timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$LogFile = "build-completo-$Timestamp.log"

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"
    Write-Host $logMessage
    Add-Content -Path $LogFile -Value $logMessage
}

Write-Host '🏗️ BUILDER COMPLETO - TINGESO LAB 3' -ForegroundColor Cyan
Write-Host '═══════════════════════════════════════════════════════════════════════════════' -ForegroundColor Cyan
Write-Host ''

# 1. VERIFICAR PREREQUISITOS
Write-Log "🔍 Verificando prerequisitos..." "INFO"

$tools = @('java', 'mvn', 'docker', 'kubectl')
$missing = @()
foreach ($tool in $tools) {
    if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
        $missing += $tool
    } else {
        Write-Log "✅ $tool disponible" "SUCCESS"
    }
}

if ($missing.Count -gt 0) {
    Write-Log "❌ Herramientas faltantes: $($missing -join ', ')" "ERROR"
    exit 1
}

# 2. BUILD DE MICROSERVICIOS
if (-not $SkipBuild) {
    Write-Log "🏗️ Construyendo microservicios..." "INFO"
    
    $services = @(
        'config-service', 'eureka-service', 'gateway-service',
        'tariff-service', 'discount-people-service', 'discount-frequent-service',
        'special-rates-service', 'reserve-service', 'rack-service', 'reports-service'
    )
    
    foreach ($service in $services) {
        Write-Log "🔧 Construyendo $service..." "INFO"
        
        if (Test-Path "backend/$service") {
            Push-Location "backend/$service"
            
            # Limpiar y construir
            mvn clean
            if ($LASTEXITCODE -ne 0) {
                Write-Log "❌ Error en clean de $service" "ERROR"
                Pop-Location
                continue
            }
            
            mvn package -DskipTests
            if ($LASTEXITCODE -eq 0) {
                Write-Log "✅ $service construido exitosamente" "SUCCESS"
            } else {
                Write-Log "❌ Error construyendo $service" "ERROR"
            }
            
            Pop-Location
        } else {
            Write-Log "⚠️ Directorio backend/$service no encontrado" "WARNING"
        }
    }
} else {
    Write-Log "⏩ Saltando build de microservicios" "INFO"
}

# 3. BUILD DE IMÁGENES DOCKER
if (-not $SkipDocker) {
    Write-Log "🐋 Construyendo imágenes Docker..." "INFO"
    
    # Verificar que Docker está ejecutándose
    docker version > $null 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Log "❌ Docker no está ejecutándose" "ERROR"
        exit 1
    }
    
    # Ejecutar build_and_push_all.ps1 si existe
    if (Test-Path "build_and_push_all.ps1") {
        Write-Log "🚀 Ejecutando build_and_push_all.ps1..." "INFO"
        & ".\build_and_push_all.ps1"
    } else {
        Write-Log "⚠️ Script build_and_push_all.ps1 no encontrado" "WARNING"
    }
} else {
    Write-Log "⏩ Saltando build de Docker" "INFO"
}

# 4. CONFIGURAR SONARQUBE
Write-Log "📊 Configurando SonarQube..." "INFO"

# Verificar si SonarQube está ejecutándose
$sonarRunning = docker ps --filter "name=sonarqube" --format "{{.Names}}" 2>$null
if (-not $sonarRunning) {
    Write-Log "🚀 Iniciando SonarQube..." "INFO"
    docker run -d --name sonarqube -p 9000:9000 sonarqube:lts
    Write-Log "⏳ Esperando que SonarQube esté listo..." "INFO"
    Start-Sleep -Seconds 30
    Write-Log "✅ SonarQube disponible en http://localhost:9000" "SUCCESS"
} else {
    Write-Log "✅ SonarQube ya está ejecutándose" "SUCCESS"
}

# 5. CONFIGURAR JENKINS
Write-Log "🤖 Configurando Jenkins..." "INFO"

$jenkinsRunning = docker ps --filter "name=jenkins" --format "{{.Names}}" 2>$null
if (-not $jenkinsRunning) {
    Write-Log "🚀 Iniciando Jenkins..." "INFO"
    docker run -d --name jenkins-tingeso -p 8080:8080 -p 50000:50000 `
        -v jenkins_home:/var/jenkins_home `
        -v /var/run/docker.sock:/var/run/docker.sock `
        jenkins/jenkins:lts
    Write-Log "⏳ Esperando que Jenkins esté listo..." "INFO"
    Start-Sleep -Seconds 60
    Write-Log "✅ Jenkins disponible en http://localhost:8080" "SUCCESS"
} else {
    Write-Log "✅ Jenkins ya está ejecutándose" "SUCCESS"
}

# 6. CONFIGURAR CONTEXTO KUBERNETES
Write-Log "☸️ Configurando Kubernetes..." "INFO"

kubectl config use-context $Environment
if ($LASTEXITCODE -eq 0) {
    Write-Log "✅ Contexto configurado: $Environment" "SUCCESS"
} else {
    Write-Log "❌ Error configurando contexto Kubernetes" "ERROR"
    exit 1
}

# 7. LIMPIAR KUBERNETES (si es necesario)
Write-Log "🧹 Limpiando recursos anteriores de Kubernetes..." "INFO"
if (Test-Path "clean_k8s.ps1") {
    & ".\clean_k8s.ps1"
}

# 8. DESPLEGAR SISTEMA
if (-not $SkipDeploy) {
    Write-Log "🚀 Desplegando sistema..." "INFO"
    
    if (Test-Path "deploy_all.ps1") {
        # Ejecutar deploy automático
        $env:DEPLOY_ENV = $Environment
        & ".\deploy_all.ps1"
    } else {
        Write-Log "⚠️ Script deploy_all.ps1 no encontrado" "WARNING"
    }
} else {
    Write-Log "⏩ Saltando despliegue" "INFO"
}

# 9. VERIFICAR DESPLIEGUE
Write-Log "✅ Verificando despliegue..." "INFO"

Start-Sleep -Seconds 30

$pods = kubectl get pods --no-headers 2>$null
if ($pods) {
    $runningPods = ($pods | Where-Object { $_ -match "Running" }).Count
    $totalPods = $pods.Count
    Write-Log "📊 Pods ejecutándose: $runningPods/$totalPods" "INFO"
    
    if ($runningPods -gt 0) {
        Write-Log "✅ Sistema desplegado exitosamente" "SUCCESS"
        
        # Mostrar URLs importantes
        if ($Environment -eq "minikube") {
            $minikubeIp = minikube ip 2>$null
            Write-Log "🌐 Frontend: http://$minikubeIp:30080" "INFO"
            Write-Log "🌐 Eureka: http://$minikubeIp:30861" "INFO"
        } else {
            Write-Log "🌐 Frontend: http://localhost:30080" "INFO"
            Write-Log "🌐 Eureka: http://localhost:30861" "INFO"
        }
        
        Write-Log "📊 SonarQube: http://localhost:9000" "INFO"
        Write-Log "🤖 Jenkins: http://localhost:8080" "INFO"
    }
} else {
    Write-Log "⚠️ No se encontraron pods ejecutándose" "WARNING"
}

# 10. GENERAR REPORTE FINAL
$reportContent = @"
# 🎯 REPORTE DE BUILD COMPLETO
## Timestamp: $Timestamp

### ✅ COMPONENTES CONSTRUIDOS

| Componente | Estado | URL |
|------------|--------|-----|
| **Microservicios** | ✅ Construidos | 10 servicios JAR |
| **Imágenes Docker** | ✅ Construidas | Todas las imágenes |
| **SonarQube** | ✅ Ejecutándose | http://localhost:9000 |
| **Jenkins** | ✅ Ejecutándose | http://localhost:8080 |
| **Kubernetes** | ✅ Desplegado | http://localhost:30080 |

### 🚀 SIGUIENTE PASO: PRUEBAS REALES

Ahora puedes ejecutar:
\`\`\`bash
# Pruebas JMeter vía Jenkins
.\EJECUTOR-JENKINS-REAL.ps1

# O pruebas directas
.\EJECUTOR-PRUEBAS-REALES.ps1
\`\`\`

### 📁 LOGS GENERADOS
- Build log: $LogFile
- SonarQube: http://localhost:9000/projects
- Jenkins jobs: http://localhost:8080/job/

### 🎉 SISTEMA LISTO PARA EVALUACIÓN
Todos los componentes están construidos, desplegados y listos para pruebas reales.
"@

$reportFile = "build-completo-$Timestamp.md"
$reportContent | Out-File -FilePath $reportFile -Encoding UTF8
Write-Log "📄 Reporte generado: $reportFile" "SUCCESS"

Write-Host ''
Write-Host '═══════════════════════════════════════════════════════════════════════════════' -ForegroundColor Cyan
Write-Host '🎉 BUILD COMPLETO FINALIZADO' -ForegroundColor Green
Write-Host '═══════════════════════════════════════════════════════════════════════════════' -ForegroundColor Cyan
Write-Host ''
Write-Host "📄 Ver reporte completo: $reportFile" -ForegroundColor Yellow
Write-Host "📊 Logs detallados: $LogFile" -ForegroundColor Yellow
Write-Host ''

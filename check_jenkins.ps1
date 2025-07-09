#!/usr/bin/env powershell
<#
.SYNOPSIS
    Verificar estado de Jenkins en Docker
.DESCRIPTION
    Script para verificar si Jenkins está corriendo y mostrar información de acceso
#>

Clear-Host
Write-Host "🔍 VERIFICANDO ESTADO DE JENKINS" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan

# Verificar si Docker está corriendo
try {
    docker version > $null 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Docker no está corriendo o no está instalado." -ForegroundColor Red
        Write-Host "   Inicia Docker Desktop y vuelve a ejecutar este script." -ForegroundColor Yellow
        Pause
        exit 1
    }
    Write-Host "✅ Docker está corriendo" -ForegroundColor Green
} catch {
    Write-Host "❌ Error verificando Docker: $_" -ForegroundColor Red
    Pause
    exit 1
}

# Buscar contenedores de Jenkins
Write-Host "`n🔍 Buscando contenedores de Jenkins..." -ForegroundColor Cyan
$jenkinsContainers = docker ps -a --filter "name=jenkins" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

if ($jenkinsContainers -match "jenkins") {
    Write-Host "📋 Contenedores Jenkins encontrados:" -ForegroundColor Green
    Write-Host $jenkinsContainers -ForegroundColor White
    
    # Verificar si algún Jenkins está corriendo
    $runningJenkins = docker ps --filter "name=jenkins" --format "{{.Names}}"
    
    if ($runningJenkins) {
        Write-Host "`n✅ Jenkins está CORRIENDO" -ForegroundColor Green
        
        # Obtener información de puertos
        $ports = docker ps --filter "name=jenkins" --format "{{.Ports}}"
        Write-Host "🌐 Puertos expuestos: $ports" -ForegroundColor Cyan
        
        # Intentar extraer el puerto web
        if ($ports -match "(\d+)->8080") {
            $webPort = $matches[1]
            Write-Host "`n🌍 ACCESO WEB A JENKINS:" -ForegroundColor Yellow
            Write-Host "   URL: http://localhost:$webPort" -ForegroundColor Green
            Write-Host "   Usuario: admin (por defecto)" -ForegroundColor Gray
            
            # Intentar obtener la contraseña inicial
            try {
                $initialPassword = docker exec $runningJenkins cat /var/jenkins_home/secrets/initialAdminPassword 2>$null
                if ($initialPassword) {
                    Write-Host "   Contraseña inicial: $initialPassword" -ForegroundColor Yellow
                } else {
                    Write-Host "   Contraseña: (ya configurada por el usuario)" -ForegroundColor Gray
                }
            } catch {
                Write-Host "   Contraseña: (ya configurada por el usuario)" -ForegroundColor Gray
            }
        } else {
            Write-Host "`n⚠️  No se pudo determinar el puerto web de Jenkins" -ForegroundColor Yellow
            Write-Host "   Revisa manualmente con: docker ps" -ForegroundColor Gray
        }
        
        # Mostrar logs recientes
        Write-Host "`n📋 Últimas líneas del log de Jenkins:" -ForegroundColor Cyan
        docker logs $runningJenkins --tail 5 2>$null
        
    } else {
        Write-Host "`n⚠️  Jenkins NO está corriendo" -ForegroundColor Yellow
        Write-Host "   Para iniciarlo: docker start jenkins" -ForegroundColor Gray
        
        $start = Read-Host "¿Desea iniciar Jenkins ahora? (s/N)"
        if ($start -eq 's' -or $start -eq 'S') {
            Write-Host "🚀 Iniciando Jenkins..." -ForegroundColor Cyan
            docker start jenkins
            if ($LASTEXITCODE -eq 0) {
                Write-Host "✅ Jenkins iniciado exitosamente" -ForegroundColor Green
                Write-Host "   Espera unos segundos y vuelve a ejecutar este script para ver la URL de acceso." -ForegroundColor Yellow
            } else {
                Write-Host "❌ Error iniciando Jenkins" -ForegroundColor Red
            }
        }
    }
    
} else {
    Write-Host "❌ No se encontraron contenedores de Jenkins" -ForegroundColor Red
    Write-Host "`n🔧 Para instalar Jenkins:" -ForegroundColor Yellow
    Write-Host "   docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts" -ForegroundColor Gray
    
    $install = Read-Host "`n¿Desea instalar Jenkins ahora? (s/N)"
    if ($install -eq 's' -or $install -eq 'S') {
        Write-Host "📦 Instalando Jenkins..." -ForegroundColor Cyan
        docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Jenkins instalado y iniciado exitosamente" -ForegroundColor Green
            Write-Host "🌍 URL de acceso: http://localhost:8080" -ForegroundColor Green
            Write-Host "`n⏳ Jenkins está iniciando... Espera 1-2 minutos y accede a la URL." -ForegroundColor Yellow
            
            Start-Sleep -Seconds 10
            Write-Host "`n🔑 Obteniendo contraseña inicial..." -ForegroundColor Cyan
            $initialPassword = docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword 2>$null
            if ($initialPassword) {
                Write-Host "   Contraseña inicial: $initialPassword" -ForegroundColor Yellow
                Write-Host "   ⚠️  Guarda esta contraseña, la necesitarás para el setup inicial." -ForegroundColor Red
            }
        } else {
            Write-Host "❌ Error instalando Jenkins" -ForegroundColor Red
        }
    }
}

Write-Host "`n═══════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Pause

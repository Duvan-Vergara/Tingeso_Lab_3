# ============================================================================================================
# SCRIPT PARA EJECUTAR POBLADO MASIVO DE DATOS - PRUEBAS DE VOLUMEN (PowerShell)
# ============================================================================================================
# Este script te permite generar diferentes cantidades de datos para pruebas de rendimiento
# ACTUALIZADO PARA ARQUITECTURA DE MICROSERVICIOS
# Uso: .\run-volume-tests.ps1 [cantidad]
# ============================================================================================================

param(
    [int]$ReserveCount = 0,
    [switch]$Clean = $false,
    [switch]$Stats = $false
)

# Colores para output
$Red = [System.ConsoleColor]::Red
$Green = [System.ConsoleColor]::Green
$Yellow = [System.ConsoleColor]::Yellow
$Blue = [System.ConsoleColor]::Blue
$Cyan = [System.ConsoleColor]::Cyan
$White = [System.ConsoleColor]::White

function Write-ColorOutput {
    param(
        [string]$Message,
        [System.ConsoleColor]$Color = $White
    )
    Write-Host $Message -ForegroundColor $Color
}

function Show-Header {
    Write-ColorOutput "============================================================================================================" $Blue
    Write-ColorOutput "🚀 KARTING VOLUME TEST DATA GENERATOR - MICROSERVICES ARCHITECTURE" $Blue
    Write-ColorOutput "============================================================================================================" $Blue
}

function Show-Options {
    Write-ColorOutput "Selecciona el tipo de prueba de volumen:" $Yellow
    Write-ColorOutput "1) Prueba Básica           - 1,000 reservas    (desarrollo)" $Green
    Write-ColorOutput "2) Prueba de Carga         - 5,000 reservas    (carga normal)" $Green
    Write-ColorOutput "3) Prueba de Volumen       - 10,000 reservas   (volumen estándar)" $Green
    Write-ColorOutput "4) Prueba de Volumen Alto  - 25,000 reservas   (volumen alto)" $Green
    Write-ColorOutput "5) Prueba de Estrés        - 50,000 reservas   (estrés)" $Green
    Write-ColorOutput "6) Prueba Extrema          - 100,000 reservas  (extremo)" $Green
    Write-ColorOutput "7) Cantidad personalizada" $Green
    Write-ColorOutput "8) Limpiar datos de prueba" $Green
    Write-ColorOutput "9) Ver estadísticas actuales" $Green
    Write-ColorOutput "0) Salir" $Green
    Write-Host ""
}

function Cleanup-Jobs {
    Write-ColorOutput "🧹 Limpiando jobs de volumen anteriores..." $Yellow
    kubectl delete job volume-test-microservices-job 2>$null | Out-Null
    kubectl delete configmap volume-test-microservices-config 2>$null | Out-Null
    Start-Sleep -Seconds 2
}

function Create-VolumeJob {
    param([int]$Count)
    
    Write-ColorOutput "📊 Creando job para generar $Count reservas..." $Yellow
    
    # Verificar que existe el archivo de job
    if (-not (Test-Path "$PSScriptRoot\volume-test-microservices-job.yaml")) {
        Write-ColorOutput "❌ Error: No se encontró volume-test-microservices-job.yaml" $Red
        Write-ColorOutput "   Asegúrate de tener el archivo en el directorio deployment" $Yellow
        return
    }
    
    # Actualizar el job con la cantidad especificada
    $jobContent = Get-Content "$PSScriptRoot\volume-test-microservices-job.yaml"
    $jobContent = $jobContent -replace 'args: \["/scripts/populate-volume-microservices.sh", "\d+"\]', "args: [`"/scripts/populate-volume-microservices.sh`", `"$Count`"]"
    $jobContent | Set-Content "$PSScriptRoot\volume-test-microservices-job.yaml"
    
    # Aplicar el job
    kubectl apply -f "$PSScriptRoot\volume-test-microservices-job.yaml"
    
    Write-ColorOutput "✅ Job creado exitosamente" $Green
    Write-ColorOutput "⏳ Monitoreando progreso... (esto puede tomar varios minutos)" $Yellow
    
    # Monitorear el job
    $jobName = "volume-test-microservices-job"
    $timeout = 3600  # 1 hora
    $elapsed = 0
    
    do {
        Start-Sleep -Seconds 10
        $elapsed += 10
        
        # Verificar estado del job
        $jobStatus = kubectl get job $jobName -o jsonpath="{.status.conditions[?(@.type=='Complete')].status}" 2>$null
        $jobFailed = kubectl get job $jobName -o jsonpath="{.status.conditions[?(@.type=='Failed')].status}" 2>$null
        
        if ($jobStatus -eq "True") {
            Write-ColorOutput "🎉 Poblado masivo completado exitosamente" $Green
            break
        } elseif ($jobFailed -eq "True") {
            Write-ColorOutput "❌ Error en el job de poblado" $Red
            break
        } else {
            # Mostrar progreso cada 30 segundos
            if ($elapsed % 30 -eq 0) {
                Write-ColorOutput "   ⏳ Generando datos... ($elapsed/$timeout segundos)" $Cyan
                # Intentar mostrar logs recientes
                try {
                    $recentLogs = kubectl logs job/$jobName --tail=3 2>$null
                    if ($recentLogs) {
                        Write-ColorOutput "   📋 Progreso: $($recentLogs -join ' | ')" $Cyan
                    }
                } catch {
                    # Ignorar errores de logs
                }
            }
        }
    } while ($elapsed -lt $timeout)
    
    if ($elapsed -ge $timeout) {
        Write-ColorOutput "⚠️  Tiempo agotado. Verificar manualmente con: kubectl get jobs" $Yellow
    }
    
    # Mostrar logs finales
    Write-ColorOutput "📋 Logs finales del job:" $Blue
    kubectl logs job/$jobName
}

function Show-Stats {
    Write-ColorOutput "📊 Estadísticas actuales de los microservicios:" $Blue
    
    # Estadísticas de reserve-service-db
    Write-ColorOutput "📋 RESERVE SERVICE DATABASE:" $Cyan
    kubectl exec deployment/reserve-service-db -- mysql -uroot -proot reserve -e "
    SELECT 'ESTADÍSTICAS DE RESERVAS:' as info;
    SELECT COUNT(*) as total_reservas FROM reserves;
    SELECT COUNT(*) as total_usuarios FROM users;
    SELECT COUNT(*) as total_asignaciones FROM reserves_users;
    SELECT 
        YEAR(reserveday) as año,
        MONTH(reserveday) as mes,
        COUNT(*) as reservas_mes
    FROM reserves 
    GROUP BY YEAR(reserveday), MONTH(reserveday)
    ORDER BY año DESC, mes DESC 
    LIMIT 6;
    " 2>$null
    
    # Estadísticas de tariff-service-db
    Write-ColorOutput "💰 TARIFF SERVICE DATABASE:" $Cyan
    kubectl exec deployment/tariff-service-db -- mysql -uroot -proot tartifasbd -e "
    SELECT 'ESTADÍSTICAS DE TARIFAS:' as info;
    SELECT COUNT(*) as total_tarifas FROM tariffs;
    SELECT laps, regular_price FROM tariffs ORDER BY laps;
    " 2>$null
}

function Clean-TestData {
    Write-ColorOutput "🧹 Limpiando datos de prueba masivos..." $Yellow
    
    # Limpiar reserve-service-db (mantener datos base)
    kubectl exec deployment/reserve-service-db -- mysql -uroot -proot reserve -e "
    DELETE FROM reserves_users WHERE reserve_id > 100;
    DELETE FROM reserves WHERE id > 100;
    DELETE FROM users WHERE id > 20;
    ALTER TABLE reserves AUTO_INCREMENT = 101;
    ALTER TABLE users AUTO_INCREMENT = 21;
    SELECT 'Datos de prueba limpiados, datos base mantenidos' as resultado;
    " 2>$null
    
    Write-ColorOutput "✅ Datos de prueba limpiados" $Green
}

function Main {
    Show-Header
    
    # Verificar que estamos en el directorio correcto
    if (-not (Test-Path "$PSScriptRoot\volume-test-microservices-job.yaml")) {
        Write-ColorOutput "❌ Error: No se encontró volume-test-microservices-job.yaml" $Red
        Write-ColorOutput "   Asegúrate de ejecutar este script desde el directorio deployment" $Yellow
        return
    }
    
    # Modos no interactivos
    if ($Clean) {
        Clean-TestData
        return
    }
    
    if ($Stats) {
        Show-Stats
        return
    }
    
    if ($ReserveCount -gt 0) {
        # Modo directo con parámetro
        Cleanup-Jobs
        Create-VolumeJob $ReserveCount
        return
    }
    
    # Modo interactivo
    while ($true) {
        Show-Options
        $choice = Read-Host "Selecciona una opción (0-9)"
        
        switch ($choice) {
            "1" {
                Cleanup-Jobs
                Create-VolumeJob 1000
                break
            }
            "2" {
                Cleanup-Jobs
                Create-VolumeJob 5000
                break
            }
            "3" {
                Cleanup-Jobs
                Create-VolumeJob 10000
                break
            }
            "4" {
                Cleanup-Jobs
                Create-VolumeJob 25000
                break
            }
            "5" {
                Cleanup-Jobs
                Create-VolumeJob 50000
                break
            }
            "6" {
                Cleanup-Jobs
                Create-VolumeJob 100000
                break
            }
            "7" {
                $customCount = Read-Host "Ingresa la cantidad de reservas a generar"
                if ($customCount -match '^\d+$' -and [int]$customCount -gt 0) {
                    Cleanup-Jobs
                    Create-VolumeJob ([int]$customCount)
                    break
                } else {
                    Write-ColorOutput "❌ Error: Ingresa un número válido" $Red
                }
            }
            "8" {
                Clean-TestData
            }
            "9" {
                Show-Stats
            }
            "0" {
                Write-ColorOutput "👋 Saliendo..." $Green
                return
            }
            default {
                Write-ColorOutput "❌ Opción inválida" $Red
            }
        }
        
        Write-Host ""
    }
}


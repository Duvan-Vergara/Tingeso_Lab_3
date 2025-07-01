param(
    [string]$DirectOption
)

# Siempre parte desde el directorio donde está este script
Set-Location $PSScriptRoot

Clear-Host
$exitMenu = $false

function BuildFrontend {
    Write-Host "`n=== Build & Push FRONTEND ===" -ForegroundColor Cyan
    Push-Location (Join-Path $PSScriptRoot 'frontend')
    docker build -t duvanvergara/frontend:latest .
    docker push duvanvergara/frontend:latest
    Pop-Location
    Write-Host "FRONTEND listo.`n" -ForegroundColor Green
    Pause
}

function BuildBackend {
    # Config Service
    Push-Location (Join-Path $PSScriptRoot 'backend/config-service')
    Write-Host "`n=== Build & Push config-service ===" -ForegroundColor Cyan
    docker build -t duvanvergara/config-service:latest .
    docker push duvanvergara/config-service:latest
    Pop-Location

    # Eureka Service
    Push-Location (Join-Path $PSScriptRoot 'backend/eureka-service')
    Write-Host "`n=== Build & Push eureka-service ===" -ForegroundColor Cyan
    docker build -t duvanvergara/eureka-service:latest .
    docker push duvanvergara/eureka-service:latest
    Pop-Location

    # Gateway Service
    Push-Location (Join-Path $PSScriptRoot 'backend/gateway-service')
    Write-Host "`n=== Build & Push gateway-service ===" -ForegroundColor Cyan
    docker build -t duvanvergara/gateway-service:latest .
    docker push duvanvergara/gateway-service:latest
    Pop-Location

    # Microservicios renombrados
    $servicios = @(
        'tariff-service',
        'discount-people-service',
        'discount-frequent-service',
        'special-rates-service',
        'reserve-service',
        'rack-service',
        'reports-service'
    )
    foreach ($svc in $servicios) {
        $svcName = ($svc.Trim() -replace '[\r\n]', '')
        # Solo un mensaje relevante por microservicio
        $svcPath = Join-Path $PSScriptRoot "backend/$svcName"
        $dockerfilePath = Join-Path $svcPath 'Dockerfile'
        $jarPath = Join-Path $svcPath 'target/backend.jar'
        
        Write-Host "Procesando servicio: $svcName" -ForegroundColor Magenta
        Write-Host "Ruta del servicio: $svcPath" -ForegroundColor Gray
        
        if ((Test-Path $svcPath -PathType Container) -and (Test-Path $dockerfilePath)) {
            if (!(Test-Path $jarPath)) {
                Write-Host "[ADVERTENCIA] No se encontró $jarPath. Debes compilar el microservicio antes de hacer build Docker. Se omite $svcName." -ForegroundColor Yellow
                continue
            }
            $tag = "duvanvergara/" + $svcName + ":latest"
            Write-Host "\n=== Build & Push $svcName ===" -ForegroundColor Cyan
            Write-Host "Tag que se va a usar: $tag" -ForegroundColor Green
            Push-Location $svcPath
            
            Write-Host "Ejecutando: docker build -t $tag ." -ForegroundColor Gray
            docker build -t $tag .
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host "Build exitoso. Haciendo push de: $tag" -ForegroundColor Green
                docker push $tag
                if ($LASTEXITCODE -eq 0) {
                    Write-Host "Push exitoso para: $tag" -ForegroundColor Green
                } else {
                    Write-Host "[ERROR] Falló el push de $tag" -ForegroundColor Red
                }
            } else {
                Write-Host "[ERROR] Falló el build de $svcName. No se hace push." -ForegroundColor Red
            }
            Pop-Location
        } elseif (!(Test-Path $svcPath -PathType Container)) {
            Write-Host "[ADVERTENCIA] Carpeta $svcPath no encontrada. Se omite $svcName." -ForegroundColor Yellow
        } else {
            Write-Host "[ADVERTENCIA] No hay Dockerfile en $svcPath. Se omite $svcName." -ForegroundColor Yellow
        }
    }
    Write-Host "BACKEND listo.`n" -ForegroundColor Green
    
    # Mostrar las imágenes construidas
    Write-Host "=== VERIFICACIÓN: Imágenes construidas ===" -ForegroundColor Cyan
    docker images --filter=reference="duvanvergara/*" --format "table {{.Repository}}\t{{.Tag}}\t{{.CreatedAt}}\t{{.Size}}"
    
    Pause
}

# Si se pasa un argumento, ejecuta directamente la opción
if ($DirectOption) {
    switch ($DirectOption) {
        "1" { BuildFrontend; exit }
        "2" { BuildBackend; exit }
        default { Write-Host "Opción no válida por argumento." -ForegroundColor Yellow; exit 1 }
    }
}

do {
    Write-Host "==============================="
    Write-Host "  Build & Push selectivo Docker"
    Write-Host "1. Solo FRONTEND"
    Write-Host "2. Solo BACKEND"
    Write-Host "3. TODO (Frontend + Backend)"
    Write-Host "4. Salir"
    Write-Host "==============================="
    $opt = Read-Host "Elige una opción [1-4]"

    switch ($opt) {
        "1" { BuildFrontend; $exitMenu = $true }
        "2" { BuildBackend; $exitMenu = $true }
        "3" {
            & $PSCommandPath 1
            & $PSCommandPath 2
            $exitMenu = $true
        }
        "4" { $exitMenu = $true }
        default { 
            Write-Host "Opción no válida.`n" -ForegroundColor Yellow
            Pause 
        }
    }
} while (-not $exitMenu)

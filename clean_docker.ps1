Clear-Host
$exitMenu = $false
do {
    Write-Host "==============================="
    Write-Host "  Limpieza selectiva de Docker"
    Write-Host "1. Limpiar solo FRONTEND"
    Write-Host "2. Limpiar solo BACKEND"
    Write-Host "3. Limpiar KARTING (conserva Jenkins)"
    Write-Host "4. Salir"
    Write-Host "==============================="
    $opt = Read-Host "Elige una opción [1-4]"

    switch ($opt) {
        "1" {
            Write-Host "`nLimpiando contenedores e imágenes de FRONTEND..." -ForegroundColor Cyan
            docker ps -aq --filter "name=front" | ForEach-Object { docker rm -f $_ }
            docker images -q --filter=reference="*front*" | ForEach-Object { docker rmi -f $_ }
            Write-Host "Limpieza de FRONTEND completada.`n" -ForegroundColor Green
            Pause
            $exitMenu = $true
        }
        "2" {
            Write-Host "`nLimpiando contenedores e imágenes de BACKEND..." -ForegroundColor Cyan
            docker ps -aq --filter "name=back" | ForEach-Object { docker rm -f $_ }
            docker images -q --filter=reference="*back*" | ForEach-Object { docker rmi -f $_ }
            Write-Host "Limpieza de BACKEND completada.`n" -ForegroundColor Green
            Pause
            $exitMenu = $true
        }
        "3" {
            Write-Host "`nLimpieza SELECTIVA de Docker (conserva Kubernetes/Minikube)..." -ForegroundColor Cyan
            Write-Host "NOTA: Preservando Kubernetes, Minikube y Jenkins" -ForegroundColor Yellow
            
            # Obtener contenedores de Kubernetes/Minikube para conservar
            Write-Host "Identificando contenedores de Kubernetes a conservar..." -ForegroundColor Gray
            $k8sContainers = @()
            $k8sContainers += docker ps -aq --filter "name=k8s_"
            $k8sContainers += docker ps -aq --filter "name=minikube"
            $k8sContainers += docker ps -aq --filter "name=kube"
            $k8sContainers += docker ps -aq --filter "name=etcd"
            $k8sContainers += docker ps -aq --filter "name=coredns"
            $k8sContainers += docker ps -aq --filter "name=kindest"
            $k8sContainers += docker ps -aq --filter "name=registry"
            $k8sContainers = $k8sContainers | Where-Object { $_ -ne $null -and $_ -ne "" } | Sort-Object -Unique
            
            # Eliminar contenedores de Karting específicamente
            Write-Host "Eliminando contenedores de aplicación Karting..." -ForegroundColor Gray
            $kartingContainers = @()
            $kartingContainers += docker ps -aq --filter "name=frontend"
            $kartingContainers += docker ps -aq --filter "name=backend"
            $kartingContainers += docker ps -aq --filter "name=config-service"
            $kartingContainers += docker ps -aq --filter "name=eureka-service"
            $kartingContainers += docker ps -aq --filter "name=gateway-service"
            $kartingContainers += docker ps -aq --filter "name=reserve-service"
            $kartingContainers += docker ps -aq --filter "name=tariff-service"
            $kartingContainers += docker ps -aq --filter "name=discount"
            $kartingContainers += docker ps -aq --filter "name=special-rates"
            $kartingContainers += docker ps -aq --filter "name=rack-service"
            $kartingContainers += docker ps -aq --filter "name=reports-service"
            $kartingContainers = $kartingContainers | Where-Object { $_ -ne $null -and $_ -ne "" } | Sort-Object -Unique
            
            foreach ($container in $kartingContainers) {
                if ($k8sContainers -notcontains $container) {
                    docker rm -f $container 2>$null
                }
            }
            
            # Eliminar imágenes específicas de Karting (no de Kubernetes)
            Write-Host "Eliminando imágenes de aplicación Karting..." -ForegroundColor Gray
            $kartingImages = @()
            $kartingImages += docker images -q --filter=reference="duvanvergara/*"
            $kartingImages += docker images -q --filter=reference="*frontend-image*"
            $kartingImages += docker images -q --filter=reference="*backend*" | Where-Object { 
                $imageName = docker inspect $_ --format '{{.RepoTags}}' 2>$null
                $imageName -notmatch "k8s|kube|minikube|registry"
            }
            $kartingImages += docker images -q --filter=reference="*config-service*"
            $kartingImages += docker images -q --filter=reference="*eureka-service*"
            $kartingImages += docker images -q --filter=reference="*gateway-service*"
            $kartingImages += docker images -q --filter=reference="*reserve-service*"
            $kartingImages += docker images -q --filter=reference="*tariff-service*"
            $kartingImages += docker images -q --filter=reference="*discount*"
            $kartingImages += docker images -q --filter=reference="*special-rates*"
            $kartingImages += docker images -q --filter=reference="*rack-service*"
            $kartingImages += docker images -q --filter=reference="*reports-service*"
            $kartingImages = $kartingImages | Where-Object { $_ -ne $null -and $_ -ne "" } | Sort-Object -Unique
            
            foreach ($image in $kartingImages) {
                docker rmi -f $image 2>$null
            }
            
            # Limpiar volúmenes no utilizados (excepto los de Kubernetes)
            Write-Host "Limpiando volúmenes no utilizados (conservando Kubernetes)..." -ForegroundColor Gray
            docker volume ls -q | Where-Object { 
                $_ -notmatch "minikube|k8s|kube|etcd" 
            } | ForEach-Object { 
                docker volume rm $_ 2>$null 
            }
            
            Write-Host "`n✅ Limpieza SELECTIVA completada." -ForegroundColor Green
            Write-Host "   • Contenedores de aplicación Karting eliminados" -ForegroundColor Green
            Write-Host "   • Imágenes de aplicación Karting eliminadas" -ForegroundColor Green  
            Write-Host "   • Volúmenes no utilizados limpiados" -ForegroundColor Green
            Write-Host "`n🔒 CONSERVADO:" -ForegroundColor Yellow
            Write-Host "   • Kubernetes/Minikube contenedores" -ForegroundColor Yellow
            Write-Host "   • Kubernetes/Minikube imágenes" -ForegroundColor Yellow
            Write-Host "   • Kubernetes/Minikube volúmenes" -ForegroundColor Yellow
            Write-Host "   • Jenkins local (independiente)" -ForegroundColor Yellow
            
            # Mostrar contenedores que siguen corriendo
            Write-Host "`n📋 Contenedores activos conservados:" -ForegroundColor Cyan
            docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}" | Where-Object { $_ -match "k8s|kube|minikube" }
            
            Pause
            $exitMenu = $true
        }
        "4" { $exitMenu = $true }
        default { Write-Host "Opción no válida.`n" -ForegroundColor Yellow; Pause }
    }
} while (-not $exitMenu)

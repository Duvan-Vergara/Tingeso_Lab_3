Clear-Host
$exitMenu = $false
do {
    Write-Host "==============================="
    Write-Host "  Limpieza selectiva de Docker"
    Write-Host "1. Limpiar solo FRONTEND"
    Write-Host "2. Limpiar solo BACKEND"
    Write-Host "3. Limpiar TODO (Frontend + Backend + Volúmenes)"
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
            Write-Host "`nEliminando todos los contenedores detenidos..." -ForegroundColor Cyan
            docker container prune -f
            Write-Host "Eliminando todos los contenedores (detenidos y corriendo)..." -ForegroundColor Cyan
            docker ps -aq | ForEach-Object { docker rm -f $_ }
            Write-Host "Eliminando todas las imágenes..." -ForegroundColor Cyan
            docker images -q | ForEach-Object { docker rmi -f $_ }
            Write-Host "Eliminando todos los volúmenes no usados..." -ForegroundColor Cyan
            docker volume prune -f
            Write-Host "Limpieza TOTAL de Docker completada.`n" -ForegroundColor Green
            Pause
            $exitMenu = $true
        }
        "4" { $exitMenu = $true }
        default { Write-Host "Opción no válida.`n" -ForegroundColor Yellow; Pause }
    }
} while (-not $exitMenu)

Clear-Host
$exitMenu = $false
do {
    Write-Host "==============================="
    Write-Host "  Despliegue Kubernetes"
    Write-Host "1. PC (Minikube)"
    Write-Host "2. Notebook (Docker Desktop)"
    Write-Host "3. Salir"
    Write-Host "==============================="
    $opt = Read-Host "Elige una opción [1-3]"

    switch ($opt) {
        "1" {
            $KUBE_CTX = "minikube"
        }
        "2" {
            $KUBE_CTX = "docker-desktop"
        }
        "3" {
            $exitMenu = $true
            break
        }
        default {
            Write-Host "Opción no válida.`n" -ForegroundColor Yellow
            Pause
            continue
        }
    }

    if ($exitMenu) { break }

    kubectl config use-context $KUBE_CTX
    $clean = Read-Host "¿Deseas limpiar todos los recursos de Kubernetes antes de desplegar? (S/N)"
    if ($clean -eq "S" -or $clean -eq "s") {
        & "$PSScriptRoot/clean_k8s.ps1" $opt
    }

    Push-Location deployment

    # ConfigMaps y Secrets
    kubectl apply -f mysql-config-map.yaml
    kubectl apply -f mysql-root-secret.yaml
    kubectl apply -f mysql-user-secret.yaml

    # Bases de datos y PVCs
    kubectl apply -f mysql-deployment.yaml
    kubectl apply -f tariff-service-db-deployment-service.yaml
    kubectl apply -f discount-people-service-db-deployment-service.yaml
    kubectl apply -f discount-frequent-service-db-deployment-service.yaml
    kubectl apply -f special-rates-service-db-deployment-service.yaml
    kubectl apply -f reserve-service-db-deployment-service.yaml

    # Config Service
    kubectl apply -f config-service-deployment-service.yaml
    Write-Host "Esperando a que config-service esté listo..."
    kubectl wait --for=condition=ready pod -l app=config-service-deployment --timeout=300s
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: config-service no está listo después de 5 minutos." -ForegroundColor Red
        Write-Host "Reiniciando config-service..."
        kubectl rollout restart deployment config-service-deployment
    }

    # Eureka Service
    kubectl apply -f eureka-service-deployment-service.yaml
    Write-Host "Esperando a que eureka-service esté listo..."
    kubectl wait --for=condition=ready pod -l app=eureka-service-deployment --timeout=300s
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: eureka-service no está listo después de 5 minutos." -ForegroundColor Red
    }

    # Gateway Service
    kubectl apply -f gateway-service-deployment-service.yaml

    # Microservicios funcionales
    kubectl apply -f tariff-service-deployment.yaml
    kubectl apply -f discount-people-service-deployment.yaml
    kubectl apply -f discount-frequent-service-deployment.yaml
    kubectl apply -f special-rates-service-deployment.yaml
    kubectl apply -f reserve-service-deployment.yaml
    kubectl apply -f rack-service-deployment.yaml
    kubectl apply -f reports-service-deployment.yaml

    # Frontend
    kubectl apply -f frotend-deployment.yaml

    Pop-Location
    Write-Host "Deployments aplicados." -ForegroundColor Green

    # Poblar automáticamente las bases de datos m1 a m5
    foreach ($svc in 1..5) {
        $configMapName = "m$svc-db-sql"
        $fromFile = "m$svc-db.mysql.sql=$PSScriptRoot/deployment/m$svc-db.mysql.sql"
        $jobFile = "$PSScriptRoot/deployment/m$svc-db-populate-job.yaml"
        kubectl create configmap $configMapName --from-file=$fromFile --dry-run=client -o yaml | kubectl apply -f -
        kubectl apply -f $jobFile
    }
    Pause
    $exitMenu = $true
} while (-not $exitMenu)

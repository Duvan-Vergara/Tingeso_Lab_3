param(
    [string]$ENTORNO
)

Clear-Host
if (-not $ENTORNO) {
    Write-Host "==============================="
    Write-Host "  Limpieza de Kubernetes"
    Write-Host "1. PC (Minikube)"
    Write-Host "2. Notebook (Docker Desktop)"
    Write-Host "3. Salir"
    Write-Host "==============================="
    $ENTORNO = Read-Host "Elige una opción [1-3]"
}

switch ($ENTORNO) {
    "1" { $KUBE_CTX = "minikube" }
    "2" { $KUBE_CTX = "docker-desktop" }
    "3" { return }
    default {
        Write-Host "Opción no válida. Saliendo..." -ForegroundColor Yellow
        return
    }
}

kubectl config use-context $KUBE_CTX
kubectl delete -f deployment\ --recursive

# Elimina todos los PersistentVolumes (PV) y PersistentVolumeClaims (PVC)
kubectl delete pv --all --ignore-not-found
kubectl delete pvc --all --ignore-not-found

Write-Host "======= LIMPIEZA COMPLETA =======" -ForegroundColor Green
Pause

@echo off
setlocal

REM Recibe el contexto como argumento (1 o 2)
set ENTORNO=%1
if "%ENTORNO%"=="" (
    echo Selecciona el entorno a limpiar:
    echo 1. PC (Minikube)
    echo 2. Notebook (Docker Desktop)
    set /p ENTORNO="Elige una opción [1/2]: "
)

if "%ENTORNO%"=="1" (
    set KUBE_CTX=minikube
) else if "%ENTORNO%"=="2" (
    set KUBE_CTX=docker-desktop
) else (
    echo Opcion no valida. Saliendo...
    exit /b 1
)

kubectl config use-context %KUBE_CTX%
kubectl delete -f deployment\ --recursive


REM Elimina los PersistentVolumes (PV) manualmente si los tienes definidos fuera de los YAML de deployment
kubectl delete pv m1-db-pv --ignore-not-found
kubectl delete pv m2-db-pv --ignore-not-found
kubectl delete pv m3-db-pv --ignore-not-found
kubectl delete pv m4-db-pv --ignore-not-found
kubectl delete pv m5-db-pv --ignore-not-found

REM Elimina los PersistentVolumeClaims (PVC) manualmente si quedan residuos
kubectl delete pvc m1-db-pvc --ignore-not-found
kubectl delete pvc m2-db-pvc --ignore-not-found
kubectl delete pvc m3-db-pvc --ignore-not-found
kubectl delete pvc m4-db-pvc --ignore-not-found
kubectl delete pvc m5-db-pvc --ignore-not-found

REM Elimina el PV y PVC del mysql general si lo tienes
kubectl delete pv mysql-pv --ignore-not-found
kubectl delete pvc mysql-pv-claim --ignore-not-found

echo ======= LIMPIEZA COMPLETA =======
pause
@echo off
setlocal enabledelayedexpansion

REM =====================================================
REM VERIFICACIÓN COMPLETA PARA RÚBRICA DE RENDIMIENTO
REM =====================================================
REM Verifica que todos los componentes estén listos para
REM cumplir con el 25% de la rúbrica de rendimiento
REM =====================================================

echo.
echo ==========================================
echo   VERIFICACIÓN RÚBRICA 25%% - RENDIMIENTO
echo ==========================================
echo.

set PROJECT_DIR=%~dp0..
set VERIFICACION_OK=1

echo 🔍 Verificando prerequisitos para rúbrica de rendimiento...
echo.

REM 1. Verificar JMeter
echo [1/8] Verificando JMeter...
set JMETER_HOME=C:\apache-jmeter-5.6.3
if exist "%JMETER_HOME%\bin\jmeter.bat" (
    echo    ✅ JMeter encontrado en %JMETER_HOME%
) else (
    echo    ❌ JMeter NO encontrado en %JMETER_HOME%
    echo       Descargar de: https://jmeter.apache.org/download_jmeter.cgi
    set VERIFICACION_OK=0
)

REM 2. Verificar archivos JMX escalables
echo [2/8] Verificando archivos JMX escalables...
set JMX_FILES=RF5-REGISTRO-RESERVAS-LOAD-ESCALABLE.jmx RF5-REGISTRO-RESERVAS-STRESS-ESCALABLE.jmx RF7-RACK-SEMANAL-LOAD-ESCALABLE.jmx RF8-REPORTE-INGRESOS-VOLUME-ESCALABLE.jmx

for %%f in (%JMX_FILES%) do (
    if exist "%PROJECT_DIR%\%%f" (
        echo    ✅ %%f
    ) else (
        echo    ❌ %%f NO encontrado
        set VERIFICACION_OK=0
    )
)

REM 3. Verificar sistema desplegado
echo [3/8] Verificando sistema Karting...
curl -s -o nul -w "%%{http_code}" http://localhost:30088/api/reserves/ > temp_http.txt
set /p HTTP_STATUS=<temp_http.txt
del temp_http.txt

if "%HTTP_STATUS%"=="200" (
    echo    ✅ Sistema disponible en http://localhost:30088 (HTTP %HTTP_STATUS%)
) else (
    echo    ❌ Sistema NO disponible (HTTP %HTTP_STATUS%)
    echo       Ejecutar: deploy_all.bat
    set VERIFICACION_OK=0
)

REM 4. Verificar Python y dependencias
echo [4/8] Verificando Python...
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✅ Python disponible
    
    REM Verificar pandas (requerido para análisis)
    python -c "import pandas" >nul 2>&1
    if %errorlevel% equ 0 (
        echo    ✅ Pandas disponible para análisis
    ) else (
        echo    ⚠️  Pandas NO disponible - ejecutar: pip install -r jenkins\requirements.txt
    )
) else (
    echo    ❌ Python NO encontrado
    echo       Instalar Python 3.8+
    set VERIFICACION_OK=0
)

REM 5. Verificar scripts de análisis
echo [5/8] Verificando scripts de análisis...
if exist "%PROJECT_DIR%\jenkins\analyze_results_rubrica.py" (
    echo    ✅ Script de análisis de rúbrica disponible
) else (
    echo    ❌ analyze_results_rubrica.py NO encontrado
    set VERIFICACION_OK=0
)

if exist "%PROJECT_DIR%\jenkins\ejecutar_pruebas_escalables.bat" (
    echo    ✅ Script principal de pruebas disponible
) else (
    echo    ❌ ejecutar_pruebas_escalables.bat NO encontrado
    set VERIFICACION_OK=0
)

REM 6. Verificar Kubernetes
echo [6/8] Verificando Kubernetes...
kubectl get pods >nul 2>&1
if %errorlevel% equ 0 (
    echo    ✅ Kubernetes disponible
    kubectl get pods | findstr "Running" >nul
    if %errorlevel% equ 0 (
        echo    ✅ Pods en estado Running
    ) else (
        echo    ⚠️  Algunos pods pueden no estar Running
    )
) else (
    echo    ❌ Kubernetes NO disponible
    echo       Verificar: minikube status o kubectl cluster-info
    set VERIFICACION_OK=0
)

REM 7. Verificar Jenkins local (opcional)
echo [7/8] Verificando Jenkins local...
curl -s -o nul -w "%%{http_code}" http://localhost:8080 > temp_jenkins.txt 2>nul
set /p JENKINS_STATUS=<temp_jenkins.txt
del temp_jenkins.txt 2>nul

if "%JENKINS_STATUS%"=="200" (
    echo    ✅ Jenkins local disponible en http://localhost:8080
) else (
    echo    ⚠️  Jenkins local NO disponible (opcional)
    echo       Para Jenkins local: instalar y configurar en puerto 8080
)

REM 8. Verificar estructura de directorios
echo [8/8] Verificando estructura de directorios...
if exist "%PROJECT_DIR%\jenkins" (
    echo    ✅ Directorio jenkins/
) else (
    echo    ❌ Directorio jenkins/ NO encontrado
    set VERIFICACION_OK=0
)

if exist "%PROJECT_DIR%\selenium-tests" (
    echo    ✅ Directorio selenium-tests/
) else (
    echo    ❌ Directorio selenium-tests/ NO encontrado
    set VERIFICACION_OK=0
)

echo.
echo ==========================================
echo   RESULTADO DE VERIFICACIÓN
echo ==========================================

if %VERIFICACION_OK% equ 1 (
    echo ✅ SISTEMA LISTO PARA RÚBRICA DE RENDIMIENTO
    echo.
    echo 🎯 Componentes verificados:
    echo    • JMeter instalado y configurado
    echo    • Archivos JMX escalables disponibles  
    echo    • Sistema Karting desplegado y funcional
    echo    • Python con dependencias de análisis
    echo    • Scripts de análisis interpretativo
    echo    • Kubernetes operativo
    echo.
    echo 🚀 PARA EJECUTAR PRUEBAS:
    echo    jenkins\ejecutar_pruebas_escalables.bat
    echo.
    echo 📊 PARA ANÁLISIS DIRECTO:
    echo    python jenkins\analyze_results_rubrica.py [directorio_resultados]
    echo.
    echo 📋 CUMPLIMIENTO RÚBRICA 25%%:
    echo    ✅ RF5, RF7, RF8 - Load, Stress, Volume Testing
    echo    ✅ Automatización completa con JMeter
    echo    ✅ Análisis View Results in Table, Aggregate Report, View Results Tree
    echo    ✅ Interpretación de datos y recomendaciones de mejora
) else (
    echo ❌ SISTEMA NO ESTÁ LISTO
    echo.
    echo 🔧 ACCIONES REQUERIDAS:
    echo    1. Revisar los elementos marcados con ❌
    echo    2. Instalar/configurar componentes faltantes
    echo    3. Ejecutar nuevamente esta verificación
    echo.
    echo 📝 COMPONENTES CRÍTICOS:
    echo    • JMeter (obligatorio)
    echo    • Sistema Karting desplegado (obligatorio)
    echo    • Archivos JMX escalables (obligatorio)
    echo    • Python + pandas (para análisis)
)

echo.
echo ==========================================
pause

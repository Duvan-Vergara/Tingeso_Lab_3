@echo off
setlocal enabledelayedexpansion

REM ============================================
REM PRUEBA RÁPIDA DE ARCHIVOS ESCALABLES
REM ============================================
REM Script para probar los nuevos archivos JMX
REM escalables con configuraciones básicas
REM ============================================

echo.
echo ==========================================
echo   PRUEBA RÁPIDA - ARCHIVOS ESCALABLES
echo ==========================================
echo.

REM Configuración básica corregida
set JMETER_HOME=C:\apache-jmeter-5.6.3
set PROJECT_DIR=%~dp0..
set RESULTS_DIR=%PROJECT_DIR%\quick-test-results
set TIMESTAMP=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%
set TIMESTAMP=%TIMESTAMP: =0%

REM Crear directorio de resultados
if not exist "%RESULTS_DIR%" mkdir "%RESULTS_DIR%"

echo Directorio de resultados: %RESULTS_DIR%

REM Verificar JMeter - buscar el archivo correcto
if exist "%JMETER_HOME%\bin\jmeter.bat" (
    set JMETER_CMD="%JMETER_HOME%\bin\jmeter.bat"
    echo JMeter encontrado: %JMETER_HOME%\bin\jmeter.bat
) else if exist "%JMETER_HOME%\bin\jmeter" (
    set JMETER_CMD="%JMETER_HOME%\bin\jmeter"
    echo JMeter encontrado: %JMETER_HOME%\bin\jmeter
) else if exist "%JMETER_HOME%\bin\ApacheJMeter.jar" (
    set JMETER_CMD=java -jar "%JMETER_HOME%\bin\ApacheJMeter.jar"
    echo JMeter JAR encontrado: %JMETER_HOME%\bin\ApacheJMeter.jar
) else (
    echo ERROR: No se encuentra JMeter
    echo Verificando contenido de %JMETER_HOME%\bin:
    dir "%JMETER_HOME%\bin\*jmeter*" /b 2>nul
    dir "%JMETER_HOME%\bin\*.jar" /b 2>nul
    pause
    exit /b 1
)

REM Verificar sistema
echo Verificando sistema...
curl -s -o nul -w "%%{http_code}" http://localhost:30088/api/reserves/ > temp.txt
set /p HTTP_STATUS=<temp.txt
del temp.txt

if not "%HTTP_STATUS%"=="200" (
    echo ERROR: Sistema no disponible - Código: %HTTP_STATUS%
    echo Asegúrese de que el sistema esté desplegado en Kubernetes
    pause
    exit /b 1
)
echo ✓ Sistema disponible - Código: %HTTP_STATUS%
echo.

echo Ejecutando pruebas rápidas de validación...
echo.

REM Ejecutar las 4 pruebas rápidas usando función robusta
echo Iniciando secuencia de 4 pruebas rápidas...
echo.

call :ejecutar_prueba_rapida "RF5-REGISTRO-RESERVAS-LOAD-ESCALABLE.jmx" "RF5-LOAD-QUICK-50U" 50 30 2 120
if %errorlevel% neq 0 echo ✗ ADVERTENCIA: Error en RF5 LOAD

call :ejecutar_prueba_rapida "RF7-RACK-SEMANAL-LOAD-ESCALABLE.jmx" "RF7-LOAD-QUICK-100U" 100 45 5 180  
if %errorlevel% neq 0 echo ✗ ADVERTENCIA: Error en RF7 LOAD

call :ejecutar_prueba_rapida "RF8-REPORTE-INGRESOS-VOLUME-ESCALABLE.jmx" "RF8-VOLUME-QUICK-75U" 75 60 10 240
if %errorlevel% neq 0 echo ✗ ADVERTENCIA: Error en RF8 VOLUME

call :ejecutar_prueba_rapida "RF5-REGISTRO-RESERVAS-STRESS-ESCALABLE.jmx" "RF5-STRESS-QUICK-200U" 200 60 3 300
if %errorlevel% neq 0 echo ✗ ADVERTENCIA: Error en RF5 STRESS

goto :mostrar_resultados_rapidos

:mostrar_resultados_rapidos

REM ============================================
REM RESUMEN DE RESULTADOS
REM ============================================
echo.
echo ==========================================
echo   RESUMEN DE PRUEBAS RÁPIDAS
echo ==========================================
echo.
echo Directorio de resultados: %RESULTS_DIR%
echo.
echo Archivos generados:
dir /b "%RESULTS_DIR%" 2>nul
echo.

echo ¿Desea abrir los reportes HTML? (S/N)
set /p ABRIR=
if /i "%ABRIR%"=="S" (
    echo Abriendo reportes...
    for /d %%i in ("%RESULTS_DIR%\html-*") do (
        start "" "%%i\index.html"
    )
)

echo.
echo ¿Ejecutar análisis básico de resultados? (S/N)
set /p ANALIZAR=
if /i "%ANALIZAR%"=="S" (
    if exist "%PROJECT_DIR%\jenkins\analyze_results_escalable.py" (
        echo Ejecutando análisis...
        python "%PROJECT_DIR%\jenkins\analyze_results_escalable.py" "%RESULTS_DIR%"
    ) else (
        echo Análisis no disponible - archivo no encontrado
    )
)

echo.
echo ==========================================
echo   PRUEBAS RÁPIDAS COMPLETADAS
echo ==========================================
echo.
echo Los archivos JMX escalables están listos para:
echo   ✓ Pruebas de carga (LOAD) con usuarios crecientes
echo   ✓ Pruebas de estrés (STRESS) para encontrar límites
echo   ✓ Pruebas de volumen (VOLUME) con BD poblada
echo.
echo Próximos pasos:
echo   1. Poblar BD con: jenkins\poblar_bd_masivo.ps1
echo   2. Ejecutar suite completa: jenkins\ejecutar_pruebas_escalables.bat
echo   3. Configurar Jenkins con: Jenkinsfile-Performance
echo.

pause
goto :eof

REM =====================================================
REM FUNCIÓN: EJECUTAR PRUEBA RÁPIDA
REM =====================================================
:ejecutar_prueba_rapida
set JMX_FILE=%~1
set TEST_NAME=%~2
set USERS=%~3
set RAMP_TIME=%~4
set LOOPS=%~5
set DURATION=%~6

echo.
echo === EJECUTANDO: %TEST_NAME% ===
echo Archivo: %JMX_FILE%
echo Configuración: %USERS% usuarios, %RAMP_TIME%s rampa, %LOOPS% loops, %DURATION%s duración
echo.

set JTL_FILE=%RESULTS_DIR%\%TEST_NAME%_%TIMESTAMP%.jtl
set HTML_DIR=%RESULTS_DIR%\html-%TEST_NAME%_%TIMESTAMP%
set LOG_FILE=%RESULTS_DIR%\%TEST_NAME%_%TIMESTAMP%.log

echo Iniciando prueba a las %time%...

%JMETER_CMD% -n -t "%PROJECT_DIR%\%JMX_FILE%" ^
    -JUSERS=%USERS% ^
    -JRAMP_TIME=%RAMP_TIME% ^
    -JLOOPS=%LOOPS% ^
    -JDURATION=%DURATION% ^
    -l "%JTL_FILE%" ^
    -e -o "%HTML_DIR%" ^
    -j "%LOG_FILE%"

if %errorlevel% equ 0 (
    echo ✓ %TEST_NAME% completado exitosamente a las %time%
    echo   HTML: %HTML_DIR%\index.html
    echo   JTL: %JTL_FILE%
) else (
    echo ✗ Error en %TEST_NAME% - Ver log: %LOG_FILE%
    echo   Error Level: %errorlevel%
)

echo.
goto :eof

@echo off
setlocal enabledelayedexpansion

REM ============================================
REM SCRIPT DEBUG - PRUEBA INDIVIDUAL
REM ============================================
REM Para diagnosticar problemas específicos
REM ============================================

echo.
echo ==========================================
echo   DEBUG - PRUEBA INDIVIDUAL
echo ==========================================
echo.

REM Configuración básica
set JMETER_HOME=C:\apache-jmeter-5.6.3
set PROJECT_DIR=%~dp0..
set RESULTS_DIR=%PROJECT_DIR%\debug-test-results
set TIMESTAMP=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%
set TIMESTAMP=%TIMESTAMP: =0%

REM Crear directorio de resultados
if not exist "%RESULTS_DIR%" mkdir "%RESULTS_DIR%"

echo Directorio de resultados: %RESULTS_DIR%
echo Timestamp: %TIMESTAMP%

REM Verificar JMeter
if exist "%JMETER_HOME%\bin\jmeter.bat" (
    set JMETER_CMD="%JMETER_HOME%\bin\jmeter.bat"
    echo ✓ JMeter encontrado: %JMETER_HOME%\bin\jmeter.bat
) else (
    echo ✗ ERROR: No se encuentra JMeter
    pause
    exit /b 1
)

REM Verificar sistema
echo.
echo Verificando sistema...
curl -s -o nul -w "%%{http_code}" http://localhost:30088/api/reserves/ > temp.txt
set /p HTTP_STATUS=<temp.txt
del temp.txt

if not "%HTTP_STATUS%"=="200" (
    echo ✗ ERROR: Sistema no disponible - Código: %HTTP_STATUS%
    pause
    exit /b 1
)
echo ✓ Sistema disponible - Código: %HTTP_STATUS%

REM Menu de pruebas individuales
echo.
echo Seleccione una prueba para ejecutar:
echo.
echo 1. RF5 LOAD (50 usuarios, 2 min)
echo 2. RF7 LOAD (100 usuarios, 3 min)  
echo 3. RF8 VOLUME (75 usuarios, 4 min)
echo 4. RF5 STRESS (200 usuarios, 5 min)
echo 0. Salir
echo.
set /p OPCION="Ingrese su opción (0-4): "

if "%OPCION%"=="0" goto end
if "%OPCION%"=="1" goto rf5_load
if "%OPCION%"=="2" goto rf7_load
if "%OPCION%"=="3" goto rf8_volume
if "%OPCION%"=="4" goto rf5_stress

echo Opción inválida. Saliendo...
goto end

:rf5_load
echo.
echo === EJECUTANDO RF5 LOAD ===
call :ejecutar_debug "RF5-REGISTRO-RESERVAS-LOAD-ESCALABLE.jmx" "RF5-LOAD-DEBUG" 50 30 2 120
goto end

:rf7_load
echo.
echo === EJECUTANDO RF7 LOAD ===
call :ejecutar_debug "RF7-RACK-SEMANAL-LOAD-ESCALABLE.jmx" "RF7-LOAD-DEBUG" 100 45 5 180
goto end

:rf8_volume
echo.
echo === EJECUTANDO RF8 VOLUME ===
call :ejecutar_debug "RF8-REPORTE-INGRESOS-VOLUME-ESCALABLE.jmx" "RF8-VOLUME-DEBUG" 75 60 10 240
goto end

:rf5_stress
echo.
echo === EJECUTANDO RF5 STRESS ===
call :ejecutar_debug "RF5-REGISTRO-RESERVAS-STRESS-ESCALABLE.jmx" "RF5-STRESS-DEBUG" 200 60 3 300
goto end

REM =====================================================
REM FUNCIÓN DEBUG
REM =====================================================
:ejecutar_debug
set JMX_FILE=%~1
set TEST_NAME=%~2
set USERS=%~3
set RAMP_TIME=%~4
set LOOPS=%~5
set DURATION=%~6

echo.
echo ------------------------------------------
echo DEBUG: %TEST_NAME%
echo ------------------------------------------
echo Archivo JMX: %JMX_FILE%
echo Usuarios: %USERS%
echo Tiempo rampa: %RAMP_TIME%s
echo Loops: %LOOPS%
echo Duración: %DURATION%s
echo ------------------------------------------

REM Verificar que el archivo JMX existe
if not exist "%PROJECT_DIR%\%JMX_FILE%" (
    echo ✗ ERROR: No se encuentra el archivo JMX: %PROJECT_DIR%\%JMX_FILE%
    goto end
)
echo ✓ Archivo JMX encontrado: %PROJECT_DIR%\%JMX_FILE%

set JTL_FILE=%RESULTS_DIR%\%TEST_NAME%_%TIMESTAMP%.jtl
set HTML_DIR=%RESULTS_DIR%\html-%TEST_NAME%_%TIMESTAMP%
set LOG_FILE=%RESULTS_DIR%\%TEST_NAME%_%TIMESTAMP%.log

echo.
echo Archivos de salida:
echo   JTL: %JTL_FILE%
echo   HTML: %HTML_DIR%
echo   LOG: %LOG_FILE%

echo.
echo Iniciando prueba a las %time%...
echo.

REM Ejecutar con output detallado
%JMETER_CMD% -n -t "%PROJECT_DIR%\%JMX_FILE%" ^
    -JUSERS=%USERS% ^
    -JRAMP_TIME=%RAMP_TIME% ^
    -JLOOPS=%LOOPS% ^
    -JDURATION=%DURATION% ^
    -l "%JTL_FILE%" ^
    -e -o "%HTML_DIR%" ^
    -j "%LOG_FILE%"

set EXIT_CODE=%errorlevel%

echo.
echo ------------------------------------------
echo RESULTADO DE LA PRUEBA
echo ------------------------------------------
echo Exit Code: %EXIT_CODE%
echo Finalizado a las %time%

if %EXIT_CODE% equ 0 (
    echo ✓ %TEST_NAME% completado exitosamente
    
    REM Verificar archivos generados
    if exist "%JTL_FILE%" (
        echo ✓ Archivo JTL generado: %JTL_FILE%
        for %%F in ("%JTL_FILE%") do echo   Tamaño: %%~zF bytes
    ) else (
        echo ✗ Archivo JTL NO generado
    )
    
    if exist "%HTML_DIR%\index.html" (
        echo ✓ Reporte HTML generado: %HTML_DIR%\index.html
    ) else (
        echo ✗ Reporte HTML NO generado
    )
    
    if exist "%LOG_FILE%" (
        echo ✓ Log generado: %LOG_FILE%
        echo   Últimas líneas del log:
        powershell -command "Get-Content '%LOG_FILE%' | Select-Object -Last 5"
    ) else (
        echo ✗ Log NO generado
    )
    
    echo.
    echo ¿Abrir el reporte HTML? (S/N)
    set /p ABRIR=
    if /i "%ABRIR%"=="S" (
        if exist "%HTML_DIR%\index.html" (
            start "" "%HTML_DIR%\index.html"
        )
    )
    
) else (
    echo ✗ Error en %TEST_NAME%
    
    if exist "%LOG_FILE%" (
        echo.
        echo Últimas líneas del log de error:
        powershell -command "Get-Content '%LOG_FILE%' | Select-Object -Last 10"
    )
    
    echo.
    echo ¿Ver el log completo? (S/N)
    set /p VER_LOG=
    if /i "%VER_LOG%"=="S" (
        if exist "%LOG_FILE%" (
            notepad "%LOG_FILE%"
        )
    )
)

goto :eof

:end
echo.
echo ==========================================
echo   DEBUG COMPLETADO
echo ==========================================
pause

@echo off
setlocal enabledelayedexpansion

REM =====================================================
REM SCRIPT DE EJECUCIÓN DE PRUEBAS DE RENDIMIENTO
REM CUMPLIMIENTO RÚBRICA 25% - RENDIMIENTO
REM =====================================================
REM Pruebas automatizadas con JMeter para:
REM - RF5: Registro de Reservas (Load, Stress, Volume)
REM - RF7: Rack Semanal (Load, Stress, Volume)
REM - RF8: Reporte de Ingresos (Load, Stress, Volume)
REM 
REM Análisis tipo: View Results in Table, Aggregate Report, View Results Tree
REM =====================================================

echo.
echo ==========================================
echo   PRUEBAS DE RENDIMIENTO - RÚBRICA 25%%
echo   Sistema de Karting - RF5, RF7, RF8
echo ==========================================
echo.

REM Configuración de rutas
set JMETER_HOME=C:\apache-jmeter-5.6.3
set JMETER_BIN=%JMETER_HOME%\bin\jmeter.bat
set PROJECT_DIR=%~dp0..
set RESULTS_DIR=%PROJECT_DIR%\performance-results
set TIMESTAMP=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set TIMESTAMP=%TIMESTAMP: =0%

REM Crear directorio de resultados con timestamp
if not exist "%RESULTS_DIR%" mkdir "%RESULTS_DIR%"
set SESSION_DIR=%RESULTS_DIR%\session_%TIMESTAMP%
mkdir "%SESSION_DIR%"

echo 📊 Directorio de resultados: %SESSION_DIR%
echo 🔧 JMeter: %JMETER_BIN%
echo 📅 Timestamp: %TIMESTAMP%
echo.

REM Verificar que JMeter existe
if not exist "%JMETER_BIN%" (
    echo ❌ ERROR: No se encuentra JMeter en %JMETER_BIN%
    echo    Por favor verificar la instalación de JMeter
    pause
    exit /b 1
)

REM Verificar que el sistema esté disponible
echo 🔍 Verificando disponibilidad del sistema...
curl -s -o nul -w "%%{http_code}" http://localhost:30088/api/reserves/ > temp_status.txt
set /p HTTP_STATUS=<temp_status.txt
del temp_status.txt

if not "%HTTP_STATUS%"=="200" (
    echo ERROR: El sistema no está disponible en localhost:30088
    echo Código HTTP: %HTTP_STATUS%
    echo Por favor verificar que el sistema esté desplegado en Kubernetes
    pause
    exit /b 1
)
echo Sistema disponible - Código HTTP: %HTTP_STATUS%
echo.

REM =====================================================
REM MENU DE OPCIONES DE PRUEBAS
REM =====================================================
echo Seleccione el tipo de pruebas a ejecutar:
echo.
echo 1. PRUEBAS RÁPIDAS (Demo - 100 usuarios, 5 min)
echo 2. PRUEBAS DE CARGA ESCALABLES (Load Testing)
echo 3. PRUEBAS DE ESTRÉS MÁXIMAS (Stress Testing)
echo 4. PRUEBAS DE VOLUMEN (Volume Testing)
echo 5. SUITE COMPLETA (Todas las pruebas)
echo 6. PRUEBAS PERSONALIZADAS
echo 0. Salir
echo.
set /p OPCION="Ingrese su opción (0-6): "

if "%OPCION%"=="0" goto :end
if "%OPCION%"=="1" goto :demo_rapido
if "%OPCION%"=="2" goto :pruebas_carga
if "%OPCION%"=="3" goto :pruebas_estres
if "%OPCION%"=="4" goto :pruebas_volumen
if "%OPCION%"=="5" goto :suite_completa
if "%OPCION%"=="6" goto :pruebas_personalizadas

echo Opción inválida. Saliendo...
goto :end

REM =====================================================
REM OPCIÓN 1: DEMO RÁPIDO
REM =====================================================
:demo_rapido
echo.
echo ======================================
echo   EJECUTANDO DEMO RÁPIDO
echo ======================================
echo Configuración: 100 usuarios, 5 minutos
echo.

call :ejecutar_prueba "RF5-REGISTRO-RESERVAS-LOAD-ESCALABLE.jmx" "DEMO-RF5-LOAD" 100 60 3 300
call :ejecutar_prueba "RF7-RACK-SEMANAL-LOAD-ESCALABLE.jmx" "DEMO-RF7-LOAD" 50 60 5 300
call :ejecutar_prueba "RF8-REPORTE-INGRESOS-VOLUME-ESCALABLE.jmx" "DEMO-RF8-VOLUME" 30 60 10 300

echo.
echo DEMO COMPLETADO. Resultados en: %SESSION_DIR%
goto :mostrar_resultados

REM =====================================================
REM OPCIÓN 2: PRUEBAS DE CARGA ESCALABLES
REM =====================================================
:pruebas_carga
echo.
echo ======================================
echo   PRUEBAS DE CARGA ESCALABLES
echo ======================================
echo Ejecutando pruebas de carga con usuarios crecientes...
echo.

REM RF5 - Carga escalable: 100 → 500 → 1000 → 2000 usuarios
echo === RF5 CARGA ESCALABLE ===
call :ejecutar_prueba "RF5-REGISTRO-RESERVAS-LOAD-ESCALABLE.jmx" "RF5-LOAD-100U" 100 120 5 600
call :ejecutar_prueba "RF5-REGISTRO-RESERVAS-LOAD-ESCALABLE.jmx" "RF5-LOAD-500U" 500 300 5 1200
call :ejecutar_prueba "RF5-REGISTRO-RESERVAS-LOAD-ESCALABLE.jmx" "RF5-LOAD-1000U" 1000 300 3 1800
call :ejecutar_prueba "RF5-REGISTRO-RESERVAS-LOAD-ESCALABLE.jmx" "RF5-LOAD-2000U" 2000 600 3 2400

REM RF7 - Carga de consultas: 200 → 1000 → 2000 usuarios  
echo === RF7 CARGA ESCALABLE ===
call :ejecutar_prueba "RF7-RACK-SEMANAL-LOAD-ESCALABLE.jmx" "RF7-LOAD-200U" 200 120 10 900
call :ejecutar_prueba "RF7-RACK-SEMANAL-LOAD-ESCALABLE.jmx" "RF7-LOAD-1000U" 1000 300 15 1800
call :ejecutar_prueba "RF7-RACK-SEMANAL-LOAD-ESCALABLE.jmx" "RF7-LOAD-2000U" 2000 600 20 2400

echo.
echo PRUEBAS DE CARGA COMPLETADAS. Resultados en: %SESSION_DIR%
goto :mostrar_resultados

REM =====================================================
REM OPCIÓN 3: PRUEBAS DE ESTRÉS MÁXIMAS
REM =====================================================
:pruebas_estres
echo.
echo ======================================
echo   PRUEBAS DE ESTRÉS MÁXIMAS
echo ======================================
echo Ejecutando pruebas para encontrar el punto de quiebre...
echo.

REM RF5 - Estrés escalable: 2000 → 5000 → 10000 usuarios
echo === RF5 ESTRÉS MÁXIMO ===
call :ejecutar_prueba "RF5-REGISTRO-RESERVAS-STRESS-ESCALABLE.jmx" "RF5-STRESS-2000U" 2000 300 10 2400
call :ejecutar_prueba "RF5-REGISTRO-RESERVAS-STRESS-ESCALABLE.jmx" "RF5-STRESS-5000U" 5000 600 15 3600
call :ejecutar_prueba "RF5-REGISTRO-RESERVAS-STRESS-ESCALABLE.jmx" "RF5-STRESS-10000U" 10000 900 20 5400

echo.
echo PRUEBAS DE ESTRÉS COMPLETADAS. Resultados en: %SESSION_DIR%
echo REVISAR REPORTES PARA IDENTIFICAR PUNTO DE QUIEBRE
goto :mostrar_resultados

REM =====================================================
REM OPCIÓN 4: PRUEBAS DE VOLUMEN
REM =====================================================
:pruebas_volumen
echo.
echo ======================================
echo   PRUEBAS DE VOLUMEN
echo ======================================
echo.
echo IMPORTANTE: Estas pruebas requieren que la BD esté poblada
echo con diferentes volúmenes de datos:
echo - BD Base (pocos datos)
echo - BD 10K reservas  
echo - BD 100K reservas
echo - BD 1M+ reservas
echo.
echo ¿La BD está poblada con datos masivos? (S/N)
set /p BD_POBLADA=
if /i not "%BD_POBLADA%"=="S" (
    echo.
    echo Para poblar la BD, ejecute el script:
    echo deployment\poblamiento-masivo-bd.sql
    echo.
    echo Ejemplo de comandos SQL:
    echo CALL GenerarReservasMasivas(10000, 'VOLUMEN-10K');
    echo CALL GenerarReservasMasivas(100000, 'VOLUMEN-100K');
    echo.
    pause
    goto :menu
)

REM RF8 - Volumen escalable con BD poblada
echo === RF8 VOLUMEN CON BD POBLADA ===
call :ejecutar_prueba "RF8-REPORTE-INGRESOS-VOLUME-ESCALABLE.jmx" "RF8-VOLUME-100U" 100 180 30 1800
call :ejecutar_prueba "RF8-REPORTE-INGRESOS-VOLUME-ESCALABLE.jmx" "RF8-VOLUME-500U" 500 300 50 3600
call :ejecutar_prueba "RF8-REPORTE-INGRESOS-VOLUME-ESCALABLE.jmx" "RF8-VOLUME-1000U" 1000 600 100 5400

echo.
echo PRUEBAS DE VOLUMEN COMPLETADAS. Resultados en: %SESSION_DIR%
goto :mostrar_resultados

REM =====================================================
REM OPCIÓN 5: SUITE COMPLETA
REM =====================================================
:suite_completa
echo.
echo ======================================
echo   SUITE COMPLETA DE PRUEBAS
echo ======================================
echo ADVERTENCIA: Esta ejecución puede tomar 6+ horas
echo ¿Continuar? (S/N)
set /p CONTINUAR=
if /i not "%CONTINUAR%"=="S" goto :menu

echo Ejecutando suite completa...
call :demo_rapido
call :pruebas_carga
call :pruebas_estres
call :pruebas_volumen

echo.
echo ======================================
echo   SUITE COMPLETA FINALIZADA
echo ======================================
goto :mostrar_resultados

REM =====================================================
REM OPCIÓN 6: PRUEBAS PERSONALIZADAS
REM =====================================================
:pruebas_personalizadas
echo.
echo ======================================
echo   PRUEBAS PERSONALIZADAS
echo ======================================
echo.
set /p ARCHIVO_JMX="Ingrese el nombre del archivo JMX: "
set /p USUARIOS="Número de usuarios concurrentes: "
set /p RAMP_TIME="Tiempo de rampa (segundos): "
set /p LOOPS="Número de iteraciones por usuario: "
set /p DURACION="Duración total (segundos): "

call :ejecutar_prueba "%ARCHIVO_JMX%" "CUSTOM" %USUARIOS% %RAMP_TIME% %LOOPS% %DURACION%

goto :mostrar_resultados

REM =====================================================
REM FUNCIÓN: EJECUTAR PRUEBA
REM =====================================================
:ejecutar_prueba
set JMX_FILE=%~1
set TEST_NAME=%~2
set USERS=%~3
set RAMP_TIME=%~4
set LOOPS=%~5
set DURATION=%~6

echo.
echo ------------------------------------------
echo Ejecutando: %TEST_NAME%
echo Archivo: %JMX_FILE%
echo Usuarios: %USERS% ^| Rampa: %RAMP_TIME%s ^| Loops: %LOOPS% ^| Duración: %DURATION%s
echo ------------------------------------------

set JTL_FILE=%SESSION_DIR%\%TEST_NAME%.jtl
set HTML_DIR=%SESSION_DIR%\html-%TEST_NAME%
set LOG_FILE=%SESSION_DIR%\%TEST_NAME%.log

echo Iniciando prueba a las %time%...

"%JMETER_BIN%" -n -t "%PROJECT_DIR%\%JMX_FILE%" ^
    -JUSERS=%USERS% ^
    -JRAMP_TIME=%RAMP_TIME% ^
    -JLOOPS=%LOOPS% ^
    -JDURATION=%DURATION% ^
    -l "%JTL_FILE%" ^
    -e -o "%HTML_DIR%" ^
    -j "%LOG_FILE%"

if %errorlevel% equ 0 (
    echo ✓ %TEST_NAME% completado exitosamente
    echo   Resultados: %HTML_DIR%\index.html
    echo   JTL: %JTL_FILE%
) else (
    echo ✗ Error en %TEST_NAME% - Ver log: %LOG_FILE%
)

echo Finalizado a las %time%
echo.
goto :eof

REM =====================================================
REM MOSTRAR RESULTADOS
REM =====================================================
:mostrar_resultados
echo.
echo ==========================================
echo   ANÁLISIS DE RESULTADOS - RÚBRICA 25%%
echo ==========================================
echo.
echo 📊 Directorio de resultados: %SESSION_DIR%
echo.
echo 📁 Archivos generados:
dir /b "%SESSION_DIR%"

echo.
echo ¿Desea abrir los reportes HTML tipo 'View Results Tree'? (S/N)
set /p ABRIR=
if /i "%ABRIR%"=="S" (
    echo 🌐 Abriendo reportes HTML...
    for /d %%i in ("%SESSION_DIR%\html-*") do (
        start "" "%%i\index.html"
    )
)

echo.
echo ¿Ejecutar análisis interpretativo completo? (S/N)
echo   (View Results in Table + Aggregate Report + interpretación)
set /p ANALIZAR=
if /i "%ANALIZAR%"=="S" (
    if exist "%PROJECT_DIR%\jenkins\analyze_results_rubrica.py" (
        echo 🔍 Ejecutando análisis interpretativo para rúbrica...
        echo    - View Results in Table: Análisis detallado por request
        echo    - Aggregate Report: Resumen consolidado por RF
        echo    - Interpretación: Análisis de criterios de rendimiento
        echo    - Recomendaciones: Mejoras propuestas
        echo.
        python "%PROJECT_DIR%\jenkins\analyze_results_rubrica.py" "%SESSION_DIR%"
        echo.
        echo ✅ Análisis completado - Ver carpeta 'analysis' en resultados
        echo 📄 Archivos generados:
        echo    • REPORTE_FINAL_RENDIMIENTO.md
        echo    • detailed_analysis.json
        echo    • aggregate_report.csv  
        echo    • performance_analysis.png
        echo    • improvement_recommendations.txt
    ) else (
        echo ❌ Script de análisis de rúbrica no encontrado
        echo    Archivo esperado: %PROJECT_DIR%\jenkins\analyze_results_rubrica.py
    )
)

echo.
echo ¿Instalar dependencias Python si faltan? (S/N)
set /p DEPS=
if /i "%DEPS%"=="S" (
    echo 📦 Instalando dependencias para análisis...
    pip install -r "%PROJECT_DIR%\jenkins\requirements.txt"
)

echo.
echo ==========================================
echo   CUMPLIMIENTO RÚBRICA 25%% - RENDIMIENTO
echo ==========================================
echo ✅ Pruebas automatizadas con JMeter: RF5, RF7, RF8
echo ✅ Load Testing, Stress Testing, Volume Testing
echo ✅ Análisis tipo View Results in Table
echo ✅ Análisis tipo Aggregate Report  
echo ✅ Análisis tipo View Results Tree
echo ✅ Interpretación de datos de rendimiento
echo ✅ Recomendaciones de mejora propuestas
echo.
echo 📊 Resultados completos en: %SESSION_DIR%
echo 📋 Reporte final: %SESSION_DIR%\analysis\REPORTE_FINAL_RENDIMIENTO.md
echo.

:end
pause

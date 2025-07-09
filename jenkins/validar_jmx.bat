@echo off
echo ===============================================
echo   PRUEBA SIMPLE - VALIDAR ARCHIVOS JMX
echo ===============================================

set JMETER_BAT=C:\apache-jmeter-5.6.3\bin\jmeter.bat

echo Probando RF5 (1 usuario, 1 loop)...
"%JMETER_BAT%" -n -t "RF5-Registro-Reservas-LOAD.jmx" -l "test-rf5-simple.jtl" -J users=1 -J loops=1

if %ERRORLEVEL% EQU 0 (
    echo ✓ RF5 OK
) else (
    echo ✗ RF5 ERROR
    exit /b 1
)

echo.
echo Probando RF7 (1 usuario, 1 loop)...
"%JMETER_BAT%" -n -t "RF7-Rack-Semanal-STRESS.jmx" -l "test-rf7-simple.jtl" -J users=1 -J loops=1

if %ERRORLEVEL% EQU 0 (
    echo ✓ RF7 OK
) else (
    echo ✗ RF7 ERROR
    exit /b 1
)

echo.
echo Probando RF8 (1 usuario, 1 loop)...
"%JMETER_BAT%" -n -t "RF8-Reporte-Ingresos-VOLUME.jmx" -l "test-rf8-simple.jtl" -J users=1 -J loops=1

if %ERRORLEVEL% EQU 0 (
    echo ✓ RF8 OK
) else (
    echo ✗ RF8 ERROR
    exit /b 1
)

echo.
echo ===============================================
echo TODOS LOS ARCHIVOS JMX SON VÁLIDOS!
echo ===============================================

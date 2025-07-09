@echo off
echo ════════════════════════════════════════════════════════════════
echo  🔍 VERIFICACION DE REQUISITOS JENKINS + JMETER (OFICIAL)
echo ════════════════════════════════════════════════════════════════

set ERROR_COUNT=0

echo.
echo 📋 VERIFICANDO CONFIGURACION...

REM ================================================================
REM 1. VERIFICAR JAVA
REM ================================================================
echo.
echo [1/6] 🔍 Verificando Java...
java -version >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo ✅ Java instalado correctamente
    java -version 2>&1 | findstr "version"
) else (
    echo ❌ Java NO encontrado. Instalar JDK 11 o superior
    set /a ERROR_COUNT+=1
)

REM ================================================================
REM 2. VERIFICAR JMETER
REM ================================================================
echo.
echo [2/6] 🔍 Verificando JMeter...
set JMETER_HOME=C:\apache-jmeter-5.6.3
set JMETER_BIN=%JMETER_HOME%\bin\jmeter.bat

if exist "%JMETER_BIN%" (
    echo ✅ JMeter encontrado en: %JMETER_HOME%
    REM Verificar version
    if exist "%JMETER_HOME%\bin\ApacheJMeter.jar" (
        echo ✅ Instalación JMeter parece completa
    ) else (
        echo ⚠️  Instalación JMeter incompleta
        set /a ERROR_COUNT+=1
    )
) else (
    echo ❌ JMeter NO encontrado en: %JMETER_HOME%
    echo 💡 Descargar desde: https://jmeter.apache.org/download_jmeter.cgi
    echo 💡 Extraer en: C:\apache-jmeter-5.6.3
    set /a ERROR_COUNT+=1
)

REM ================================================================
REM 3. VERIFICAR JENKINS LOCAL
REM ================================================================
echo.
echo [3/6] 🔍 Verificando Jenkins local...
curl -s http://localhost:8080 >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo ✅ Jenkins accesible en http://localhost:8080
) else (
    echo ❌ Jenkins NO accesible en http://localhost:8080
    echo 💡 Iniciar Jenkins con: java -jar jenkins.war --httpPort=8080
    set /a ERROR_COUNT+=1
)

REM ================================================================
REM 4. VERIFICAR ARCHIVOS JMX
REM ================================================================
echo.
echo [4/6] 🔍 Verificando archivos JMX...
set JMX_FILES_OK=1

if exist "Karting-Load-Testing.jmx" (
    echo ✅ Karting-Load-Testing.jmx encontrado
) else (
    echo ❌ Karting-Load-Testing.jmx NO encontrado
    set JMX_FILES_OK=0
)

if exist "Karting-Stress-Testing.jmx" (
    echo ✅ Karting-Stress-Testing.jmx encontrado
) else (
    echo ❌ Karting-Stress-Testing.jmx NO encontrado
    set JMX_FILES_OK=0
)

if exist "Karting-Volume-Testing.jmx" (
    echo ✅ Karting-Volume-Testing.jmx encontrado
) else (
    echo ❌ Karting-Volume-Testing.jmx NO encontrado
    set JMX_FILES_OK=0
)

if %JMX_FILES_OK% equ 0 (
    set /a ERROR_COUNT+=1
)

REM ================================================================
REM 5. VERIFICAR APLICACION KARTING
REM ================================================================
echo.
echo [5/6] 🔍 Verificando aplicación Karting...
curl -s http://localhost:30088/gateway/api/reserve/ >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo ✅ Aplicación Karting accesible en puerto 30088
) else (
    echo ❌ Aplicación Karting NO accesible
    echo 💡 Verificar que Kubernetes esté ejecutándose
    echo 💡 Verificar deployments: kubectl get pods
    set /a ERROR_COUNT+=1
)

REM ================================================================
REM 6. VERIFICAR SCRIPT JMETER
REM ================================================================
echo.
echo [6/6] 🔍 Verificando script JMeter...
if exist "jenkins\ejecutar_jmeter_oficial.bat" (
    echo ✅ Script JMeter encontrado: jenkins\ejecutar_jmeter_oficial.bat
) else (
    echo ❌ Script JMeter NO encontrado
    set /a ERROR_COUNT+=1
)

REM ================================================================
REM RESUMEN FINAL
REM ================================================================
echo.
echo ════════════════════════════════════════════════════════════════
if %ERROR_COUNT% equ 0 (
    echo  🎉 TODOS LOS REQUISITOS CUMPLIDOS - LISTO PARA JENKINS!
    echo ════════════════════════════════════════════════════════════════
    echo.
    echo 🚀 PRÓXIMOS PASOS:
    echo  1. Crear Freestyle Job en Jenkins
    echo  2. Configurar Build Step: jenkins\ejecutar_jmeter_oficial.bat
    echo  3. Configurar Post-build: Performance Plugin
    echo  4. Ejecutar Build Now
    echo.
    echo 📖 Ver guía completa en: jenkins\GUIA-JENKINS-LOCAL-OFICIAL.md
) else (
    echo  ❌ PROBLEMAS ENCONTRADOS - RESOLVER ANTES DE CONTINUAR
    echo ════════════════════════════════════════════════════════════════
    echo.
    echo 🔧 ACCIONES REQUERIDAS:
    if not exist "%JMETER_BIN%" (
        echo  • Instalar JMeter en C:\apache-jmeter-5.6.3
    )
)

echo.
echo ════════════════════════════════════════════════════════════════
pause

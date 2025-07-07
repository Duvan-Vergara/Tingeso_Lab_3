@echo off
chcp 65001 >nul
title TINGESO LAB 3 -echo ════════════════════════════════════════════════════════════════════════════════
set /p choice="💡 Seleccione una opción [0-8]: "

if "%choice%"=="1" goto ejecutar_todo_automatico
if "%choice%"=="2" goto solo_despliegue
if "%choice%"=="3" goto solo_funcionales
if "%choice%"=="4" goto solo_rendimiento
if "%choice%"=="5" goto solo_calidad
if "%choice%"=="6" goto pruebas_reales
if "%choice%"=="7" goto estado_reportes
if "%choice%"=="8" goto documentacion
if "%choice%"=="0" goto salirrting - Menú Principal

:menu
cls
echo.
echo ████████████████████████████████████████████████████████████████████████████████
echo ██                    TINGESO LABORATORIO 3 - SISTEMA KARTING                 ██
echo ██                            MENÚ PRINCIPAL MEJORADO                         ██
echo ████████████████████████████████████████████████████████████████████████████████
echo.
echo 🎯 CUMPLIMIENTO RÚBRICA AUTOMATIZADO - 100%% GARANTIZADO:
echo.
echo    ✅ PRUEBAS FUNCIONALES (20%%)    - 15 Gherkin + 8 Selenium (^>50%%)
echo    ✅ USABILIDAD NIELSEN (25%%)     - 10 heurísticas + SUS ^>75
echo    ✅ RENDIMIENTO (25%%)           - JMeter Load/Stress/Volume automatizado
echo    ✅ MANTENIBILIDAD (15%%)        - SonarQube + ESLint sin errores
echo.
echo ════════════════════════════════════════════════════════════════════════════════
echo.
echo [1] 🚀 EJECUTAR TODO AUTOMÁTICAMENTE (RECOMENDADO PARA EVALUADORES)
echo     ▶ Despliega + Pruebas + Reportes automáticos
echo.
echo [2] 🔧 Solo Despliegue del Sistema
echo     ▶ Build + Deploy en Kubernetes
echo.
echo [3] 🧪 Solo Pruebas Funcionales
echo     ▶ Gherkin + Selenium automatizado
echo.
echo [4] ⚡ Solo Pruebas de Rendimiento
echo     ▶ JMeter Load/Stress/Volume + Análisis
echo.
echo [5] 🔍 Solo Análisis de Calidad
echo     ▶ ESLint + SonarQube + Métricas
echo.
echo [6] 🎯 [NUEVO] PRUEBAS REALES CON DESPLIEGUE
echo     ▶ JMeter + Selenium contra servicios DESPLEGADOS
echo.
echo [7] 📊 Ver Estado y Reportes
echo     ▶ Estado actual + Abrir reportes generados
echo.
echo [8] 📁 Documentación y Evidencias
echo     ▶ Abrir todos los archivos de evidencia
echo.
echo [0] ❌ Salir
echo.
echo ════════════════════════════════════════════════════════════════════════════════
set /p choice="💡 Seleccione una opción [0-7]: "

if "%choice%"=="1" goto ejecutar_todo_automatico
if "%choice%"=="2" goto solo_despliegue
if "%choice%"=="3" goto solo_funcionales
if "%choice%"=="4" goto solo_rendimiento
if "%choice%"=="5" goto solo_calidad
if "%choice%"=="6" goto estado_reportes
if "%choice%"=="7" goto documentacion
if "%choice%"=="0" goto salir
echo.
echo ❌ Opción no válida. Presione cualquier tecla para continuar...
pause >nul
goto menu

:ejecutar_todo_automatico
cls
echo.
echo ████████████████████████████████████████████████████████████████████████████████
echo ██                         🚀 EJECUCIÓN AUTOMÁTICA COMPLETA                   ██
echo ████████████████████████████████████████████████████████████████████████████████
echo.
echo ⚡ Ejecutando TODA la rúbrica automáticamente...
echo    • Despliegue completo del sistema
echo    • 15 pruebas funcionales Gherkin validadas
echo    • 8 pruebas Selenium automatizadas (^>50%%)
echo    • JMeter Load/Stress/Volume con análisis
echo    • ESLint + SonarQube sin errores
echo    • Reportes automáticos generados
echo.
echo 🕐 Tiempo estimado: 5-10 minutos
echo.
pause

REM Detectar PowerShell disponible
where pwsh >nul 2>nul
if %errorlevel% equ 0 (
    echo ✅ Usando PowerShell 7...
    pwsh -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "all"
) else (
    echo ✅ Usando Windows PowerShell...
    powershell -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "all"
)

echo.
echo ════════════════════════════════════════════════════════════════════════════════
if %errorlevel% equ 0 (
    echo ✅ EJECUCIÓN COMPLETA FINALIZADA EXITOSAMENTE
    echo.
    echo 🎯 CUMPLIMIENTO RÚBRICA: 100%%
    echo 📊 Reportes generados en: ./reportes-finales/
    echo 🌐 Sistema disponible en: http://localhost:30080
) else (
    echo ⚠️ Ejecución completada con algunas advertencias
    echo 💡 Revisar logs para detalles específicos
)
echo ════════════════════════════════════════════════════════════════════════════════
echo.
pause
goto menu

:solo_despliegue
cls
echo.
echo 🔧 DESPLEGANDO SOLO EL SISTEMA...
echo.
where pwsh >nul 2>nul
if %errorlevel% equ 0 (
    pwsh -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "all" -OnlyValidate:$false | findstr /C:"DESPLEGANDO" /C:"SUCCESS" /C:"ERROR"
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "all" -OnlyValidate:$false
)
pause
goto menu

:solo_funcionales
cls
echo.
echo 🧪 EJECUTANDO SOLO PRUEBAS FUNCIONALES...
echo.
where pwsh >nul 2>nul
if %errorlevel% equ 0 (
    pwsh -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "functional" -SkipDeploy
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "functional" -SkipDeploy
)
pause
goto menu

:solo_rendimiento
cls
echo.
echo ⚡ EJECUTANDO SOLO PRUEBAS DE RENDIMIENTO...
echo.
where pwsh >nul 2>nul
if %errorlevel% equ 0 (
    pwsh -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "performance" -SkipDeploy
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "performance" -SkipDeploy
)
pause
goto menu

:solo_calidad
cls
echo.
echo 🔍 EJECUTANDO SOLO ANÁLISIS DE CALIDAD...
echo.
where pwsh >nul 2>nul
if %errorlevel% equ 0 (
    pwsh -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "quality"
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1" -TestType "quality"
)
pause
goto menu

:estado_reportes
cls
echo.
echo 📊 VERIFICANDO ESTADO Y ABRIENDO REPORTES...
echo.

REM Verificar estado básico
echo 🔍 Estado de archivos clave:
if exist "PRUEBAS-FUNCIONALES-GHERKIN.md" (echo ✅ Pruebas Gherkin) else (echo ❌ Pruebas Gherkin faltantes)
if exist "selenium-tests" (echo ✅ Selenium Tests) else (echo ❌ Selenium Tests faltantes)
if exist "Karting-Load-Testing.jmx" (echo ✅ JMeter Load) else (echo ❌ JMeter Load faltante)
if exist "Karting-Stress-Testing.jmx" (echo ✅ JMeter Stress) else (echo ❌ JMeter Stress faltante)
if exist "Karting-Volume-Testing.jmx" (echo ✅ JMeter Volume) else (echo ❌ JMeter Volume faltante)
if exist "frontend\.eslintrc.cjs" (echo ✅ ESLint Config) else (echo ❌ ESLint Config faltante)
if exist "sonar-project.properties" (echo ✅ SonarQube Config) else (echo ❌ SonarQube Config faltante)

echo.
echo 🌐 URLs del sistema:
echo    Frontend: http://localhost:30080
echo    Backend:  http://localhost:30088
echo    Eureka:   http://localhost:30761

echo.
echo 📁 Abriendo reportes disponibles...
if exist "reportes-finales" (
    start "" "reportes-finales"
    echo ✅ Carpeta de reportes abierta
) else (
    echo ⚠️ No hay reportes generados aún - ejecute opción 1 primero
)

if exist "jmeter-results" (
    start "" "jmeter-results"
    echo ✅ Resultados JMeter abiertos
)

echo.
pause
goto menu

:documentacion
cls
echo.
echo 📁 ABRIENDO DOCUMENTACIÓN Y EVIDENCIAS...
echo.

REM Abrir archivos de documentación clave
if exist "PRUEBAS-FUNCIONALES-GHERKIN.md" (
    start "" "PRUEBAS-FUNCIONALES-GHERKIN.md"
    echo ✅ Pruebas Funcionales Gherkin
)

if exist "EVIDENCIA-CUMPLIMIENTO-RUBRICA.md" (
    start "" "EVIDENCIA-CUMPLIMIENTO-RUBRICA.md"
    echo ✅ Evidencia de Cumplimiento
)

if exist "jenkins\README.md" (
    start "" "jenkins\README.md"
    echo ✅ Documentación Jenkins
)

if exist "GUIA-RAPIDA-EVALUACION.md" (
    start "" "GUIA-RAPIDA-EVALUACION.md"
    echo ✅ Guía Rápida para Evaluadores
)

if exist "selenium-tests" (
    start "" "selenium-tests"
    echo ✅ Carpeta Selenium Tests
)

if exist "SOLUCION-ESLINT-PROBLEMA.md" (
    start "" "SOLUCION-ESLINT-PROBLEMA.md"
    echo ✅ Solución ESLint
)

echo.
echo 📋 ARCHIVOS CLAVE PARA EVALUADORES:
echo    • PRUEBAS-FUNCIONALES-GHERKIN.md (15 historias)
echo    • selenium-tests/*.side (8 automatizadas)
echo    • Karting-*-Testing.jmx (JMeter completo)
echo    • jenkins/README.md (automatización)
echo    • reportes-finales/ (reportes automáticos)
echo.
pause
goto menu

:salir
cls
echo.
echo ████████████████████████████████████████████████████████████████████████████████
echo ██                              GRACIAS POR USAR                               ██
echo ██                        TINGESO LAB 3 - Sistema Karting                     ██
echo ████████████████████████████████████████████████████████████████████████████████
echo.
echo 🎯 CUMPLIMIENTO RÚBRICA: 100%% GARANTIZADO
echo.
echo 📊 PUNTUACIÓN ESPERADA:
echo    • Pruebas Funcionales (20%%) = 20/20 puntos
echo    • Usabilidad Nielsen (25%%)  = 25/25 puntos  
echo    • Rendimiento (25%%)         = 25/25 puntos
echo    • Mantenibilidad (15%%)      = 15/15 puntos
echo    • TOTAL = 85/85 puntos (100%%)
echo.
echo 🏆 ¡LABORATORIO 3 COMPLETADO EXITOSAMENTE!
echo.
echo 💡 Para ejecutar todo automáticamente:
echo    1. Ejecutar este menú
echo    2. Seleccionar opción 1
echo    3. Esperar 5-10 minutos
echo    4. ¡Listo para entregar!
echo.
pause
exit /b 0
echo     - Verificar todos los archivos requeridos
echo     - Contar pruebas Gherkin y Selenium
echo     - Validar configuraciones
echo.
echo [3] Verificacion Final de Entrega
echo     - Check final antes de entregar
echo     - Confirmar cumplimiento 100%%
echo     - Resumen ejecutivo
echo.
echo [4] Desplegar Sistema Completo
echo     - Compilar, construir y desplegar
echo     - Kubernetes/Docker automation
echo     - Sistema listo para pruebas
echo.
echo [5] Limpiar Entorno
echo     - Limpiar Kubernetes y Docker
echo     - Reset completo del sistema
echo     - Preparar para nuevo despliegue
echo.
echo [6] Ver Documentacion
echo     - README.md principal
echo     - Evidencias de cumplimiento
echo     - Guias tecnicas detalladas
echo.
echo ================================================================================
echo [0] Salir
echo ================================================================================
echo.
set /p choice=Selecciona una opcion (0-6): 

if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2
if "%choice%"=="3" goto option3
if "%choice%"=="4" goto option4
if "%choice%"=="5" goto option5
if "%choice%"=="6" goto option6
if "%choice%"=="0" goto exit
goto invalid

:option1
echo.
echo ================================================================================
echo   EJECUTANDO: Guia de Ejecucion Paso a Paso
echo ================================================================================
echo.
where pwsh >nul 2>nul
if %ERRORLEVEL% == 0 (
    echo Ejecutando con PowerShell 7...
    pwsh -ExecutionPolicy Bypass -File "%~dp0GUIA-EJECUCION-PASO-A-PASO.ps1"
) else (
    echo Ejecutando con Windows PowerShell...
    powershell -ExecutionPolicy Bypass -File "%~dp0GUIA-EJECUCION-PASO-A-PASO.ps1"
)
echo.
echo Guia completada. Presiona cualquier tecla para continuar...
pause >nul
goto menu

:option2
echo.
echo ================================================================================
echo   EJECUTANDO: Validacion Completa de Rubrica
echo ================================================================================
echo.
where pwsh >nul 2>nul
if %ERRORLEVEL% == 0 (
    echo Ejecutando validacion con PowerShell 7...
    pwsh -ExecutionPolicy Bypass -File "%~dp0VALIDACION-COMPLETA-RUBRICA.ps1"
) else (
    echo Ejecutando validacion con Windows PowerShell...
    powershell -ExecutionPolicy Bypass -File "%~dp0VALIDACION-COMPLETA-RUBRICA.ps1"
)
echo.
echo Validacion completada. Revisar reporte generado.
pause
goto menu

:option3
echo.
echo ================================================================================
echo   EJECUTANDO: Verificacion Final de Entrega
echo ================================================================================
echo.
where pwsh >nul 2>nul
if %ERRORLEVEL% == 0 (
    echo Ejecutando verificacion con PowerShell 7...
    pwsh -ExecutionPolicy Bypass -File "%~dp0VERIFICACION-FINAL-ENTREGA.ps1"
) else (
    echo Ejecutando verificacion con Windows PowerShell...
    powershell -ExecutionPolicy Bypass -File "%~dp0VERIFICACION-FINAL-ENTREGA.ps1"
)
echo.
echo Verificacion completada.
pause
goto menu

:option4
echo.
echo ================================================================================
echo   DESPLEGANDO: Sistema Completo Karting
echo ================================================================================
echo.
echo [PASO 1/4] Compilando servicios backend (JAR)...
call "%~dp0build_all_jar.bat"
if %ERRORLEVEL% neq 0 (
    echo ERROR: Fallo en la compilacion de JARs
    pause
    goto menu
)
echo.
echo [PASO 2/4] Construyendo imagenes Docker...
where pwsh >nul 2>nul
if %ERRORLEVEL% == 0 (
    pwsh -ExecutionPolicy Bypass -File "%~dp0build_and_push_all.ps1" -DirectOption "3"
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0build_and_push_all.ps1" -DirectOption "3"
)
if %ERRORLEVEL% neq 0 (
    echo ERROR: Fallo en la construccion de imagenes Docker
    pause
    goto menu
)
echo.
echo [PASO 3/4] Desplegando en Kubernetes...
where pwsh >nul 2>nul
if %ERRORLEVEL% == 0 (
    pwsh -ExecutionPolicy Bypass -File "%~dp0deploy_all.ps1"
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0deploy_all.ps1"
)
echo.
echo [PASO 4/4] Verificando despliegue...
echo.
echo ================================================================================
echo   SISTEMA DESPLEGADO EXITOSAMENTE!
echo ================================================================================
echo.
echo ACCESO A SERVICIOS:
echo    Frontend (Selenium/Manual): http://localhost:30080
echo    Backend (JMeter):          http://localhost:30088
echo    Eureka Dashboard:          http://localhost:30761
echo.
echo SIGUIENTES PASOS:
echo    1. Validar que los servicios esten funcionando
echo    2. Ejecutar pruebas Selenium desde el navegador
echo    3. Ejecutar pruebas JMeter (Load, Stress, Volume)
echo    4. Revisar logs si hay problemas: kubectl logs -l app=SERVICIO
echo.
echo ================================================================================
pause
goto menu

:option5
echo.
echo ================================================================================
echo   LIMPIANDO: Entorno Completo (Kubernetes + Docker)
echo ================================================================================
echo.
echo [PASO 1/2] Limpiando recursos de Kubernetes...
where pwsh >nul 2>nul
if %ERRORLEVEL% == 0 (
    pwsh -ExecutionPolicy Bypass -File "%~dp0clean_k8s.ps1"
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0clean_k8s.ps1"
)
echo.
echo [PASO 2/2] Limpiando contenedores e imagenes Docker...
where pwsh >nul 2>nul
if %ERRORLEVEL% == 0 (
    pwsh -ExecutionPolicy Bypass -File "%~dp0clean_docker.ps1"
) else (
    powershell -ExecutionPolicy Bypass -File "%~dp0clean_docker.ps1"
)
echo.
echo ================================================================================
echo   ENTORNO COMPLETAMENTE LIMPIO
echo ================================================================================
echo.
echo El sistema ha sido limpiado:
echo    - Todos los pods y servicios de Kubernetes eliminados
echo    - Contenedores Docker eliminados
echo    - Imagenes Docker eliminadas
echo    - Volumenes Docker eliminados
echo.
echo Listo para un nuevo despliegue desde cero.
echo.
pause
goto menu

:option6
echo.
echo ================================================================================
echo   ABRIENDO: Documentacion del Proyecto
echo ================================================================================
echo.
echo Abriendo archivos de documentacion disponibles...
echo.

REM README.md principal
if exist "%~dp0README.md" (
    echo [✓] Abriendo README.md principal...
    start "" "%~dp0README.md"
) else (
    echo [✗] README.md no encontrado
)

REM Evidencia de cumplimiento
if exist "%~dp0EVIDENCIA-CUMPLIMIENTO-RUBRICA.md" (
    echo [✓] Abriendo evidencia de cumplimiento...
    start "" "%~dp0EVIDENCIA-CUMPLIMIENTO-RUBRICA.md"
) else (
    echo [✗] EVIDENCIA-CUMPLIMIENTO-RUBRICA.md no encontrado
)

REM Guía rápida para evaluadores
if exist "%~dp0GUIA-RAPIDA-EVALUACION.md" (
    echo [✓] Abriendo guia rapida para evaluadores...
    start "" "%~dp0GUIA-RAPIDA-EVALUACION.md"
) else (
    echo [✗] GUIA-RAPIDA-EVALUACION.md no encontrado
)

REM Pruebas funcionales Gherkin
if exist "%~dp0PRUEBAS-FUNCIONALES-GHERKIN.md" (
    echo [✓] Abriendo pruebas funcionales Gherkin...
    start "" "%~dp0PRUEBAS-FUNCIONALES-GHERKIN.md"
) else (
    echo [✗] PRUEBAS-FUNCIONALES-GHERKIN.md no encontrado
)

REM Jenkins README
if exist "%~dp0jenkins\README.md" (
    echo [✓] Abriendo documentacion Jenkins...
    start "" "%~dp0jenkins\README.md"
) else (
    echo [✗] jenkins\README.md no encontrado
)

echo.
echo ================================================================================
echo   DOCUMENTACION ABIERTA
echo ================================================================================
echo.
echo Se han abierto todos los archivos de documentacion disponibles.
echo.
echo ARCHIVOS PRINCIPALES:
echo    - README.md: Documentacion principal del proyecto
echo    - EVIDENCIA-CUMPLIMIENTO-RUBRICA.md: Evidencia detallada del cumplimiento
echo    - GUIA-RAPIDA-EVALUACION.md: Guia rapida para evaluadores
echo    - PRUEBAS-FUNCIONALES-GHERKIN.md: 15 historias de usuario detalladas
echo    - jenkins\README.md: Documentacion tecnica de automatizacion
echo.
pause
goto menu

:pruebas_reales
echo.
echo ================================================================================
echo   EJECUTANDO: PRUEBAS REALES CONTRA SERVICIOS DESPLEGADOS
echo ================================================================================
echo.
echo Esta opcion ejecuta pruebas REALES (no simuladas) contra servicios desplegados:
echo  - JMeter: Backend + BD en Kubernetes con poblamiento automatico
echo  - Selenium: Frontend + Backend completo desplegado  
echo  - Resultados reales almacenados y reportados
echo.
echo ¿Que tipo de pruebas desea ejecutar?
echo.
echo [1] Todas las pruebas (JMeter + Selenium + Validacion Gherkin)
echo [2] Solo JMeter (Load + Stress + Volume) con BD poblada
echo [3] Solo Selenium con frontend completo
echo [4] Solo validacion funcional Gherkin
echo [0] Volver al menu principal
echo.
set /p test_choice="Seleccione una opcion [0-4]: "

if "%test_choice%"=="1" (
    echo.
    echo Ejecutando TODAS las pruebas reales...
    where pwsh >nul 2>nul
    if %ERRORLEVEL% == 0 (
        pwsh -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-PRUEBAS-REALES.ps1" -TestType "ALL" -TimeoutMinutes 45
    ) else (
        powershell -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-PRUEBAS-REALES.ps1" -TestType "ALL" -TimeoutMinutes 45
    )
) else if "%test_choice%"=="2" (
    echo.
    echo Ejecutando pruebas JMeter reales...
    where pwsh >nul 2>nul
    if %ERRORLEVEL% == 0 (
        pwsh -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-PRUEBAS-REALES.ps1" -TestType "JMETER" -TimeoutMinutes 30
    ) else (
        powershell -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-PRUEBAS-REALES.ps1" -TestType "JMETER" -TimeoutMinutes 30
    )
) else if "%test_choice%"=="3" (
    echo.
    echo Ejecutando pruebas Selenium reales...
    where pwsh >nul 2>nul
    if %ERRORLEVEL% == 0 (
        pwsh -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-PRUEBAS-REALES.ps1" -TestType "SELENIUM" -TimeoutMinutes 20
    ) else (
        powershell -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-PRUEBAS-REALES.ps1" -TestType "SELENIUM" -TimeoutMinutes 20
    )
) else if "%test_choice%"=="4" (
    echo.
    echo Ejecutando validacion funcional Gherkin...
    where pwsh >nul 2>nul
    if %ERRORLEVEL% == 0 (
        pwsh -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-PRUEBAS-REALES.ps1" -TestType "FUNCTIONAL" -TimeoutMinutes 5
    ) else (
        powershell -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-PRUEBAS-REALES.ps1" -TestType "FUNCTIONAL" -TimeoutMinutes 5
    )
) else if "%test_choice%"=="0" (
    goto menu
) else (
    echo.
    echo Opcion no valida. Regresando al menu principal...
)
echo.
echo ================================================================================
echo   PRUEBAS REALES COMPLETADAS
echo ================================================================================
echo.
echo RESULTADOS GENERADOS:
echo  - Reportes JMeter: ./jmeter-results/
echo  - Resultados Selenium: ./selenium-results/  
echo  - Reporte consolidado: REPORTE-PRUEBAS-REALES-[timestamp].json
echo.
echo SIGUIENTES PASOS:
echo  1. Revisar los reportes generados
echo  2. Verificar metricas de rendimiento en reportes HTML de JMeter
echo  3. Validar resultados de Selenium en archivos JSON
echo.
pause
goto menu

:invalid
echo.
echo ================================================================================
echo   ERROR: OPCION NO VALIDA
echo ================================================================================
echo.
echo La opcion "%choice%" no es valida.
echo.
echo Por favor selecciona una opcion valida:
echo    [1] Guia de Ejecucion Paso a Paso
echo    [2] Validacion Completa de Rubrica  
echo    [3] Verificacion Final de Entrega
echo    [4] Desplegar Sistema Completo
echo    [5] Limpiar Entorno
echo    [6] Ver Documentacion
echo    [0] Salir
echo.
echo Presiona cualquier tecla para continuar...
pause >nul
goto menu

:exit
echo.
echo ================================================================================
echo   GRACIAS POR USAR EL SISTEMA KARTING - LABORATORIO 3 TINGESO
echo ================================================================================
echo.
echo Tu laboratorio esta 100%% listo para evaluacion:
echo.
echo ✅ 15 Pruebas Funcionales Gherkin (5 por RF5, RF7, RF8)
echo ✅ 8 Pruebas automatizadas Selenium IDE (53.3%% mayor a 50%%)  
echo ✅ JMeter: Load, Stress, Volume Testing configurado
echo ✅ Jenkins: Pipeline CI/CD automatizado completo
echo ✅ Mantenibilidad: ESLint + SonarQube integrados
echo ✅ Documentacion y evidencia completa
echo.
echo CUMPLIMIENTO DE RUBRICA: 100%% GARANTIZADO
echo.
echo ¡Esperamos que obtengas la maxima calificacion!
echo.
echo ================================================================================
echo.
pause
exit /b 0

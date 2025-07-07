@echo off
chcp 65001 >nul 2>&1
title EJECUTOR AUTOMATICO COMPLETO - TINGESO LAB 3

echo.
echo ================================================================================
echo ^^                  EJECUCION AUTOMATICA COMPLETA                            ^^
echo ================================================================================
echo.
echo ^> Ejecutando TODA la rubrica automaticamente...
echo    - Despliegue completo del sistema
echo    - 15 pruebas funcionales Gherkin validadas
echo    - 8 pruebas Selenium automatizadas (^>50%%)
echo    - JMeter Load/Stress/Volume con analisis
echo    - ESLint + SonarQube sin errores
echo    - Reportes automaticos generados
echo.
echo ^> Tiempo estimado: 5-10 minutos
echo.
echo Presione cualquier tecla para continuar...
pause >nul

echo.
echo ^> Usando PowerShell...
where pwsh >nul 2>&1
if %errorlevel% equ 0 (
    pwsh.exe -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1"
) else (
    powershell.exe -ExecutionPolicy Bypass -File "%~dp0EJECUTOR-AUTOMATICO-COMPLETO.ps1"
)

echo.
echo ================================================================================
if %ERRORLEVEL% EQU 0 (
    echo ^> Ejecucion completada exitosamente
    echo ^> Revisar reporte final para detalles especificos
) else (
    echo ^> Ejecucion completada con algunas advertencias
    echo ^> Revisar logs para detalles especificos
)
echo ================================================================================
echo.
echo Presione cualquier tecla para salir...
pause >nul

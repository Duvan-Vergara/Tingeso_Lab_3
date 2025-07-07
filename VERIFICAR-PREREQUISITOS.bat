@echo off
chcp 65001 >nul 2>&1
title VERIFICAR PREREQUISITOS - TINGESO LAB 3

echo.
echo ^> VERIFICANDO PREREQUISITOS...
echo.

where pwsh >nul 2>&1
if %errorlevel% equ 0 (
    pwsh.exe -ExecutionPolicy Bypass -File "%~dp0VERIFICAR-PREREQUISITOS.ps1"
) else (
    powershell.exe -ExecutionPolicy Bypass -File "%~dp0VERIFICAR-PREREQUISITOS.ps1"
)

echo.
echo ================================================================================
echo ^> Si todos los prerequisitos estan OK, puedes ejecutar:
echo    - EJECUTAR-AUTOMATICO-COMPLETO.bat
echo    - MENU-PRINCIPAL.bat
echo.
echo ^> Para mas informacion: PREREQUISITOS-SISTEMA.md
echo ================================================================================
echo.
echo Presione cualquier tecla para salir...
pause >nul

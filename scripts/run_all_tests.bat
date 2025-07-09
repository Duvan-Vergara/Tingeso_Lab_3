@echo off
REM Ejecuta el script PowerShell para pruebas de rendimiento

REM Cambia a la carpeta actual del script
cd /d %~dp0


REM Ejecutar el script PowerShell con PowerShell 7 (pwsh) para soporte UTF-8 y acentos
pwsh -File "%~dp0run_all_tests.ps1"

pause

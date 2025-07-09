@echo off
REM Este archivo ejecuta el script Ejecutar-STRESS.ps1 con PowerShell
REM Asegúrate de tener permisos de ejecución para scripts de PowerShell

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "Ejecutar-STRESS.ps1"

pause

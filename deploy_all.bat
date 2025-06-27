@echo off
setlocal enabledelayedexpansion

REM Lanzador para PowerShell 7 del script moderno
title Despliegue Kubernetes (PowerShell 7)
pwsh -File "%~dp0deploy_all.ps1"

exit /b 0
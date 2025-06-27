@echo off
REM Lanzador para PowerShell 7 del script moderno
title Limpieza Kubernetes (PowerShell 7)
pwsh -File "%~dp0clean_k8s.ps1" %*
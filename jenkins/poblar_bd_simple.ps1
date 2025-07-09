#!/usr/bin/env powershell
# Script simple para poblar BD sin interferir con configuración del sistema

param(
    [string]$Count = "100",
    [string]$BaseUrl = "http://localhost:30088"
)

$reserveCount = [int]$Count

Write-Output "Iniciando poblamiento de BD con $reserveCount reservas..."

# Verificar sistema
try {
    $response = Invoke-RestMethod -Uri "$BaseUrl/api/reserves/" -Method Get -TimeoutSec 10
    Write-Output "Sistema disponible"
} catch {
    Write-Output "Error: Sistema no disponible en $BaseUrl"
    exit 1
}

# Obtener count inicial
try {
    $existing = (Invoke-RestMethod -Uri "$BaseUrl/api/reserves/" -Method Get).Count
    Write-Output "Reservas existentes: $existing"
} catch {
    $existing = 0
}

# Función para generar datos de reserva
function Generate-ReserveData {
    param([int]$Index)
    
    $date = (Get-Date).AddDays((Get-Random -Minimum -90 -Maximum 30))
    $hour = Get-Random -Minimum 8 -Maximum 22
    $minute = @(0, 15, 30, 45) | Get-Random
    $beginTime = "{0:D2}:{1:D2}" -f $hour, $minute
    
    $duration = @(15, 30, 45, 60, 90, 120) | Get-Random
    $endTime = $date.AddHours($hour).AddMinutes($minute + $duration)
    $finishTime = "{0:D2}:{1:D2}" -f $endTime.Hour, $endTime.Minute
    
    $names = @("Juan", "María", "Carlos", "Ana", "Luis", "Carmen", "Pedro", "Laura")
    $lastNames = @("García", "López", "Martínez", "González", "Rodríguez", "Fernández")
    
    $firstName = $names | Get-Random
    $lastName = $lastNames | Get-Random
    $rut = "{0:D2}{1:D6}-{2}" -f (Get-Random -Minimum 10 -Maximum 99), (Get-Random -Minimum 100000 -Maximum 999999), (Get-Random -Minimum 0 -Maximum 9)
    
    $tariffId = Get-Random -Minimum 1 -Maximum 4
    $prices = @{1 = 15000; 2 = 25000; 3 = 35000}
    $finalPrice = $prices[$tariffId] + (Get-Random -Minimum -2000 -Maximum 5000)
    
    return @{
        "reserveDay" = $date.ToString("yyyy-MM-dd")
        "beginTime" = $beginTime
        "finishTime" = $finishTime
        "clientRut" = $rut
        "clientName" = $firstName
        "clientLastName" = $lastName
        "tariffId" = $tariffId
        "finalPrice" = [Math]::Max($finalPrice, 10000)
    }
}

# Crear reservas
$success = 0
$errors = 0

for ($i = 1; $i -le $reserveCount; $i++) {
    try {
        $reserveData = Generate-ReserveData -Index $i
        $headers = @{
            "Content-Type" = "application/json"
            "Accept" = "application/json"
        }
        
        $jsonData = $reserveData | ConvertTo-Json -Depth 10
        $response = Invoke-RestMethod -Uri "$BaseUrl/api/reserves/" -Method Post -Body $jsonData -Headers $headers -TimeoutSec 30
        $success++
        
        if ($i % 50 -eq 0) {
            Write-Output "Progreso: $i/$reserveCount reservas creadas"
        }
    }
    catch {
        $errors++
        if ($errors -le 3) {
            Write-Output "Error en reserva $i : $($_.Exception.Message)"
        }
    }
    
    # Pausa pequeña para no sobrecargar
    if ($i % 10 -eq 0) {
        Start-Sleep -Milliseconds 100
    }
}

# Verificar resultado final
try {
    $final = (Invoke-RestMethod -Uri "$BaseUrl/api/reserves/" -Method Get).Count
    Write-Output "Resultado:"
    Write-Output "  Reservas creadas exitosamente: $success"
    Write-Output "  Errores: $errors"
    Write-Output "  Total en BD: $final (antes: $existing)"
    Write-Output "  Incremento: $($final - $existing)"
} catch {
    Write-Output "No se pudo verificar el resultado final"
}

Write-Output "Poblamiento completado"

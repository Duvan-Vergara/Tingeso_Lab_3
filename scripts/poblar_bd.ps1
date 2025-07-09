# Script: poblar_bd.ps1
# Población masiva de usuarios y reservas para pruebas de volumen
# Crea N usuarios únicos y M reservas por usuario, distribuidas en fechas/horas válidas

param(
    [int]$numUsuarios = 1000,
    [int]$reservasPorUsuario = 10,
    [string]$apiBase = "http://localhost:30088/api"
)

function Crear-Usuario {
    param($username)
    $body = @{ username = $username; password = "test123" } | ConvertTo-Json
    try {
        $response = Invoke-RestMethod -Uri "$apiBase/reserves/users/" -Method Post -Body $body -ContentType 'application/json'
        return $response.id
    } catch {
        Write-Host "Usuario $username ya existe o error: $_"
        # Intentar obtener el ID si ya existe
        $user = Invoke-RestMethod -Uri "$apiBase/reserves/users/$username" -Method Get -ErrorAction SilentlyContinue
        return $user.id
    }
}

function Crear-Reserva {
    param($userId, $fecha, $horaInicio, $horaFin, $tariffId, $precio)
    $body = @{
        reserveday = $fecha
        begin = $horaInicio
        finish = $horaFin
        reservesUsers = @($userId)
        tariffId = $tariffId
        finalPrice = $precio
    } | ConvertTo-Json
    try {
        $response = Invoke-RestMethod -Uri "$apiBase/reserves/" -Method Post -Body $body -ContentType 'application/json'
        return $true
    } catch {
        Write-Host "Error creando reserva para usuario $userId: $_"
        return $false
    }
}

# Generar usuarios
$usuarios = @()
for ($i = 1; $i -le $numUsuarios; $i++) {
    $username = "user_$i"
    $userId = Crear-Usuario $username
    if ($userId) { $usuarios += $userId }
}

# Generar reservas
$tarifas = @(1,2,3)
$precios = @(25000, 30000, 35000, 40000, 45000, 50000)
$fechaBase = Get-Date
$reservasCreadas = 0
foreach ($userId in $usuarios) {
    for ($j = 0; $j -lt $reservasPorUsuario; $j++) {
        $fecha = $fechaBase.AddDays(($userId % 30) + $j).ToString('yyyy-MM-dd')
        $horaInicio = "0$((8 + $j) % 22):00"
        $horaFin = "0$((9 + $j) % 23):00"
        $tariffId = $tarifas[($userId + $j) % $tarifas.Count]
        $precio = $precios[($userId + $j) % $precios.Count]
        if (Crear-Reserva $userId $fecha $horaInicio $horaFin $tariffId $precio) {
            $reservasCreadas++
        }
    }
}
Write-Host "\nUsuarios creados: $($usuarios.Count)"
Write-Host "Reservas creadas: $reservasCreadas"
Write-Host "\n¡Población masiva completada!"
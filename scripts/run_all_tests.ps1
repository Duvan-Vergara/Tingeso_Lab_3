

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
# ===============================
# Script interactivo de pruebas de rendimiento para RF5, RF7 y RF8
# ===============================

function Mostrar-EstadoBD {
    Write-Host "\n--- Estado actual de la base de datos ---"
    try {
        $users = Invoke-RestMethod -Uri "http://localhost:30088/api/reserves/users/"
        Write-Host "Total de usuarios: $($users.Count)"
    } catch { Write-Host "No se pudo obtener el total de usuarios." }
    try {
        $json = Invoke-RestMethod -Uri "http://localhost:30088/api/reserves/"
        Write-Host "Total de reservas: $($json.totalElements)"
        Write-Host "Páginas totales: $($json.totalPages)"
        Write-Host "Elementos en esta página: $($json.numberOfElements)"
    } catch { Write-Host "No se pudo obtener el total de reservas." }
    Write-Host "-----------------------------------------\n"
}

# Crear carpeta de resultados si no existe
if (!(Test-Path ../results)) { New-Item -ItemType Directory -Path ../results }

# Menú interactivo
Write-Host "==============================="
Write-Host " PRUEBAS DE RENDIMIENTO TINGESO"
Write-Host "==============================="
Mostrar-EstadoBD

# Elegir tipo de prueba
$tipoPrueba = Read-Host "¿Qué tipo de prueba deseas ejecutar? (1=LOAD, 2=STRESS, 3=Ambas)"

# Parámetros personalizados
$usuarios = Read-Host "Usuarios para LOAD (default 100)"; if (-not $usuarios) { $usuarios = 100 }
$iteraciones = Read-Host "Iteraciones para LOAD (default 10)"; if (-not $iteraciones) { $iteraciones = 10 }
$ramp = Read-Host "Ramp time LOAD (default 30)"; if (-not $ramp) { $ramp = 30 }
$duracion = Read-Host "Duración LOAD (default 300)"; if (-not $duracion) { $duracion = 300 }

$usuarios_stress = Read-Host "Usuarios para STRESS (default 5000)"; if (-not $usuarios_stress) { $usuarios_stress = 5000 }
$iteraciones_stress = Read-Host "Iteraciones para STRESS (default 100)"; if (-not $iteraciones_stress) { $iteraciones_stress = 100 }
$ramp_stress = Read-Host "Ramp time STRESS (default 120)"; if (-not $ramp_stress) { $ramp_stress = 120 }
$duracion_stress = Read-Host "Duración STRESS (default 3600)"; if (-not $duracion_stress) { $duracion_stress = 3600 }

# Elegir orden de ejecución
Write-Host "\n¿En qué orden deseas ejecutar las pruebas?"
Write-Host "1. RF7 y RF8 primero, luego RF5 (recomendado)"
Write-Host "2. RF5 primero, luego RF7 y RF8"
$orden = Read-Host "Selecciona opción (1 o 2)"

function Ejecutar-LOAD {
    param($usuarios, $iteraciones, $ramp, $duracion, $orden)
    $scriptDir = $PSScriptRoot
    if (-not $scriptDir) {
        if ($MyInvocation.MyCommand.Path) {
            $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
        } else {
            $scriptDir = Get-Location
        }
    }
    $jmeterDir = Join-Path $scriptDir "..\jmeter"
    $resultsDir = Join-Path $scriptDir "..\results"
    $rf7jmx = Join-Path $jmeterDir "RF7-LOAD.jmx"
    $rf8jmx = Join-Path $jmeterDir "RF8-LOAD.jmx"
    $rf5jmx = Join-Path $jmeterDir "RF5-LOAD.jmx"
    $rf7res = Join-Path $resultsDir "rf7-load.jtl"
    $rf8res = Join-Path $resultsDir "rf8-load.jtl"
    $rf5res = Join-Path $resultsDir "rf5-load.jtl"
    $args_rf7 = @( '-n', '-t', $rf7jmx, "-JUSERS=$usuarios", "-JLOOPS=$iteraciones", "-JRAMP_TIME=$ramp", "-JDURATION=$duracion", '-l', $rf7res )
    $args_rf8 = @( '-n', '-t', $rf8jmx, "-JUSERS=$usuarios", "-JLOOPS=$iteraciones", "-JRAMP_TIME=$ramp", "-JDURATION=$duracion", '-l', $rf8res )
    $args_rf5 = @( '-n', '-t', $rf5jmx, "-JUSERS=$usuarios", "-JLOOPS=$iteraciones", "-JRAMP_TIME=$ramp", "-JDURATION=$duracion", '-l', $rf5res )
    Write-Host "\n[DEBUG] Variables para LOAD:"
    Write-Host "USERS=$usuarios, LOOPS=$iteraciones, RAMP_TIME=$ramp, DURATION=$duracion"
    if ($orden -eq 1) {
        Write-Host "Ejecutando LOAD TEST para RF8..."
        Write-Host "[DEBUG] Comando: jmeter $($args_rf8 -join ' ')"
        & jmeter @args_rf8
        Write-Host "Ejecutando LOAD TEST para RF7..."
        Write-Host "[DEBUG] Comando: jmeter $($args_rf7 -join ' ')"
        & jmeter @args_rf7
        Write-Host "Ejecutando LOAD TEST para RF5..."
        Write-Host "[DEBUG] Comando: jmeter $($args_rf5 -join ' ')"
        & jmeter @args_rf5
    } else {
        Write-Host "Ejecutando LOAD TEST para RF5..."
        Write-Host "[DEBUG] Comando: jmeter $($args_rf5 -join ' ')"
        & jmeter @args_rf5
        Write-Host "Ejecutando LOAD TEST para RF7..."
        Write-Host "[DEBUG] Comando: jmeter $($args_rf7 -join ' ')"
        & jmeter @args_rf7
        Write-Host "Ejecutando LOAD TEST para RF8..."
        Write-Host "[DEBUG] Comando: jmeter $($args_rf8 -join ' ')"
        & jmeter @args_rf8
    }
}

function Ejecutar-STRESS {
    param($usuarios, $iteraciones, $ramp, $duracion, $orden)
    $usuariosStep = 5000  # Paso grande de usuarios
    $loopsStep = 500      # Paso de loops
    $rampStep = 60        # Paso de ramp time (en segundos)
    $duracionStep = 600   # Paso de duración (en segundos)
    $umbral1 = 10
    $umbral2 = 20
    $umbral3 = 50
    $umbral4 = 80
    $usuariosFijo = 1000
    $iteracionesFijo = 100
    $rampFijo = 120
    $duracionFijo = 3600
    $scriptDir = $PSScriptRoot
    if (-not $scriptDir) {
        if ($MyInvocation.MyCommand.Path) {
            $scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
        } else {
            $scriptDir = Get-Location
        }
    }
    $jmeterDir = Join-Path $scriptDir "..\jmeter"
    $resultsDir = Join-Path $scriptDir "..\results"
    $servicios = @(
        @{ nombre = 'RF8'; jmx = Join-Path $jmeterDir 'RF8-STRESS.jmx'; jtl = Join-Path $resultsDir 'rf8-stress.jtl'; minUsuarios = $usuariosFijo; minIteraciones = $iteracionesFijo; minRamp = $rampFijo; minDuracion = $duracionFijo },
        @{ nombre = 'RF7'; jmx = Join-Path $jmeterDir 'RF7-STRESS.jmx'; jtl = Join-Path $resultsDir 'rf7-stress.jtl'; minUsuarios = $usuariosFijo; minIteraciones = $iteracionesFijo; minRamp = $rampFijo; minDuracion = $duracionFijo },
        @{ nombre = 'RF5'; jmx = Join-Path $jmeterDir 'RF5-STRESS.jmx'; jtl = Join-Path $resultsDir 'rf5-stress.jtl'; minUsuarios = $usuariosFijo; minIteraciones = $iteracionesFijo; minRamp = $rampFijo; minDuracion = $duracionFijo }
    )
    if ($orden -eq 1) {
        $servicios = $servicios | Sort-Object { if ($_.nombre -eq 'RF5') { 2 } elseif ($_.nombre -eq 'RF8') { 0 } else { 1 } }
    } else {
        $servicios = $servicios | Sort-Object { if ($_.nombre -eq 'RF5') { 0 } elseif ($_.nombre -eq 'RF8') { 1 } else { 2 } }
    }
    $resumen = @()
    $usuariosTest = $usuariosFijo
    $iteracionesTest = $iteracionesFijo
    $rampTest = $rampFijo
    $duracionTest = $duracionFijo
    $seguir = $true
    while ($seguir -and $usuariosTest -le $usuarios) {
        Write-Host "\n==============================="
        Write-Host "STRESS TEST: $usuariosTest usuarios, $iteracionesTest loops, $rampTest ramp, $duracionTest duración"
        Write-Host "==============================="
        $detener = $false
        foreach ($svc in $servicios) {
            $nombre = $svc.nombre
            $jmx = $svc.jmx
            $jtl = $svc.jtl
            $usuariosReal = $usuariosTest
            $iteracionesReal = $iteracionesTest
            Write-Host "Ejecutando STRESS TEST para $nombre con $usuariosReal usuarios, $iteracionesReal iteraciones, $rampTest ramp, $duracionTest duración..."
            jmeter -n -t $jmx -JUSERS=$usuariosReal -JLOOPS=$iteracionesReal -JRAMP_TIME=$rampTest -JDURATION=$duracionTest -l $jtl
            # Calcular error rate
            $total = 0; $errores = 0
            if (Test-Path $jtl) {
                $lines = Get-Content $jtl | Where-Object { $_ -match '^\d' }
                foreach ($line in $lines) {
                    $cols = $line -split ','
                    if ($cols.Length -ge 8) {
                        $total++
                        if ($cols[7] -ne 'true') { $errores++ }
                    }
                }
                if ($total -gt 0) {
                    $errorRate = [math]::Round(($errores / $total) * 100, 2)
                } else {
                    $errorRate = 0
                }
                $umbral = ''
                if ($errorRate -ge $umbral4) { $umbral = '!!! >80%'; $detener = $true }
                elseif ($errorRate -ge $umbral3) { $umbral = '>50%' }
                elseif ($errorRate -ge $umbral2) { $umbral = '>20%' }
                elseif ($errorRate -ge $umbral1) { $umbral = '>10%' }
                Write-Host ("{0,-10} Usuarios: {1,-6} Loops: {2,-6} ErrorRate: {3,5}% {4}" -f $nombre, $usuariosReal, $iteracionesReal, $errorRate, $umbral)
                $resumen += [PSCustomObject]@{ Servicio = $nombre; Usuarios = $usuariosReal; Loops = $iteracionesReal; ErrorRate = $errorRate; Umbral = $umbral }
                # Guardar resultado por escalón
                $csvfile = Join-Path $resultsDir ("${nombre}-stress-summary.csv")
                $linea = "$usuariosReal,$iteracionesReal,$errorRate,$umbral"
                if (!(Test-Path $csvfile)) { "Usuarios,Loops,ErrorRate,Umbral" | Out-File $csvfile }
                $linea | Add-Content $csvfile
                if ($errorRate -ge $umbral1) { $detener = $true }
            } else {
                Write-Host "No se encontró el archivo $jtl para $nombre"
            }
            if ($detener) {
                Write-Host "\nSe superó el 10% de error en $nombre. Deteniendo pruebas."
                $seguir = $false
                break
            }
        }
        if (-not $detener) {
            $usuariosTest += $usuariosStep
            $iteracionesTest += $loopsStep
            $rampTest += $rampStep
            $duracionTest += $duracionStep
        }
    }
    # Mostrar resumen final
    Write-Host "\nResumen de STRESS TEST:"
    $resumen | Format-Table -AutoSize
}

if ($tipoPrueba -eq 1) { Ejecutar-LOAD $usuarios $iteraciones $ramp $duracion $orden }
elseif ($tipoPrueba -eq 2) { Ejecutar-STRESS $usuarios_stress $iteraciones_stress $ramp_stress $duracion_stress $orden }
else {
    Ejecutar-LOAD $usuarios $iteraciones $ramp $duracion $orden
    Ejecutar-STRESS $usuarios_stress $iteraciones_stress $ramp_stress $duracion_stress $orden
}

Write-Host "\nExportando Aggregate Report a CSV (requiere plugin JMeterPluginsCMD)..."
# Ejemplo de exportación (ajusta si usas otro método)
# JMeterPluginsCMD.bat --generate-csv ../results/rf5-load-agg.csv --input-jtl ../results/rf5-load.jtl --plugin-type AggregateReport
# JMeterPluginsCMD.bat --generate-csv ../results/rf7-load-agg.csv --input-jtl ../results/rf7-load.jtl --plugin-type AggregateReport
# JMeterPluginsCMD.bat --generate-csv ../results/rf8-load-agg.csv --input-jtl ../results/rf8-load.jtl --plugin-type AggregateReport

Write-Host "\nListo. Ejecuta ahora el script Python para consolidar los resultados."

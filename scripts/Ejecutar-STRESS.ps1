# ===============================
# Ejecutar-STRESS.ps1
# Función avanzada para pruebas de stress con tracking de umbrales y exportación CSV
# ===============================
[CmdletBinding()]
param(
    [int]$usuarios = 5000,
    [int]$iteraciones = 100,
    [int]$ramp = 120,
    [int]$duracion = 3600,
    [int]$step = 1000,
    [string]$jmeterDir = "../jmeter",
    [string]$resultsDir = "../results",
    [switch]$DetenerEnUmbral
)

function Ejecutar-STRESS {
    param($usuarios, $iteraciones, $ramp, $duracion, $step, $jmeterDir, $resultsDir, $DetenerEnUmbral)
    $umbral1 = 10
    $umbral2 = 20
    $umbral3 = 50
    $umbral4 = 80
    $servicios = @(
        @{ nombre = 'RF8'; jmx = Join-Path $jmeterDir 'RF8-STRESS.jmx'; jtl = Join-Path $resultsDir 'rf8-stress.jtl' },
        @{ nombre = 'RF7'; jmx = Join-Path $jmeterDir 'RF7-STRESS.jmx'; jtl = Join-Path $resultsDir 'rf7-stress.jtl' },
        @{ nombre = 'RF5'; jmx = Join-Path $jmeterDir 'RF5-STRESS.jmx'; jtl = Join-Path $resultsDir 'rf5-stress.jtl' }
    )
    $resumen = @()
    # Valores fijos para stress, como los de la prueba manual
    $usuariosFijo = 1000
    $iteracionesFijo = 100
    $rampFijo = 120
    $duracionFijo = 3600
    for ($u = $step; $u -le $usuariosFijo; $u += $step) {
        Write-Host "\n==============================="
        Write-Host "STRESS TEST escalón: $u usuarios"
        Write-Host "==============================="
        $detener = $false
        foreach ($svc in $servicios) {
            $nombre = $svc.nombre
            $jmx = $svc.jmx
            $jtl = $svc.jtl
            Write-Host "Ejecutando STRESS TEST para $nombre con $u usuarios..."
            $args = @('-n', '-t', $jmx, "-JUSERS=$u", "-JLOOPS=$iteracionesFijo", "-JRAMP_TIME=$rampFijo", "-JDURATION=$duracionFijo", '-l', $jtl)
            & jmeter @args
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
                Write-Host ("{0,-10} Usuarios: {1,-6} ErrorRate: {2,5}% {3}" -f $nombre, $u, $errorRate, $umbral)
                $resumen += [PSCustomObject]@{ Servicio = $nombre; Usuarios = $u; ErrorRate = $errorRate; Umbral = $umbral }
                $csvfile = Join-Path $resultsDir ("${nombre}-stress-summary.csv")
                $linea = "$u,$errorRate,$umbral"
                if (!(Test-Path $csvfile)) { "Usuarios,ErrorRate,Umbral" | Out-File $csvfile }
                $linea | Add-Content $csvfile
            } else {
                Write-Host "No se encontró el archivo $jtl para $nombre"
            }
            if ($DetenerEnUmbral -and $detener) {
                Write-Host "\nSe superó el 80% de error en $nombre. Deteniendo pruebas."
                break
            }
        }
        if ($DetenerEnUmbral -and $detener) { break }
    }
    Write-Host "\nResumen de STRESS TEST:"
    $resumen | Format-Table -AutoSize
}

# Ejemplo de uso interactivo:
# Ejecutar-STRESS -usuarios 5000 -iteraciones 100 -ramp 120 -duracion 3600 -step 1000 -jmeterDir "../jmeter" -resultsDir "../results" -DetenerEnUmbral

# Si se ejecuta directamente el script, llama la función con los parámetros por defecto
if ($MyInvocation.InvocationName -eq '.') { return }
Ejecutar-STRESS -usuarios $usuarios -iteraciones $iteraciones -ramp $ramp -duracion $duracion -step $step -jmeterDir $jmeterDir -resultsDir $resultsDir -DetenerEnUmbral:$DetenerEnUmbral

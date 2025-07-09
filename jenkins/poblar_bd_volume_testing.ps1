#!/usr/bin/env powershell
<#
.SYNOPSIS
    Poblamiento masivo de BD para pruebas de volumen RF7 y RF8
.DESCRIPTION
    Crea diferentes cantidades de reservas para simular escenarios reales:
    - Escenario pequeño: 100 reservas (karting pequeño)
    - Escenario medio: 1,000 reservas (karting mediano)
    - Escenario grande: 10,000 reservas (karting grande/cadena)
    
    Esto permite hacer Volume Testing en RF7 (consultas) y RF8 (reportes)
    con bases de datos realísticamente pobladas.
#>

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("small", "medium", "large", "all")]
    [string]$Size = "medium",
    
    [Parameter(Mandatory=$false)]
    [string]$BaseUrl = "http://localhost:30088"
)

# Evitar Clear-Host que puede interferir con configuración del sistema
Write-Host "`n" -NoNewline
Write-Host "🏎️ POBLAMIENTO MASIVO DE BD PARA VOLUME TESTING" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan

# Configuración de escenarios
$scenarios = @{
    "small" = @{
        "name" = "Karting Pequeño"
        "reservas" = 100
        "description" = "Negocio familiar, 1-2 pistas"
    }
    "medium" = @{
        "name" = "Karting Mediano" 
        "reservas" = 1000
        "description" = "Negocio establecido, 3-5 pistas"
    }
    "large" = @{
        "name" = "Karting Grande/Cadena"
        "reservas" = 10000
        "description" = "Múltiples ubicaciones, operación 24/7"
    }
}

function Test-SystemAvailability {
    Write-Host "🔍 Verificando disponibilidad del sistema..." -ForegroundColor Yellow
    
    try {
        $response = Invoke-RestMethod -Uri "$BaseUrl/api/reserves/" -Method Get -TimeoutSec 10
        Write-Host "✅ Sistema disponible en $BaseUrl" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "❌ Sistema no disponible en $BaseUrl" -ForegroundColor Red
        Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "   Asegúrese de que el sistema esté desplegado en Kubernetes" -ForegroundColor Yellow
        return $false
    }
}

function Get-ExistingReservesCount {
    try {
        $reserves = Invoke-RestMethod -Uri "$BaseUrl/api/reserves/" -Method Get
        return $reserves.Count
    }
    catch {
        return 0
    }
}

function Generate-RealisticReserveData {
    param(
        [int]$Index,
        [int]$TotalCount
    )
    
    # Generar fecha realista (últimos 6 meses + próximos 3 meses)
    $baseDate = Get-Date
    $randomDays = Get-Random -Minimum -180 -Maximum 90
    $reserveDate = $baseDate.AddDays($randomDays)
    
    # Horarios realistas de karting (8:00 AM - 10:00 PM)
    $startHour = Get-Random -Minimum 8 -Maximum 22
    $startMinute = @(0, 15, 30, 45) | Get-Random
    $beginTime = "{0:D2}:{1:D2}" -f $startHour, $startMinute
    
    # Duración realista (15 min - 2 horas)
    $durationMinutes = @(15, 30, 45, 60, 90, 120) | Get-Random
    $endTime = $reserveDate.AddHours($startHour).AddMinutes($startMinute + $durationMinutes)
    $finishTime = "{0:D2}:{1:D2}" -f $endTime.Hour, $endTime.Minute
    
    # Datos de cliente realistas
    $firstNames = @("Juan", "María", "Carlos", "Ana", "Luis", "Carmen", "Pedro", "Laura", "José", "Sofía")
    $lastNames = @("García", "Rodríguez", "González", "Fernández", "López", "Martínez", "Sánchez", "Pérez", "Martín", "Gómez")
    
    $firstName = $firstNames | Get-Random
    $lastName = $lastNames | Get-Random
    $rut = "{0}{1:D6}-{2}" -f (Get-Random -Minimum 10 -Maximum 99), (Get-Random -Minimum 100000 -Maximum 999999), (Get-Random -Minimum 0 -Maximum 9)
    
    # Tarifas realistas (1-3 según configuración del sistema)
    $tariffId = Get-Random -Minimum 1 -Maximum 4
    
    # Precios realistas según tipo de tarifa
    $basePrices = @{1 = 15000; 2 = 25000; 3 = 35000}
    $finalPrice = $basePrices[$tariffId] + (Get-Random -Minimum -5000 -Maximum 10000)
    
    return @{
        "reserveDay" = $reserveDate.ToString("yyyy-MM-dd")
        "beginTime" = $beginTime
        "finishTime" = $finishTime
        "clientRut" = $rut
        "clientName" = $firstName
        "clientLastName" = $lastName
        "tariffId" = $tariffId
        "finalPrice" = [Math]::Max($finalPrice, 10000)  # Mínimo $10,000
    }
}

function Create-MassiveReserves {
    param(
        [int]$Count,
        [string]$ScenarioName
    )
    
    Write-Host "`n📝 Creando $Count reservas para escenario: $ScenarioName" -ForegroundColor Cyan
    
    $successCount = 0
    $errorCount = 0
    $batchSize = 50
    $totalBatches = [Math]::Ceiling($Count / $batchSize)
    
    for ($batch = 0; $batch -lt $totalBatches; $batch++) {
        $batchStart = $batch * $batchSize
        $batchEnd = [Math]::Min(($batch + 1) * $batchSize, $Count)
        $currentBatchSize = $batchEnd - $batchStart
        
        Write-Host "   Lote $($batch + 1)/$totalBatches - Creando reservas $($batchStart + 1) a $batchEnd..." -ForegroundColor Gray
        
        # Crear reservas en paralelo por lotes (más eficiente)
        $jobs = @()
        
        for ($i = $batchStart; $i -lt $batchEnd; $i++) {
            $reserveData = Generate-RealisticReserveData -Index $i -TotalCount $Count
            
            $job = Start-Job -ScriptBlock {
                param($Url, $Data)
                
                try {
                    $headers = @{
                        "Content-Type" = "application/json"
                        "Accept" = "application/json"
                    }
                    
                    $jsonData = $Data | ConvertTo-Json -Depth 10
                    $response = Invoke-RestMethod -Uri "$Url/api/reserves/" -Method Post -Body $jsonData -Headers $headers -TimeoutSec 30
                    return @{ Success = $true; Response = $response }
                }
                catch {
                    return @{ Success = $false; Error = $_.Exception.Message }
                }
            } -ArgumentList $BaseUrl, $reserveData
            
            $jobs += $job
        }
        
        # Esperar a que terminen todos los jobs del lote
        $completed = $jobs | Wait-Job
        
        # Procesar resultados
        foreach ($job in $completed) {
            $result = Receive-Job $job
            Remove-Job $job
            
            if ($result.Success) {
                $successCount++
            } else {
                $errorCount++
                if ($errorCount -le 5) {  # Solo mostrar primeros 5 errores
                    Write-Host "      ⚠️ Error: $($result.Error)" -ForegroundColor Yellow
                }
            }
        }
        
        # Mostrar progreso cada 5 lotes
        if (($batch + 1) % 5 -eq 0 -or ($batch + 1) -eq $totalBatches) {
            $progress = [Math]::Round((($batch + 1) / $totalBatches) * 100, 1)
            Write-Host "   Progreso: $progress% - Exitosas: $successCount, Errores: $errorCount" -ForegroundColor Green
        }
        
        # Pausa entre lotes para no sobrecargar el sistema
        if ($batch -lt $totalBatches - 1) {
            Start-Sleep -Milliseconds 500
        }
    }
    
    Write-Host "`n✅ Poblamiento completado para $ScenarioName" -ForegroundColor Green
    Write-Host "   • Reservas creadas exitosamente: $successCount" -ForegroundColor Green
    Write-Host "   • Errores: $errorCount" -ForegroundColor $(if ($errorCount -gt 0) { "Yellow" } else { "Green" })
    
    return @{
        Success = $successCount
        Errors = $errorCount
        Total = $Count
    }
}

function Show-VolumeTestingStrategy {
    Write-Host "`n📚 ESTRATEGIA DE VOLUME TESTING" -ForegroundColor Cyan
    Write-Host "=" * 50 -ForegroundColor Cyan
    
    Write-Host "`n🎯 Concepto:" -ForegroundColor Yellow
    Write-Host "   • RF7 y RF8 requieren BD poblada para Volume Testing"
    Write-Host "   • Volume = consultas/reportes sobre grandes cantidades de datos"
    Write-Host "   • Diferente a Load/Stress que prueban concurrencia"
    
    Write-Host "`n📊 Escenarios Realistas:" -ForegroundColor Yellow
    foreach ($key in $scenarios.Keys) {
        $scenario = $scenarios[$key]
        Write-Host "   • $($scenario.name): $($scenario.reservas) reservas"
        Write-Host "     $($scenario.description)" -ForegroundColor Gray
    }
    
    Write-Host "`n🔍 Pruebas a Realizar:" -ForegroundColor Yellow
    Write-Host "   • RF7: Consultas de rack semanal con BD poblada"
    Write-Host "   • RF8: Reportes de ingresos con diferentes volúmenes de datos"
    Write-Host "   • Medir: tiempo de respuesta, memoria, procesamiento"
    
    Write-Host "`n⚡ Después del poblamiento:" -ForegroundColor Yellow
    Write-Host "   1. Ejecutar: jenkins\ejecutar_pruebas_escalables.bat"
    Write-Host "   2. Seleccionar opción 4: Pruebas de Volumen"
    Write-Host "   3. Los tests consultarán la BD poblada"
}

# Función principal
function Main {
    if (-not (Test-SystemAvailability)) {
        Write-Host "`n❌ No se puede continuar sin el sistema disponible" -ForegroundColor Red
        Write-Host "   Ejecute: deploy_all.bat para desplegar el sistema" -ForegroundColor Yellow
        return
    }
    
    # Mostrar reservas existentes
    $existing = Get-ExistingReservesCount
    Write-Host "`n📊 Reservas existentes en BD: $existing" -ForegroundColor Yellow
    
    Show-VolumeTestingStrategy
    
    if ($Size -eq "all") {
        Write-Host "`n🚀 EJECUTANDO TODOS LOS ESCENARIOS" -ForegroundColor Cyan
        Write-Host "⚠️ Esto puede tomar 30-60 minutos" -ForegroundColor Yellow
        Write-Host "Ejecutando automáticamente..." -ForegroundColor Green
        
        $totalResults = @()
        
        foreach ($scenarioKey in @("small", "medium", "large")) {
            $scenario = $scenarios[$scenarioKey]
            $result = Create-MassiveReserves -Count $scenario.reservas -ScenarioName $scenario.name
            $totalResults += $result
            
            Write-Host "`n⏸️ Pausa de 30 segundos entre escenarios..." -ForegroundColor Gray
            Start-Sleep -Seconds 30
        }
        
        # Resumen final
        $totalSuccess = ($totalResults | Measure-Object -Property Success -Sum).Sum
        $totalErrors = ($totalResults | Measure-Object -Property Errors -Sum).Sum
        
        Write-Host "`n🎉 TODOS LOS ESCENARIOS COMPLETADOS" -ForegroundColor Green
        Write-Host "   Total reservas creadas: $totalSuccess" -ForegroundColor Green
        Write-Host "   Total errores: $totalErrors" -ForegroundColor $(if ($totalErrors -gt 0) { "Yellow" } else { "Green" })
    } else {
        $scenario = $scenarios[$Size]
        Write-Host "`n🚀 EJECUTANDO ESCENARIO: $($scenario.name)" -ForegroundColor Cyan
        Write-Host "   Reservas a crear: $($scenario.reservas)" -ForegroundColor Yellow
        Write-Host "   Descripción: $($scenario.description)" -ForegroundColor Gray
        
        Write-Host "`nEjecutando automáticamente..." -ForegroundColor Green
        $result = Create-MassiveReserves -Count $scenario.reservas -ScenarioName $scenario.name
    }
    
    # Verificar total final
    $finalCount = Get-ExistingReservesCount
    Write-Host "`n📈 RESULTADO FINAL:" -ForegroundColor Cyan
    Write-Host "   Reservas en BD: $finalCount (antes: $existing)" -ForegroundColor Green
    Write-Host "   Incremento: $($finalCount - $existing)" -ForegroundColor Green
    
    Write-Host "`n🎯 PRÓXIMOS PASOS:" -ForegroundColor Cyan
    Write-Host "   1. Ejecutar: jenkins\ejecutar_pruebas_escalables.bat" -ForegroundColor Yellow
    Write-Host "   2. Seleccionar opción 4: Pruebas de Volumen" -ForegroundColor Yellow
    Write-Host "   3. RF7 y RF8 harán consultas sobre esta BD poblada" -ForegroundColor Yellow
    Write-Host "   4. Analizar tiempos de respuesta vs volumen de datos" -ForegroundColor Yellow
}

# Ejecutar función principal
Main

Write-Host "`n✅ Script completado exitosamente" -ForegroundColor Green

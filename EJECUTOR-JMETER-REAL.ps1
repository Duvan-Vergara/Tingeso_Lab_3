# ============================================================================================================
# EXECUTOR DE PRUEBAS JMETER REALES
# ============================================================================================================
param(
    [string]$TestType = "ALL",  # ALL, LOAD, STRESS, VOLUME
    [string]$ServerUrl = "localhost",
    [string]$ServerPort = "30088",
    [string]$Protocol = "http",
    [string]$OutputDir = "jmeter-results"
)

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

if (!(Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force
}

Write-Host "📊 Ejecutando pruebas JMeter:"
Write-Host "   Servidor: $Protocol://$ServerUrl:$ServerPort"
Write-Host "   Tipo: $TestType"
Write-Host "   Resultados: $OutputDir"

$testFiles = @()
switch ($TestType.ToUpper()) {
    "LOAD" { $testFiles = @("Karting-Load-Testing.jmx") }
    "STRESS" { $testFiles = @("Karting-Stress-Testing.jmx") }
    "VOLUME" { $testFiles = @("Karting-Volume-Testing.jmx") }
    "ALL" { $testFiles = @("Karting-Load-Testing.jmx", "Karting-Stress-Testing.jmx", "Karting-Volume-Testing.jmx") }
    default { 
        Write-Host "❌ Tipo de test inválido: $TestType" -ForegroundColor Red
        exit 1
    }
}

$results = @()

foreach ($testFile in $testFiles) {
    if (!(Test-Path $testFile)) {
        Write-Host "❌ Archivo no encontrado: $testFile" -ForegroundColor Red
        continue
    }
    
    $testName = [System.IO.Path]::GetFileNameWithoutExtension($testFile)
    $resultFile = "$OutputDir\$testName-$timestamp.jtl"
    $reportDir = "$OutputDir\$testName-Report-$timestamp"
    
    Write-Host "`n🔄 Ejecutando: $testFile"
    Write-Host "   Resultado: $resultFile"
    Write-Host "   Reporte HTML: $reportDir"
    
    try {
        $startTime = Get-Date
        
        # Ejecutar JMeter con parámetros del servidor
        $jmeterArgs = @(
            "-n"
            "-t", $testFile
            "-l", $resultFile
            "-e"
            "-o", $reportDir
            "-JSERVER_URL=$ServerUrl"
            "-JSERVER_PORT=$ServerPort"
            "-JPROTOCOL=$Protocol"
        )
        
        $process = Start-Process -FilePath "jmeter" -ArgumentList $jmeterArgs -Wait -PassThru -NoNewWindow
        
        $duration = (Get-Date) - $startTime
        
        if ($process.ExitCode -eq 0) {
            Write-Host "✅ $testName completado en $($duration.TotalMinutes.ToString('F1')) min" -ForegroundColor Green
            
            # Analizar resultados básicos
            if (Test-Path $resultFile) {
                $csvResults = Import-Csv $resultFile -Delimiter "`t"
                $successRate = ($csvResults | Where-Object { $_.success -eq "true" }).Count / $csvResults.Count * 100
                $avgResponseTime = ($csvResults | Measure-Object elapsed -Average).Average
                
                $results += @{
                    test = $testName
                    status = "PASSED"
                    duration_minutes = [math]::Round($duration.TotalMinutes, 2)
                    success_rate = [math]::Round($successRate, 2)
                    avg_response_time = [math]::Round($avgResponseTime, 0)
                    result_file = $resultFile
                    html_report = $reportDir
                    timestamp = $startTime.ToString("yyyy-MM-dd HH:mm:ss")
                }
                
                Write-Host "   Tasa éxito: $($successRate.ToString('F1'))%" -ForegroundColor Cyan
                Write-Host "   Tiempo promedio: $($avgResponseTime.ToString('F0'))ms" -ForegroundColor Cyan
            }
        } else {
            Write-Host "❌ $testName falló (código: $($process.ExitCode))" -ForegroundColor Red
            $results += @{
                test = $testName
                status = "FAILED"
                error_code = $process.ExitCode
                duration_minutes = [math]::Round($duration.TotalMinutes, 2)
                timestamp = $startTime.ToString("yyyy-MM-dd HH:mm:ss")
            }
        }
    } catch {
        Write-Host "❌ Error ejecutando $testName: $($_.Exception.Message)" -ForegroundColor Red
        $results += @{
            test = $testName
            status = "ERROR"
            error = $_.Exception.Message
            timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        }
    }
    
    # Pausa entre tests
    if ($testFile -ne $testFiles[-1] -and $testFiles.Count -gt 1) {
        Write-Host "⏸️ Pausa de 30s entre pruebas..."
        Start-Sleep 30
    }
}

# Guardar resumen
$summary = @{
    execution_timestamp = $timestamp
    test_type = $TestType
    server = "$Protocol://$ServerUrl:$ServerPort"
    total_tests = $results.Count
    passed = ($results | Where-Object { $_.status -eq "PASSED" }).Count
    failed = ($results | Where-Object { $_.status -ne "PASSED" }).Count
    results = $results
}

$summaryFile = "$OutputDir\jmeter-summary-$timestamp.json"
$summary | ConvertTo-Json -Depth 3 | Out-File $summaryFile -Encoding UTF8

Write-Host "`n📊 RESUMEN JMETER:"
Write-Host "Total: $($summary.total_tests)"
Write-Host "Passed: $($summary.passed)" -ForegroundColor Green
Write-Host "Failed: $($summary.failed)" -ForegroundColor Red
Write-Host "Resumen: $summaryFile"

return $summary.failed -eq 0

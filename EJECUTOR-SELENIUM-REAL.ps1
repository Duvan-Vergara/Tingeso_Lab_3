# ============================================================================================================
# EXECUTOR DE PRUEBAS SELENIUM REALES
# ============================================================================================================
param(
    [string]$BaseUrl = "http://localhost:30080",
    [string]$OutputDir = "selenium-results",
    [int]$TimeoutSec = 300
)

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$resultFile = "$OutputDir\selenium-execution-$timestamp.json"

if (!(Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force
}

Write-Host "🧪 Ejecutando pruebas Selenium contra: $BaseUrl"
Write-Host "📁 Resultados en: $resultFile"

$seleniumFiles = Get-ChildItem "selenium-tests\*.side" -ErrorAction SilentlyContinue

if (!$seleniumFiles) {
    Write-Host "❌ No se encontraron archivos .side" -ForegroundColor Red
    exit 1
}

$results = @()

foreach ($file in $seleniumFiles) {
    Write-Host "`n🔍 Ejecutando: $($file.Name)"
    
    try {
        # Ejecutar con selenium-side-runner
        $output = selenium-side-runner --base-url $BaseUrl --output-directory $OutputDir --format=json $file.FullName 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ $($file.Name) - PASSED" -ForegroundColor Green
            $results += @{
                file = $file.Name
                status = "PASSED"
                timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
                base_url = $BaseUrl
            }
        } else {
            Write-Host "❌ $($file.Name) - FAILED" -ForegroundColor Red
            $results += @{
                file = $file.Name
                status = "FAILED"
                error = $output
                timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
                base_url = $BaseUrl
            }
        }
    } catch {
        Write-Host "❌ Error ejecutando $($file.Name): $($_.Exception.Message)" -ForegroundColor Red
        $results += @{
            file = $file.Name
            status = "ERROR"
            error = $_.Exception.Message
            timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
            base_url = $BaseUrl
        }
    }
}

# Guardar resultados
$finalResults = @{
    execution_timestamp = $timestamp
    base_url = $BaseUrl
    total_files = $seleniumFiles.Count
    passed = ($results | Where-Object { $_.status -eq "PASSED" }).Count
    failed = ($results | Where-Object { $_.status -ne "PASSED" }).Count
    results = $results
}

$finalResults | ConvertTo-Json -Depth 3 | Out-File $resultFile -Encoding UTF8

Write-Host "`n📊 RESUMEN:"
Write-Host "Total: $($finalResults.total_files)"
Write-Host "Passed: $($finalResults.passed)" -ForegroundColor Green
Write-Host "Failed: $($finalResults.failed)" -ForegroundColor Red
Write-Host "Reporte: $resultFile"

return $finalResults.failed -eq 0

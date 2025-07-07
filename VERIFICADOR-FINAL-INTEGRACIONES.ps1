# 🔧 VERIFICADOR FINAL DE INTEGRACIONES
# Script para validar que todas las configuraciones están funcionando correctamente

param(
    [string]$NgrokUrl = "",
    [switch]$SkipSonarQube = $false,
    [switch]$SkipJenkins = $false
)

$ErrorActionPreference = "Continue"

Write-Host '🔧 VERIFICADOR FINAL DE INTEGRACIONES TINGESO LAB 3' -ForegroundColor Green
Write-Host '=================================================' -ForegroundColor Green
Write-Host

# Función para verificar puertos
function Test-Port {
    param($hostname, $port)
    try {
        $connection = New-Object System.Net.Sockets.TcpClient($hostname, $port)
        $connection.Close()
        return $true
    }
    catch {
        return $false
    }
}

# Función para verificar URL con timeout
function Test-Url {
    param($url, $timeout = 10)
    try {
        $response = Invoke-WebRequest -Uri $url -Method GET -TimeoutSec $timeout -UseBasicParsing
        return $response.StatusCode -eq 200
    }
    catch {
        return $false
    }
}

Write-Host '✅ VERIFICANDO SERVICIOS CORE' -ForegroundColor Cyan
Write-Host '================================' -ForegroundColor Cyan

# Verificar Docker
Write-Host '🐋 Docker:' -NoNewline
if (Get-Command docker -ErrorAction SilentlyContinue) {
    try {
        $dockerVersion = docker --version
        Write-Host ' ✅ Funcionando' -ForegroundColor Green
        Write-Host "   $dockerVersion" -ForegroundColor Gray
    }
    catch {
        Write-Host ' ❌ Error ejecutando Docker' -ForegroundColor Red
    }
}
else {
    Write-Host ' ❌ No instalado' -ForegroundColor Red
}

# Verificar kubectl
Write-Host '☸️  Kubernetes:' -NoNewline
if (Get-Command kubectl -ErrorAction SilentlyContinue) {
    try {
        $k8sStatus = kubectl cluster-info --request-timeout=5s 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-Host ' ✅ Cluster activo' -ForegroundColor Green
        }
        else {
            Write-Host ' ⚠️  Cluster no accesible' -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host ' ❌ Error de conexión' -ForegroundColor Red
    }
}
else {
    Write-Host ' ❌ kubectl no instalado' -ForegroundColor Red
}

Write-Host

Write-Host '🔍 VERIFICANDO JENKINS' -ForegroundColor Cyan
Write-Host '======================' -ForegroundColor Cyan

if (-not $SkipJenkins) {
    # Verificar Jenkins en Docker
    Write-Host '📦 Jenkins Docker:' -NoNewline
    try {
        $jenkinsContainer = docker ps --filter "name=jenkins" --format "{{.Names}}"
        if ($jenkinsContainer) {
            Write-Host ' ✅ Container activo' -ForegroundColor Green
            Write-Host "   Container: $jenkinsContainer" -ForegroundColor Gray
        }
        else {
            Write-Host ' ❌ Container no encontrado' -ForegroundColor Red
        }
    }
    catch {
        Write-Host ' ❌ Error verificando Docker' -ForegroundColor Red
    }

    # Verificar puerto Jenkins
    Write-Host '🌐 Jenkins Web:' -NoNewline
    if (Test-Port "localhost" 8080) {
        Write-Host ' ✅ Puerto 8080 accesible' -ForegroundColor Green
        Write-Host '   URL: http://localhost:8080' -ForegroundColor Gray
    }
    else {
        Write-Host ' ❌ Puerto 8080 no accesible' -ForegroundColor Red
    }

    # Verificar JDK en Jenkins
    Write-Host '☕ JDK en Jenkins:' -NoNewline
    try {
        $javaCheck = docker exec jenkins-tingeso java -version 2>&1
        if ($javaCheck -like "*openjdk*21*" -or $javaCheck -like "*OpenJDK*21*") {
            Write-Host ' ✅ OpenJDK 21 instalado' -ForegroundColor Green
            Write-Host "   $(($javaCheck -split "`n")[0].Trim())" -ForegroundColor Gray
        }
        else {
            Write-Host ' ⚠️  JDK no detectado o versión incorrecta' -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host ' ❌ Error verificando JDK' -ForegroundColor Red
    }
}
else {
    Write-Host '⏭️  Verificación Jenkins omitida por parámetro' -ForegroundColor Yellow
}

Write-Host

Write-Host '📊 VERIFICANDO SONARQUBE' -ForegroundColor Cyan
Write-Host '=========================' -ForegroundColor Cyan

if (-not $SkipSonarQube) {
    # Verificar SonarQube Docker
    Write-Host '📦 SonarQube Docker:' -NoNewline
    try {
        $sonarContainer = docker ps --filter "name=sonarqube" --format "{{.Names}}"
        if ($sonarContainer) {
            Write-Host ' ✅ Container activo' -ForegroundColor Green
            Write-Host "   Container: $sonarContainer" -ForegroundColor Gray
        }
        else {
            Write-Host ' ❌ Container no encontrado' -ForegroundColor Red
        }
    }
    catch {
        Write-Host ' ❌ Error verificando Docker' -ForegroundColor Red
    }

    # Verificar puerto SonarQube local
    Write-Host '🌐 SonarQube Local:' -NoNewline
    if (Test-Port "localhost" 9000) {
        Write-Host ' ✅ Puerto 9000 accesible' -ForegroundColor Green
        Write-Host '   URL: http://localhost:9000' -ForegroundColor Gray
    }
    else {
        Write-Host ' ❌ Puerto 9000 no accesible' -ForegroundColor Red
    }

    # Verificar ngrok si se proporciona URL
    if ($NgrokUrl -ne "") {
        Write-Host '🌍 ngrok SonarQube:' -NoNewline
        if (Test-Url $NgrokUrl) {
            Write-Host ' ✅ URL ngrok accesible' -ForegroundColor Green
            Write-Host "   URL: $NgrokUrl" -ForegroundColor Gray
        }
        else {
            Write-Host ' ❌ URL ngrok no accesible' -ForegroundColor Red
        }
    }
    else {
        Write-Host '🌍 ngrok URL: ⚠️  No proporcionada para verificar' -ForegroundColor Yellow
    }

    # Verificar ngrok proceso
    Write-Host '🔗 Proceso ngrok:' -NoNewline
    $ngrokProcess = Get-Process -Name "ngrok" -ErrorAction SilentlyContinue
    if ($ngrokProcess) {
        Write-Host ' ✅ Proceso activo' -ForegroundColor Green
    }
    else {
        Write-Host ' ❌ Proceso no encontrado' -ForegroundColor Red
    }
}
else {
    Write-Host '⏭️  Verificación SonarQube omitida por parámetro' -ForegroundColor Yellow
}

Write-Host

Write-Host '📁 VERIFICANDO ARCHIVOS GITHUB' -ForegroundColor Cyan
Write-Host '===============================' -ForegroundColor Cyan

# Verificar workflow GitHub Actions
$workflowFile = ".github\workflows\build.yml"
Write-Host '🔄 GitHub Actions:' -NoNewline
if (Test-Path $workflowFile) {
    Write-Host ' ✅ Workflow configurado' -ForegroundColor Green
    Write-Host "   Archivo: $workflowFile" -ForegroundColor Gray
}
else {
    Write-Host ' ❌ Workflow no encontrado' -ForegroundColor Red
}

# Verificar Jenkinsfile
$jenkinsFile = "jenkins\Jenkinsfile"
Write-Host '⚙️  Jenkins Pipeline:' -NoNewline
if (Test-Path $jenkinsFile) {
    Write-Host ' ✅ Jenkinsfile disponible' -ForegroundColor Green
    Write-Host "   Archivo: $jenkinsFile" -ForegroundColor Gray
}
else {
    Write-Host ' ❌ Jenkinsfile no encontrado' -ForegroundColor Red
}

Write-Host

Write-Host '🧪 VERIFICANDO HERRAMIENTAS DE PRUEBAS' -ForegroundColor Cyan
Write-Host '=======================================' -ForegroundColor Cyan

# Verificar JMeter
Write-Host '📈 JMeter:' -NoNewline
$jmeterTests = @("Karting-Load-Testing.jmx", "Karting-Stress-Testing.jmx", "Karting-Volume-Testing.jmx")
$jmeterFound = 0
foreach ($test in $jmeterTests) {
    if (Test-Path $test) { $jmeterFound++ }
}
if ($jmeterFound -eq 3) {
    Write-Host ' ✅ Todos los planes de prueba disponibles' -ForegroundColor Green
}
else {
    Write-Host " ⚠️  $jmeterFound/3 planes encontrados" -ForegroundColor Yellow
}

# Verificar Selenium
Write-Host '🤖 Selenium:' -NoNewline
if (Test-Path "selenium-tests") {
    $seleniumFiles = Get-ChildItem "selenium-tests" -Filter "*.side" | Measure-Object
    if ($seleniumFiles.Count -gt 0) {
        Write-Host " ✅ $($seleniumFiles.Count) pruebas Selenium encontradas" -ForegroundColor Green
    }
    else {
        Write-Host ' ⚠️  Directorio existe pero sin pruebas .side' -ForegroundColor Yellow
    }
}
else {
    Write-Host ' ❌ Directorio selenium-tests no encontrado' -ForegroundColor Red
}

Write-Host

Write-Host '📋 RESUMEN FINAL' -ForegroundColor Green
Write-Host '================' -ForegroundColor Green

# Verificar scripts principales
$mainScripts = @(
    "EJECUTOR-PRUEBAS-REALES.ps1",
    "EJECUTOR-JENKINS-AUTOMATIZADO.ps1",
    "CONFIGURADOR-JENKINS-COMPLETO.ps1",
    "SONARQUBE-GITHUB-VALIDADO.md"
)

$scriptsOK = 0
foreach ($script in $mainScripts) {
    if (Test-Path $script) { $scriptsOK++ }
}

Write-Host "✅ Scripts principales: $scriptsOK/$($mainScripts.Count)" -ForegroundColor Green
Write-Host "✅ Integración Jenkins: $(if (-not $SkipJenkins -and (Test-Port 'localhost' 8080)) { 'OK' } else { 'Revisar' })" -ForegroundColor $(if (-not $SkipJenkins -and (Test-Port 'localhost' 8080)) { 'Green' } else { 'Yellow' })
Write-Host "✅ Integración SonarQube: $(if (-not $SkipSonarQube -and (Test-Port 'localhost' 9000)) { 'OK' } else { 'Revisar' })" -ForegroundColor $(if (-not $SkipSonarQube -and (Test-Port 'localhost' 9000)) { 'Green' } else { 'Yellow' })
Write-Host "✅ GitHub Actions: $(if (Test-Path '.github\workflows\build.yml') { 'Configurado' } else { 'Falta configurar' })" -ForegroundColor $(if (Test-Path '.github\workflows\build.yml') { 'Green' } else { 'Red' })

Write-Host

if ($NgrokUrl -eq "") {
    Write-Host '💡 PARA VERIFICAR NGROK COMPLETAMENTE:' -ForegroundColor Cyan
    Write-Host '.\VERIFICADOR-FINAL-INTEGRACIONES.ps1 -NgrokUrl "https://tu-url-ngrok.app"' -ForegroundColor White
}

Write-Host
Write-Host '🏁 VERIFICACIÓN COMPLETADA' -ForegroundColor Green
Write-Host 'Si todos los elementos están ✅, el sistema está listo para evaluación' -ForegroundColor Gray
Write-Host

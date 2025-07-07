# Script para actualizar configuraciones de SonarQube en todos los microservicios
# Ejecutar desde la raíz del proyecto

$services = @(
    "config-service",
    "eureka-service", 
    "gateway-service",
    "discount-people-service",
    "discount-frequent-service", 
    "special-rates-service",
    "reserve-service",
    "rack-service",
    "reports-service"
)

Write-Host "Actualizando configuraciones de SonarQube para todos los microservicios..." -ForegroundColor Green

foreach ($service in $services) {
    $servicePath = "backend\$service"
    $pomPath = "$servicePath\pom.xml"
    $sonarPath = "$servicePath\sonar-project.properties"
    
    Write-Host "Procesando $service..." -ForegroundColor Yellow
    
    # Crear archivo sonar-project.properties si no existe
    if (-not (Test-Path $sonarPath)) {
        $sonarContent = @"
# Configuración SonarQube para $service
sonar.projectKey=tingeso_$service
sonar.projectName=$service - Sistema Karting
sonar.projectVersion=1.0
sonar.organization=karting-system

# Configuración de fuentes
sonar.sources=src/main/java
sonar.tests=src/test/java
sonar.java.binaries=target/classes
sonar.java.test.binaries=target/test-classes

# Exclusiones
sonar.exclusions=**/target/**,**/*.jar,**/Dockerfile,**/*.xml,**/*.yml,**/*.yaml
sonar.test.exclusions=**/*Test.java,**/*Tests.java

# Configuración de cobertura de código
sonar.java.coveragePlugin=jacoco
sonar.coverage.jacoco.xmlReportPaths=target/site/jacoco/jacoco.xml
sonar.junit.reportPaths=target/surefire-reports

# Configuración de análisis
sonar.sourceEncoding=UTF-8
sonar.java.source=17
sonar.java.target=17

# Configuración de calidad
sonar.qualitygate.wait=true
"@
        Set-Content -Path $sonarPath -Value $sonarContent -Encoding UTF8
        Write-Host "  ✓ Creado sonar-project.properties" -ForegroundColor Green
    }
    
    # Actualizar pom.xml para incluir plugins de JaCoCo y SonarQube
    if (Test-Path $pomPath) {
        $pomContent = Get-Content $pomPath -Raw
        
        # Verificar si JaCoCo ya está configurado
        if ($pomContent -notmatch "jacoco-maven-plugin") {
            Write-Host "  ⚠ Necesita actualizar pom.xml manualmente para incluir JaCoCo" -ForegroundColor Red
            Write-Host "    Archivo: $pomPath" -ForegroundColor Red
        } else {
            Write-Host "  ✓ JaCoCo ya configurado" -ForegroundColor Green
        }
    }
}

Write-Host "`nPróximos pasos:" -ForegroundColor Cyan
Write-Host "1. Actualizar manualmente los archivos pom.xml que necesiten JaCoCo" -ForegroundColor White
Write-Host "2. Configurar secretos SONAR_TOKEN y SONAR_HOST_URL en GitHub" -ForegroundColor White
Write-Host "3. Ejecutar el workflow de GitHub Actions" -ForegroundColor White
Write-Host "`nConfiguraciones completadas!" -ForegroundColor Green

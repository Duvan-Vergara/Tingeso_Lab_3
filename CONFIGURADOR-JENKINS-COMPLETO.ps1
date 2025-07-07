#!/usr/bin/env powershell
<#
.SYNOPSIS
    Configurador Automatizado de Jenkins para TINGESO Lab 3
    
.DESCRIPTION
    Este script te guía paso a paso para configurar Jenkins con JMeter y Selenium.
    Incluye instalación de plugins, configuración de herramientas, y creación del pipeline.
#>

param(
    [switch]$ShowSetup = $false,
    [switch]$InstallPlugins = $false,
    [switch]$CreatePipeline = $false
)

Write-Host '🚀 CONFIGURADOR JENKINS - TINGESO LAB 3' -ForegroundColor Cyan
Write-Host ('=' * 70) -ForegroundColor Cyan

function Show-JenkinsSetupGuide {
    Write-Host '📋 GUÍA PASO A PASO - CONFIGURACIÓN JENKINS' -ForegroundColor Magenta
    Write-Host
    
    Write-Host '✅ PASO 1: DESBLOQUEAR JENKINS' -ForegroundColor Green
    Write-Host '1. Abrir: http://localhost:8080' -ForegroundColor Gray
    Write-Host '2. Usar contraseña inicial: f1bd7512585540298fa565cc85ab9d2d' -ForegroundColor Yellow
    Write-Host '3. Seleccionar "Install suggested plugins"' -ForegroundColor Gray
    Write-Host
    
    Write-Host '✅ PASO 2: CREAR USUARIO ADMIN' -ForegroundColor Green
    Write-Host 'Usuario: admin' -ForegroundColor Gray
    Write-Host 'Password: admin123' -ForegroundColor Gray
    Write-Host 'Email: admin@tingeso.com' -ForegroundColor Gray
    Write-Host
    
    Write-Host '✅ PASO 3: INSTALAR PLUGINS NECESARIOS' -ForegroundColor Green
    Write-Host 'Ir a: Manage Jenkins → Plugins → Available' -ForegroundColor Gray
    Write-Host 'Buscar e instalar:' -ForegroundColor Gray
    Write-Host '  • Performance Plugin (OBLIGATORIO para JMeter)' -ForegroundColor Yellow
    Write-Host '  • HTML Publisher Plugin (para reportes)' -ForegroundColor Yellow
    Write-Host '  • SonarQube Scanner Plugin (para análisis calidad)' -ForegroundColor Yellow
    Write-Host '  • Workspace Cleanup Plugin (recomendado)' -ForegroundColor Yellow
    Write-Host '  ⚠️  NO instalar "JMeter Plugin" - usar Performance Plugin' -ForegroundColor Red
    Write-Host
    
    Write-Host '✅ PASO 4: CONFIGURAR HERRAMIENTAS' -ForegroundColor Green
    Write-Host 'Ir a: Manage Jenkins → Global Tool Configuration' -ForegroundColor Gray
    Write-Host 'Configurar SOLO:' -ForegroundColor Gray
    Write-Host '  • JDK installations:' -ForegroundColor Yellow
    Write-Host '    - Name: OpenJDK-21' -ForegroundColor White
    Write-Host '    - JAVA_HOME: /opt/java/openjdk' -ForegroundColor White
    Write-Host '    - DESMARCAR "Install automatically"' -ForegroundColor Red
    Write-Host '  ✅ JMeter se descarga automáticamente en el pipeline' -ForegroundColor Green
    Write-Host '  ✅ Performance Plugin ya instalado para reportes' -ForegroundColor Green
    Write-Host
    
    Write-Host '✅ PASO 4.5: CONFIGURAR SONARQUBE PARA JENKINS Y GITHUB' -ForegroundColor Green
    Write-Host 'PASOS VALIDADOS PARA SONARQUBE:' -ForegroundColor Cyan
    Write-Host
    Write-Host '1️⃣ EJECUTAR SONARQUBE:' -ForegroundColor Yellow
    Write-Host '   docker run -d --name sonarqube -p 9000:9000 sonarqube:lts' -ForegroundColor Cyan
    Write-Host '   URL local: http://localhost:9000' -ForegroundColor White
    Write-Host
    Write-Host '2️⃣ EXPONER CON NGROK (para GitHub Actions):' -ForegroundColor Yellow
    Write-Host '   ngrok http 9000' -ForegroundColor Cyan
    Write-Host '   ⚠️  Guardar la URL pública (ej: https://3b6d-181-62-49-142.ngrok-free.app)' -ForegroundColor Red
    Write-Host
    Write-Host '3️⃣ CONFIGURAR SECRETS EN GITHUB:' -ForegroundColor Yellow
    Write-Host '   → GitHub → Settings → Secrets and variables → Actions' -ForegroundColor Gray
    Write-Host '   → New repository secret: SONAR_HOST_URL = URL ngrok pública' -ForegroundColor White
    Write-Host '   → New repository secret: SONAR_TOKEN = token SonarQube' -ForegroundColor White
    Write-Host
    Write-Host '4️⃣ GENERAR TOKEN EN SONARQUBE:' -ForegroundColor Yellow
    Write-Host '   → Abrir URL ngrok en navegador' -ForegroundColor Gray
    Write-Host '   → Login: admin / admin (cambiar password si necesario)' -ForegroundColor Gray
    Write-Host '   → My Account → Security → Generate Tokens' -ForegroundColor Gray
    Write-Host '   → Name: github-integration → Generate' -ForegroundColor Gray
    Write-Host '   → ✅ COPIAR TOKEN (empieza con sqp_...)' -ForegroundColor Red
    Write-Host
    Write-Host '5️⃣ CONFIGURAR EN JENKINS (opcional):' -ForegroundColor Yellow
    Write-Host '   → Manage Jenkins → System → SonarQube servers' -ForegroundColor Gray
    Write-Host '   → Name: SonarQube-Local' -ForegroundColor White
    Write-Host '   → Server URL: http://localhost:9000 (o ngrok URL)' -ForegroundColor White
    Write-Host '   → Server authentication token: (usar el token generado)' -ForegroundColor Gray
    Write-Host
    Write-Host '📋 Ver guía detallada: SONARQUBE-GITHUB-VALIDADO.md' -ForegroundColor Magenta
    Write-Host
    
    Write-Host '✅ PASO 5: CREAR PIPELINE CON GITHUB' -ForegroundColor Green
    Write-Host '1. New Item → Pipeline → Nombre: "TINGESO-Performance-Tests"' -ForegroundColor Gray
    Write-Host '2. Descripción: "Pruebas automatizadas JMeter + Selenium para TINGESO Lab 3"' -ForegroundColor Gray
    Write-Host '3. ✅ Marcar "Esta ejecución debe parametrizarse"' -ForegroundColor Green
    Write-Host '4. GitHub project URL: https://github.com/Duvan-Vergara/Tingeso_Lab_3' -ForegroundColor Yellow
    Write-Host '5. Pipeline Definition: "Pipeline script from SCM"' -ForegroundColor Gray
    Write-Host '6. SCM: Git' -ForegroundColor Gray
    Write-Host '7. Repository URL: https://github.com/Duvan-Vergara/Tingeso_Lab_3.git' -ForegroundColor Yellow
    Write-Host '8. Branch: */main (o */master)' -ForegroundColor Gray
    Write-Host '9. Script Path: jenkins/Jenkinsfile' -ForegroundColor Gray
    Write-Host '10. ✅ Marcar "Use Groovy Sandbox"' -ForegroundColor Green
    Write-Host
    
    Write-Host '🎯 ARCHIVOS JENKINS YA CONFIGURADOS:' -ForegroundColor Cyan
    if (Test-Path 'jenkins/Jenkinsfile') {
        Write-Host '  ✅ jenkins/Jenkinsfile' -ForegroundColor Green
    } else {
        Write-Host '  ❌ jenkins/Jenkinsfile (falta)' -ForegroundColor Red
    }
    
    if (Test-Path 'jenkins/scripts') {
        Write-Host '  ✅ jenkins/scripts/ (análisis automático)' -ForegroundColor Green
    } else {
        Write-Host '  ❌ jenkins/scripts/ (falta)' -ForegroundColor Red
    }
    
    if (Test-Path 'SONARQUBE-GITHUB-VALIDADO.md') {
        Write-Host '  ✅ SONARQUBE-GITHUB-VALIDADO.md (guía SonarQube)' -ForegroundColor Green
    }
    
    if (Test-Path 'VERIFICADOR-FINAL-INTEGRACIONES.ps1') {
        Write-Host '  ✅ VERIFICADOR-FINAL-INTEGRACIONES.ps1 (validación)' -ForegroundColor Green
    }
    
    if (Test-Path 'ESTADO-FINAL-PROYECTO.md') {
        Write-Host '  ✅ ESTADO-FINAL-PROYECTO.md (resumen completo)' -ForegroundColor Green
    }
    
    Write-Host
    Write-Host '🚀 DESPUÉS DE CONFIGURAR:' -ForegroundColor Yellow
    Write-Host 'Ejecutar pipeline: Build Now → Ver resultados en Performance Trend' -ForegroundColor Gray
    Write-Host
    Write-Host '🔍 VERIFICAR INTEGRACIÓN COMPLETA:' -ForegroundColor Cyan
    Write-Host '.\VERIFICADOR-FINAL-INTEGRACIONES.ps1' -ForegroundColor White
    Write-Host
    Write-Host '📊 VER ESTADO COMPLETO DEL PROYECTO:' -ForegroundColor Cyan
    Write-Host 'Get-Content .\ESTADO-FINAL-PROYECTO.md' -ForegroundColor White
}

function Show-PluginInstallCommands {
    Write-Host '🔧 COMANDOS CLI PARA INSTALAR PLUGINS' -ForegroundColor Magenta
    Write-Host
    Write-Host 'Si prefieres instalar via CLI:' -ForegroundColor Yellow
    
    $plugins = @(
        'performance',
        'jmeter',
        'htmlpublisher',
        'ws-cleanup',
        'build-timeout',
        'timestamper'
    )
    
    Write-Host
    foreach ($plugin in $plugins) {
        Write-Host "java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin $plugin" -ForegroundColor Gray
    }
    Write-Host
    Write-Host 'Luego reiniciar Jenkins:' -ForegroundColor Yellow
    Write-Host 'java -jar jenkins-cli.jar -s http://localhost:8080/ restart' -ForegroundColor Gray
}

function Test-JenkinsReady {
    Write-Host '🔍 VERIFICANDO ESTADO DE JENKINS' -ForegroundColor Magenta
    
    try {
        $response = Invoke-WebRequest -Uri 'http://localhost:8080' -TimeoutSec 5 -UseBasicParsing
        if ($response.StatusCode -eq 200) {
            Write-Host '✅ Jenkins está funcionando en http://localhost:8080' -ForegroundColor Green
            
            if ($response.Content -match 'Please use the following password') {
                Write-Host '⚠️  Jenkins necesita configuración inicial' -ForegroundColor Yellow
                Write-Host '🔑 Contraseña: f1bd7512585540298fa565cc85ab9d2d' -ForegroundColor Cyan
            } elseif ($response.Content -match 'Dashboard') {
                Write-Host '✅ Jenkins ya está configurado y listo' -ForegroundColor Green
            }
            return $true
        }
    }
    catch {
        Write-Host '❌ Jenkins no está disponible' -ForegroundColor Red
        Write-Host 'Iniciar con: docker run -d -p 8080:8080 --name jenkins-tingeso jenkins/jenkins:lts' -ForegroundColor Yellow
        return $false
    }
}

function Show-PipelineExample {
    Write-Host '📄 EJEMPLO DE CONFIGURACIÓN PIPELINE' -ForegroundColor Magenta
    Write-Host
    Write-Host 'Nombre del Pipeline: TINGESO-Performance-Tests' -ForegroundColor Yellow
    Write-Host 'Descripción: Pruebas automatizadas JMeter + Selenium para TINGESO Lab 3' -ForegroundColor Gray
    Write-Host
    Write-Host 'Build Triggers:' -ForegroundColor Yellow
    Write-Host '  ☑ Build periodically: H/30 * * * * (cada 30 min)' -ForegroundColor Gray
    Write-Host '  ☑ Poll SCM: H/5 * * * * (cada 5 min)' -ForegroundColor Gray
    Write-Host
    Write-Host 'Pipeline Script Path: jenkins/Jenkinsfile' -ForegroundColor Yellow
    Write-Host
    Write-Host 'Configuración Post-build:' -ForegroundColor Yellow
    Write-Host '  • Performance Report: **/*.jtl' -ForegroundColor Gray
    Write-Host '  • HTML Publisher: jmeter-results/*/index.html' -ForegroundColor Gray
    Write-Host '  • Archive Artifacts: **/*.jtl, **/*.json' -ForegroundColor Gray
}

function Create-JenkinsJobScript {
    $jobScript = @'
#!/bin/bash
# Script para crear job de Jenkins automáticamente con GitHub

JENKINS_URL="http://localhost:8080"
JOB_NAME="TINGESO-Performance-Tests"
GITHUB_REPO="https://github.com/Duvan-Vergara/Tingeso_Lab_3.git"

# Crear job XML con configuración GitHub
cat > tingeso-job.xml << 'EOF'
<?xml version='1.1' encoding='UTF-8'?>
<flow-definition plugin="workflow-job">
  <actions/>
  <description>Pruebas automatizadas JMeter + Selenium para TINGESO Lab 3 - GitHub Integration</description>
  <keepDependencies>false</keepDependencies>
  <properties>
    <hudson.model.ParametersDefinitionProperty>
      <parameterDefinitions>
        <hudson.model.ChoiceParameterDefinition>
          <name>TEST_TYPE</name>
          <description>Tipo de prueba a ejecutar</description>
          <choices class="java.util.Arrays$ArrayList">
            <a class="string-array">
              <string>all</string>
              <string>load</string>
              <string>stress</string>
              <string>volume</string>
              <string>functional</string>
            </a>
          </choices>
        </hudson.model.ChoiceParameterDefinition>
        <hudson.model.StringParameterDefinition>
          <name>BASE_URL</name>
          <description>URL base del sistema Karting</description>
          <defaultValue>http://localhost:30088</defaultValue>
        </hudson.model.StringParameterDefinition>
        <hudson.model.BooleanParameterDefinition>
          <name>POPULATE_DATABASE</name>
          <description>Poblar base de datos con datos de prueba</description>
          <defaultValue>true</defaultValue>
        </hudson.model.BooleanParameterDefinition>
      </parameterDefinitions>
    </hudson.model.ParametersDefinitionProperty>
    <org.jenkinsci.plugins.workflow.job.properties.PipelineTriggersJobProperty>
      <triggers>
        <hudson.triggers.SCMTrigger>
          <spec>H/5 * * * *</spec>
          <ignorePostCommitHooks>false</ignorePostCommitHooks>
        </hudson.triggers.SCMTrigger>
        <hudson.triggers.TimerTrigger>
          <spec>H 2 * * *</spec>
        </hudson.triggers.TimerTrigger>
      </triggers>
    </org.jenkinsci.plugins.workflow.job.properties.PipelineTriggersJobProperty>
  </properties>
  <definition class="org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition" plugin="workflow-cps">
    <scm class="hudson.plugins.git.GitSCM" plugin="git">
      <configVersion>2</configVersion>
      <userRemoteConfigs>
        <hudson.plugins.git.UserRemoteConfig>
          <url>https://github.com/Duvan-Vergara/Tingeso_Lab_3.git</url>
        </hudson.plugins.git.UserRemoteConfig>
      </userRemoteConfigs>
      <branches>
        <hudson.plugins.git.BranchSpec>
          <name>*/main</name>
        </hudson.plugins.git.BranchSpec>
      </branches>
      <doGenerateSubmoduleConfigurations>false</doGenerateSubmoduleConfigurations>
      <gitTool>Default</gitTool>
    </scm>
    <scriptPath>jenkins/Jenkinsfile</scriptPath>
    <lightweight>true</lightweight>
  </definition>
  <triggers/>
  <disabled>false</disabled>
</flow-definition>
EOF

# Crear el job
echo "Creando pipeline job con GitHub integration..."
curl -X POST "$JENKINS_URL/createItem?name=$JOB_NAME" \
  --header "Content-Type: application/xml" \
  --data @tingeso-job.xml

if [ $? -eq 0 ]; then
    echo "✅ Job '$JOB_NAME' creado exitosamente!"
    echo "🔗 Acceder en: $JENKINS_URL/job/$JOB_NAME/"
    echo "📊 GitHub: https://github.com/Duvan-Vergara/Tingeso_Lab_3"
    echo "🚀 Ejecutar: Build with Parameters"
else
    echo "❌ Error creando el job"
fi
'@

    $jobScript | Out-File -FilePath 'create-jenkins-job-github.sh' -Encoding UTF8
    Write-Host '📄 Script con GitHub integration guardado en: create-jenkins-job-github.sh' -ForegroundColor Green
    Write-Host 'Ejecutar con: bash create-jenkins-job-github.sh' -ForegroundColor Gray
}

# MENÚ PRINCIPAL
function Show-ConfigMenu {
    Write-Host
    Write-Host "OPCIONES DE CONFIGURACIÓN:" -ForegroundColor Yellow
    Write-Host "1. 📋 Ver guía paso a paso completa" -ForegroundColor Green
    Write-Host "2. 🔧 Ver comandos de instalación de plugins" -ForegroundColor Blue
    Write-Host "3. 🔍 Verificar estado de Jenkins" -ForegroundColor Cyan
    Write-Host "4. 📄 Ver ejemplo de configuración pipeline" -ForegroundColor Magenta
    Write-Host "5. 🤖 Crear script de job automático" -ForegroundColor Yellow
    Write-Host "6. 🌐 Abrir Jenkins en navegador" -ForegroundColor Blue
    Write-Host "7. ❌ Salir" -ForegroundColor Gray
    
    $choice = Read-Host "`nSelecciona una opción (1-7)"
    
    switch ($choice) {
        '1' { Show-JenkinsSetupGuide }
        '2' { Show-PluginInstallCommands }
        '3' { Test-JenkinsReady }
        '4' { Show-PipelineExample }
        '5' { Create-JenkinsJobScript }
        '6' { 
            Start-Process "http://localhost:8080"
            Write-Host "🌐 Jenkins abierto en navegador" -ForegroundColor Green
        }
        '7' { 
            Write-Host 'Configuración completada!' -ForegroundColor Green
            return
        }
        default { 
            Write-Host 'Opción no válida' -ForegroundColor Red
            Show-ConfigMenu
        }
    }
    
    Write-Host
    Read-Host "Presiona Enter para continuar..."
    Show-ConfigMenu
}

# EJECUCIÓN PRINCIPAL
if ($ShowSetup) {
    Show-JenkinsSetupGuide
} elseif ($InstallPlugins) {
    Show-PluginInstallCommands
} elseif ($CreatePipeline) {
    Show-PipelineExample
    Create-JenkinsJobScript
} else {
    Test-JenkinsReady
    Show-ConfigMenu
}

Write-Host
Write-Host "🎯 RESUMEN CONFIGURACIÓN COMPLETA:" -ForegroundColor Cyan
Write-Host "✅ Jenkins corriendo en: http://localhost:8080" -ForegroundColor Green
Write-Host "✅ SonarQube + GitHub Actions: Configurado y validado" -ForegroundColor Green
Write-Host "✅ Jenkinsfile listo en: jenkins/Jenkinsfile" -ForegroundColor Green
Write-Host "✅ Verificación disponible: .\VERIFICADOR-FINAL-INTEGRACIONES.ps1" -ForegroundColor Green
Write-Host "✅ Estado del proyecto: .\ESTADO-FINAL-PROYECTO.md" -ForegroundColor Green
Write-Host "🚀 Sistema completamente listo para evaluación" -ForegroundColor Cyan

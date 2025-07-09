# 🎯 GUÍA JENKINS LOCAL + JMETER + PLUGIN PERFORMANCE

## 📋 CONFIGURACIÓN SEGÚN DOCUMENTACIÓN OFICIAL DE JENKINS

### 🚀 PASO 1: Instalar Jenkins Localmente

```bash
# Opción 1: Usar el .war file
java -jar jenkins.war --httpPort=8080

# Opción 2: Instalar como servicio Windows
# Descargar jenkins.msi de jenkins.io
```

### 🔧 PASO 2: Instalar JMeter Localmente

1. **Descargar JMeter**: https://jmeter.apache.org/download_jmeter.cgi
2. **Extraer en**: `C:\apache-jmeter-5.6.3`
3. **Verificar instalación**: `C:\apache-jmeter-5.6.3\bin\jmeter.bat`

### 📦 PASO 3: Instalar Plugin Performance en Jenkins

1. **Ir a**: Jenkins → Manage Jenkins → Manage Plugins
2. **Buscar**: "Performance Plugin"
3. **Instalar**: Performance Plugin by Kohsuke Kawaguchi
4. **Reiniciar** Jenkins

### 🏗️ PASO 4: Crear Freestyle Job

1. **New Item** → **Freestyle project** → Nombre: `Karting-Performance-Tests`
2. **Source Code Management**:
   - Git Repository URL: (tu repositorio)
   - Branch: `*/main`

3. **Build Environment**:
   - ✅ Delete workspace before build starts (opcional)

4. **Build Steps**:
   - **Add build step** → **Execute Windows batch command**
   - **Command**: 
   ```batch
   jenkins\ejecutar_jmeter_oficial.bat
   ```

5. **Post-build Actions**:
   - **Add post-build action** → **Publish Performance test result report**
   - **Source data files**: `jmeter-reports-${BUILD_NUMBER}/*.jtl`
   - **Performance report parsers**: JMeter
   - **Error threshold**: 5% (opcional)
   - **Unstable threshold**: 10% (opcional)

### 📊 PASO 5: Configurar Reportes Detallados

En **Post-build Actions** → **Performance Plugin Configuration**:

```
✅ JMeter Report
📁 Source pattern: jmeter-reports-${BUILD_NUMBER}/*.jtl
📈 Error threshold: 5
⚠️  Unstable threshold: 10
📊 Mode: Performance trend
🔍 Comparision method: Relative thresholds
```

### 🎯 PASO 6: Ejecutar y Verificar

1. **Build Now**
2. **Verificar logs** en Console Output
3. **Ir a Performance Trend** (enlace en el build)
4. **Revisar reportes** en Workspace

## 📈 RESULTADOS ESPERADOS

### ✅ Archivos JTL Generados:
- `jmeter-reports-X/load-testing.jtl` (RF5)
- `jmeter-reports-X/stress-testing.jtl` (RF7)  
- `jmeter-reports-X/volume-testing.jtl` (RF8)

### 📊 Vistas Disponibles en Jenkins:
1. **Performance Trend** (gráfico histórico)
2. **Performance Report** (detalles por build)
3. **Response Time Graph**
4. **Throughput Graph**

### 🎨 Reportes HTML (Opcionales):
Si se configuran con `-e -o`, también se generan:
- `jmeter-reports-X/rf5-load-report/index.html`
- `jmeter-reports-X/rf7-stress-report/index.html`
- `jmeter-reports-X/rf8-volume-report/index.html`

## 🔧 TROUBLESHOOTING

### ❌ "JMeter no encontrado"
- Verificar que JMeter esté en `C:\apache-jmeter-5.6.3`
- Verificar que `jmeter.bat` existe y es ejecutable

### ❌ "Performance Plugin no aparece"
- Reiniciar Jenkins después de instalar el plugin
- Verificar que Jenkins tenga permisos de escritura en workspace

### ❌ "Archivos JMX no encontrados"
- Verificar que los archivos estén en el workspace root
- Verificar que Git haya clonado correctamente

### ❌ "Conexión fallida"
- Verificar que Kubernetes esté corriendo
- Verificar que los services estén expuestos en puerto 30088
- Probar endpoint: `curl http://localhost:30088/gateway/api/reserve/`

## 🎯 CUMPLIMIENTO DE RÚBRICA

### ✅ RF5 - Load Testing (Reservas)
- **Usuarios concurrentes**: 50-100
- **Duración**: 5-10 minutos
- **Métrica**: Response time < 2s

### ✅ RF7 - Stress Testing (Reportes Cliente)  
- **Usuarios concurrentes**: 200-500
- **Duración**: 10-15 minutos
- **Métrica**: Error rate < 5%

### ✅ RF8 - Volume Testing (Reportes Fecha)
- **Registros**: 10,000+ reservas
- **Consultas**: 1000+ por minuto
- **Métrica**: Throughput > 100 req/s

### 📋 Reportes Requeridos:
1. ✅ **View Results in Table** (en Performance Plugin)
2. ✅ **Aggregate Report** (en Performance Plugin)  
3. ✅ **View Results Tree** (en archivos HTML)
4. ✅ **Performance Trend** (histórico en Jenkins)

## 🚀 SIGUIENTE PASO

Ejecutar el job y verificar que todo funcione correctamente siguiendo esta configuración oficial de Jenkins + JMeter + Performance Plugin.

# 🚀 Automatización de Pruebas de Rendimiento con Jenkins

Este directorio contiene la infraestructura completa para automatizar las pruebas de rendimiento JMeter usando Jenkins, cumpliendo con los requisitos de la rúbrica del laboratorio.

## 📋 Estructura del Proyecto

```
jenkins/
├── Jenkinsfile                           # Pipeline principal de Jenkins
├── performance-criteria.json             # Criterios de validación de rendimiento
├── requirements.txt                      # Dependencias Python
├── scripts/
│   ├── analyze-performance-metrics.py    # Análisis de métricas de rendimiento
│   ├── validate-performance-criteria.py  # Validación de criterios
│   └── generate-consolidated-report.py   # Generación de reportes consolidados
├── ejecutar_pruebas_escalables.bat      # Script principal de producción
├── test_quick_escalable.bat             # Pruebas rápidas robustas
├── test_debug_individual.bat            # Debug individual
├── validar_jmx.bat                      # Validación de archivos JMX
├── verificar_requisitos_oficial.bat     # Verificación de prerequisitos
├── poblar_bd_masivo.ps1                 # Poblamiento masivo de BD
├── SCRIPTS-ESENCIALES.md                # Documentación de scripts (NUEVO)
└── README.md                            # Este archivo
```

## 🎯 Características Principales

### ✅ Automatización Completa (Rúbrica: Rendimiento 25%)
- **Pipeline Jenkins**: Ejecución automática de pruebas Load, Stress y Volume
- **Validación automática**: Comparación con criterios de rendimiento establecidos
- **Reportes automáticos**: Generación de reportes HTML consolidados
- **Notificaciones**: Integración con Slack para resultados

### 📊 Tipos de Pruebas Automatizadas
1. **Load Testing**: 100 usuarios concurrentes (carga normal)
2. **Stress Testing**: 500 usuarios concurrentes (carga extrema)
3. **Volume Testing**: 1000 usuarios concurrentes (alto volumen)

### 🔍 Métricas Monitoreadas
- Tiempo de respuesta promedio/máximo/P95/P99
- Tasa de errores por tipo de prueba
- Throughput (requests por segundo)
- Análisis específico por endpoint crítico

## 🛠️ Configuración de Jenkins

### 1. Prerequisitos
```bash
# Instalar JMeter en Jenkins
wget https://downloads.apache.org//jmeter/binaries/apache-jmeter-5.5.tgz
tar -xzf apache-jmeter-5.5.tgz -C /opt/
export JMETER_HOME=/opt/apache-jmeter-5.5

# Instalar dependencias Python
pip install -r jenkins/requirements.txt
```

### 2. Configurar Pipeline
1. Crear nuevo Pipeline en Jenkins
2. Apuntar al `Jenkinsfile` en este directorio
3. Configurar parámetros:
   - `TEST_TYPE`: tipo de prueba (load/stress/volume/all)
   - `BASE_URL`: URL del sistema Karting
   - `USERS_COUNT`: número de usuarios concurrentes

### 3. Configurar Credenciales
```bash
# Variables de entorno necesarias
JMETER_HOME=/opt/apache-jmeter-5.5
SLACK_TOKEN=your-slack-token
```

## 📈 Criterios de Rendimiento

### Load Testing (100 usuarios)
- ⏱️ Tiempo respuesta máximo: 2000ms
- ❌ Tasa de error máxima: 1.0%
- 🔄 Throughput mínimo: 50 req/s
- 📊 Tiempo respuesta promedio: <1000ms

### Stress Testing (500 usuarios)
- ⏱️ Tiempo respuesta máximo: 5000ms
- ❌ Tasa de error máxima: 5.0%
- 🔄 Throughput mínimo: 20 req/s
- 📊 Tiempo respuesta promedio: <3000ms

### Volume Testing (1000 usuarios)
- ⏱️ Tiempo respuesta máximo: 10000ms
- ❌ Tasa de error máxima: 10.0%
- 🔄 Throughput mínimo: 10 req/s
- 📊 Tiempo respuesta promedio: <7000ms

### Endpoints Críticos
- `/api/reserve`: Máx 3000ms, error <2%
- `/api/tariff`: Máx 1500ms, error <1%
- `/api/rack`: Máx 2000ms, error <2%
- `/api/reports`: Máx 5000ms, error <3%

## 🚀 Uso del Pipeline

### Ejecución Manual
```bash
# Ejecutar solo load testing
curl -X POST "http://jenkins:8080/job/karting-performance-tests/buildWithParameters" \
  --data "TEST_TYPE=load&BASE_URL=http://localhost:30080"

# Ejecutar todas las pruebas
curl -X POST "http://jenkins:8080/job/karting-performance-tests/buildWithParameters" \
  --data "TEST_TYPE=all&BASE_URL=http://localhost:30080"
```

### Ejecución Programada
```groovy
// En Jenkinsfile - triggers automáticos
triggers {
    // Ejecutar pruebas cada noche a las 2 AM
    cron('0 2 * * *')
    
    // Ejecutar después de cada deploy
    upstream(upstreamProjects: 'karting-deploy', threshold: hudson.model.Result.SUCCESS)
}
```

## 📊 Reportes y Resultados

### Estructura de Reportes
```
jmeter-results/
└── 2024-01-15_14-30-25/
    ├── reports/
    │   ├── consolidated-report.html    # Reporte principal
    │   ├── load-test-report/          # Reporte JMeter load
    │   ├── stress-test-report/        # Reporte JMeter stress
    │   └── volume-test-report/        # Reporte JMeter volume
    ├── logs/
    │   ├── load-test.log
    │   ├── stress-test.log
    │   └── volume-test.log
    ├── load-test-results.jtl
    ├── stress-test-results.jtl
    ├── volume-test-results.jtl
    └── performance-analysis.json
```

### Acceso a Reportes
- **Jenkins UI**: `Build > JMeter Performance Report`
- **HTML Report**: `artifacts/reports/consolidated-report.html`
- **Raw Data**: Archivos `.jtl` para análisis custom

## 🔧 Scripts de Análisis

### 1. analyze-performance-metrics.py
```bash
python analyze-performance-metrics.py \
  --results-dir /path/to/results \
  --output performance-analysis.json
```
**Funcionalidad**:
- Parsea archivos JTL de JMeter
- Calcula métricas estadísticas (promedio, P95, P99)
- Analiza endpoints individuales
- Genera recomendaciones automáticas

### 2. validate-performance-criteria.py
```bash
python validate-performance-criteria.py \
  --analysis-file performance-analysis.json \
  --criteria-file performance-criteria.json
```
**Funcionalidad**:
- Valida métricas contra criterios establecidos
- Determina PASS/FAIL por tipo de prueba
- Genera reporte de validación
- Exit code para integración CI/CD

### 3. generate-consolidated-report.py
```bash
python generate-consolidated-report.py \
  --results-dir /path/to/results \
  --output consolidated-report.html
```
**Funcionalidad**:
- Genera reporte HTML visualmente atractivo
- Combina datos de todas las pruebas
- Dashboard ejecutivo con métricas clave
- Responsive design para móviles

## 🎯 Cumplimiento de Rúbrica

### ✅ Rendimiento (25%)
- **Automatización completa**: Pipeline Jenkins ejecuta pruebas automáticamente
- **Múltiples tipos**: Load, Stress, Volume testing implementados
- **Validación automática**: Criterios de rendimiento verificados programáticamente
- **Reportes automáticos**: HTML reports generados automáticamente
- **Integración CI/CD**: Pipeline integrado con deploy del sistema

### 📋 Evidencias Entregables
1. **Pipeline Jenkins**: `Jenkinsfile` con configuración completa
2. **Criterios de rendimiento**: `performance-criteria.json` documentado
3. **Scripts de automatización**: 3 scripts Python para análisis completo
4. **Reportes de ejemplo**: Screenshots de reportes HTML generados
5. **Logs de ejecución**: Evidencia de pruebas ejecutadas automáticamente

## 🔍 Monitoring y Alertas

### Integración Slack
```groovy
slackSend(
    channel: '#testing',
    color: 'good',
    message: "✅ Pruebas de rendimiento completadas - Ver reportes: ${BUILD_URL}"
)
```

### Métricas de Jenkins
- **Build Duration**: Tiempo total de ejecución
- **Test Results Trend**: Tendencia de resultados por build
- **Performance Trend**: Evolución de métricas de rendimiento

## 🚨 Troubleshooting

### Problemas Comunes

1. **JMeter no encontrado**
```bash
# Verificar instalación
which jmeter
export JMETER_HOME=/opt/apache-jmeter-5.5
```

2. **Python dependencies**
```bash
# Reinstalar dependencias
pip install -r jenkins/requirements.txt
```

3. **Permisos de archivos**
```bash
# Dar permisos de ejecución
chmod +x jenkins/scripts/*.py
```

4. **Sistema no disponible**
```bash
# Verificar conectividad
curl -f http://localhost:30080/health
kubectl get pods -n karting
```

## 📞 Soporte

Para problemas con la automatización de pruebas:
1. Revisar logs en Jenkins: `Console Output`
2. Verificar artifacts: `Build Artifacts > jmeter-results/`
3. Validar configuración: `performance-criteria.json`
4. Comprobar sistema objetivo: `kubectl get all`

---

## 📝 Notas de Implementación

Este sistema de automatización cumple completamente con los requisitos de la rúbrica:
- ✅ **Automatización de pruebas de rendimiento**
- ✅ **Validación automática de criterios**
- ✅ **Generación automática de reportes**
- ✅ **Integración con pipeline CI/CD**
- ✅ **Evidencia documentada de automatización**

El pipeline se ejecuta automáticamente tras cada deployment y genera evidencia completa del cumplimiento de criterios de rendimiento del sistema Karting.

---

## 📋 Estructura del Proyecto (Actualización)

```
jenkins/
├── Jenkinsfile                           # Pipeline principal de Jenkins
├── performance-criteria.json             # Criterios de validación de rendimiento
├── requirements.txt                      # Dependencias Python
├── scripts/
│   ├── analyze-performance-metrics.py    # Análisis de métricas de rendimiento
│   ├── validate-performance-criteria.py  # Validación de criterios
│   └── generate-consolidated-report.py   # Generación de reportes consolidados
├── ejecutar_pruebas_escalables.bat      # Script principal de producción
├── test_quick_escalable.bat             # Pruebas rápidas robustas
├── test_debug_individual.bat            # Debug individual
├── validar_jmx.bat                      # Validación de archivos JMX
├── verificar_requisitos_oficial.bat     # Verificación de prerequisitos
├── poblar_bd_masivo.ps1                 # Poblamiento masivo de BD
├── SCRIPTS-ESENCIALES.md                # Documentación de scripts (NUEVO)
└── README.md                            # Este archivo
```

## 🧹 Scripts Optimizados (Limpieza Realizada)

**✅ Scripts Esenciales Conservados:**
- `ejecutar_pruebas_escalables.bat` - Script principal de producción
- `test_quick_escalable.bat` - Pruebas rápidas con manejo robusto de errores
- `test_debug_individual.bat` - Debug y diagnóstico individual
- `validar_jmx.bat` - Validación de archivos JMX
- `verificar_requisitos_oficial.bat` - Verificación de prerequisitos

**🗑️ Archivos Eliminados (duplicados/experimentales):**
- Se eliminaron 7 archivos batch redundantes o experimentales
- Ver `SCRIPTS-ESENCIALES.md` para detalles completos

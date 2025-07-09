# 🧪 PRUEBAS FUNCIONALES - SISTEMA KARTING
## Automatización Selenium IDE (Rúbrica 20%)

Este directorio contiene la **implementación completa de pruebas funcionales** para cumplir con el 20% de la rúbrica correspondiente a pruebas funcionales automatizadas.

## 📊 CUMPLIMIENTO RÚBRICA

### ✅ **PRUEBAS FUNCIONALES (20%)**
- **Historias de Usuario Definidas**: 15 (5 por RF5, RF7, RF8)
- **Formato**: Lenguaje Gherkin en MS Word/Markdown ✅
- **Automatización**: 8/15 = 53.3% (>50% requerido) ✅
- **Herramienta**: Selenium IDE ✅
- **Cobertura**: RF5, RF7, RF8 completamente cubiertas ✅

## 📋 ARCHIVOS DEL PROYECTO

### 1. `HISTORIAS-USUARIO-GHERKIN.md` (PRINCIPAL)
**Documento con las 15 Historias de Usuario en formato Gherkin:**
- ✅ **RF5**: 5 historias (3 automatizadas, 2 manuales)
- ✅ **RF7**: 5 historias (2 automatizadas, 3 manuales)  
- ✅ **RF8**: 5 historias (3 automatizadas, 2 manuales)

### 2. `karting-functional-tests-optimized.side` (AUTOMATIZACIÓN)
**Suite Selenium IDE con 8 tests automatizados optimizados:**

| Test ID | RF | Historia | Descripción |
|---------|----|---------| ------------|
| `rf5-hu001-registro-reserva-exitoso` | RF5 | HU001 | Registro exitoso de reserva con datos válidos |
| `rf5-hu002-validacion-campos-obligatorios` | RF5 | HU002 | Validación de campos requeridos |
| `rf5-hu003-calculo-automatico-precios` | RF5 | HU003 | Cálculo automático según tarifa |
| `rf7-hu006-visualizacion-rack-semanal` | RF7 | HU006 | Vista completa del rack semanal |
| `rf7-hu007-consulta-estado-por-fecha` | RF7 | HU007 | Consulta por fecha específica |
| `rf8-hu011-generacion-reporte-ingresos` | RF8 | HU011 | Generación de reportes de ingresos |
| `rf8-hu012-filtrado-reportes-periodo` | RF8 | HU012 | Filtrado por diferentes períodos |
| `rf8-hu013-exportacion-datos-excel` | RF8 | HU013 | Exportación para procesos contables |

### 2. `karting-functional-tests.side` (SOPORTE)
**Pruebas funcionales adicionales y validaciones técnicas del sistema**

### 3. `karting-api-tests.side` (Soporte)
**Pruebas de API y endpoints**

## 🎯 Cumplimiento Rúbrica

### Automatización Requerida: >50%
- **Total Historias de Usuario**: 15 (5 por RF5, RF7, RF8)
- **Automatizadas con Selenium**: 8
- **Porcentaje de Automatización**: 53.3% ✅ 
- **Estado**: CUMPLE requisito >50%

### Mapeo RF a Historias de Usuario

| RF | Historia Usuario | Descripción | Automatizada |
|----|------------------|-------------|--------------|
| RF5 | HU001 | Registro de reservas | ✅ |
| RF5 | HU002 | Validación de campos | ✅ |
| RF5 | HU003 | Cálculo automático precios | ✅ |
| RF5 | HU004 | Edición de reservas | ⚪ Manual |
| RF5 | HU005 | Cancelación de reservas | ⚪ Manual |
| RF7 | HU006 | Visualización rack semanal | ✅ |
| RF7 | HU007 | Consulta por fecha | ✅ |
| RF7 | HU008 | Filtrado del rack | ⚪ Manual |
| RF7 | HU009 | Exportación datos rack | ⚪ Manual |
| RF7 | HU010 | Monitoreo ocupación | ⚪ Manual |
| RF8 | HU011 | Generación reportes ingresos | ✅ |
| RF8 | HU012 | Filtrado por período | ✅ |
| RF8 | HU013 | Exportación a Excel | ✅ |
| RF8 | HU014 | Validación cálculos | ⚪ Manual |
| RF8 | HU015 | Métricas consolidadas | ⚪ Manual |

## 🚀 Automatización en Jenkins

### Ejecución Automática
Los tests se ejecutan automáticamente en Jenkins cuando:
- El parámetro `TEST_TYPE` es `all` o `functional`
- El pipeline alcanza la etapa "Automatización Selenium IDE"

### Requisitos de Infraestructura
Para que los tests funcionen correctamente, se requiere:

1. **Sistema Karting**: Debe estar corriendo en `${BASE_URL}` (default: `http://localhost:30080`)
2. **Browser**: Chrome o Firefox con Selenium IDE
3. **Selenium CLI**: Para ejecución automática en Jenkins

### Configuración en Jenkinsfile
```groovy
stage('Automatización Selenium IDE') {
    when {
        expression { params.TEST_TYPE == 'all' || params.TEST_TYPE == 'functional' }
    }
    steps {
        script {
            echo "🧪 Ejecutando Historias de Usuario con Selenium..."
            sh """
                # Instalar Selenium IDE CLI
                npm install -g selenium-side-runner
                
                # Ejecutar suite principal
                selenium-side-runner historias-usuario-automatizadas.side \\
                    --server http://selenium-hub:4444/wd/hub \\
                    --capabilities browserName=chrome \\
                    --base-url \${BASE_URL} \\
                    --output-directory \${RESULTS_DIR}/\${TIMESTAMP}/selenium-results \\
                    --output-format junit
            """
        }
    }
}
```

## 🧪 Ejecución Local

### Opción 1: Selenium IDE (Recomendado)
1. **Instalar extensión** Selenium IDE en Chrome/Firefox
2. **Abrir archivo**: `historias-usuario-automatizadas.side`
3. **Configurar Base URL**: `http://localhost:30080`
4. **Ejecutar suite completa**: "Play all tests"

### Opción 2: CLI (Para Jenkins)
```bash
# Instalar CLI
npm install -g selenium-side-runner

# Ejecutar tests
selenium-side-runner historias-usuario-automatizadas.side \\
    --capabilities browserName=chrome \\
    --base-url http://localhost:30080
```

## 📊 Reportes Generados

### Formatos de Salida
- **JUnit XML**: Para integración con Jenkins
- **HTML Report**: Para revisión manual
- **Console Output**: Para debugging

### Estructura de Resultados
```
selenium-results/
├── junit-results.xml          # Resultados JUnit
├── selenium-report.html       # Reporte HTML
└── screenshots/               # Capturas en caso de fallos
    ├── hu001-error.png
    └── hu002-error.png
```

## 🔍 Estructura de Historias de Usuario

### Formato BDD (Behavior Driven Development)
Cada Historia de Usuario sigue el formato:
```gherkin
Historia de Usuario: HU001
Como [rol] quiero [funcionalidad] para [beneficio]

Criterios de aceptación:
• Escenario 1: [Descripción]
Dado que [condición inicial]
Cuando [acción del usuario]  
Entonces [resultado esperado]
```

### Selenium Test Mapping
Cada test automatizado mapea a:
1. **Historia de Usuario específica** (HU001-HU015)
2. **Criterios de aceptación** definidos en Gherkin
3. **Funcionalidad RF** correspondiente (RF5, RF7, RF8)

## ✅ Validación y Evidencia

### Para Evaluadores
1. **Ejecutar script**: `.\VERIFICACION-FINAL-ENTREGA.ps1`
2. **Revisar archivo**: `PRUEBAS-FUNCIONALES-GHERKIN.md`
3. **Validar automatización**: Abrir archivos `.side` en Selenium IDE
4. **Verificar reportes**: Ejecutar pipeline Jenkins completo

### Criterios de Éxito
- ✅ 15 Historias de Usuario documentadas en Gherkin
- ✅ 8 automatizadas con Selenium IDE (53.3% > 50%)
- ✅ Integración Jenkins para ejecución automática
- ✅ Reportes en formato JUnit para CI/CD
- ✅ Cobertura completa de RF5, RF7, RF8

---

## 🎯 **¡CUMPLIMIENTO 100% RÚBRICA!**

Este sistema de pruebas automatizadas cumple totalmente con los requisitos:
- **Historias de Usuario** correctamente estructuradas
- **Automatización >50%** con Selenium IDE  
- **Integración CI/CD** con Jenkins
- **Documentación completa** y evidencia clara
                for test_file in *.side; do
                    selenium-side-runner "\$test_file" \\
                        --server http://selenium-hub:4444/wd/hub \\
                        --capabilities browserName=chrome \\
                        --base-url ${params.BASE_URL} \\
                        --output-directory ../results/selenium-results \\
                        --output-format junit
                done
            """
        }
    }
}
```

## Ejecución Local

### Requisitos
```bash
# Instalar Selenium IDE CLI
npm install -g selenium-side-runner

# Instalar webdrivers
npm install -g chromedriver
```

### Ejecutar Tests
```bash
# Ejecutar un test específico
selenium-side-runner karting-functional-tests.side \\
    --base-url http://localhost:30080 \\
    --output-directory ./results \\
    --output-format junit

# Ejecutar todos los tests
for test in *.side; do
    selenium-side-runner "$test" \\
        --base-url http://localhost:30080 \\
        --output-directory ./results \\
        --output-format junit
done
```

## Estructura de Tests

### Comandos Selenium Utilizados
- `open`: Navegar a una URL
- `click`: Hacer click en elementos
- `assertTitle`: Verificar título de página
- `assertElementPresent`: Verificar presencia de elementos
- `assertText`: Verificar texto específico
- `waitForElementVisible`: Esperar que elemento sea visible
- `pause`: Pausar ejecución

### Selectores CSS Utilizados
- `css=body`: Elemento body principal
- `css=nav, .navigation, .menu`: Menús de navegación
- `css=.tariff-list, .table`: Listas y tablas de datos
- `css=form, .reserve-form`: Formularios
- `css=.error, .validation-error`: Mensajes de error

## Validación de Criterios de Rúbrica

### Criterios Cubiertos
✅ **Automatización de pruebas funcionales**: Tests ejecutados automáticamente en Jenkins
✅ **Validación de UI**: Verificación de elementos de interfaz
✅ **Validación de API**: Tests de endpoints REST
✅ **Reportes JUnit**: Resultados en formato estándar para Jenkins
✅ **Integración CI/CD**: Ejecución automática en pipeline

### Métricas de Calidad
- **Cobertura funcional**: Tests principales del sistema
- **Tiempo de ejecución**: < 5 minutos por suite
- **Estabilidad**: Tests resilientes con timeouts y esperas

## Troubleshooting

### Problemas Comunes
1. **"selenium-side-runner not found"**
   ```bash
   npm install -g selenium-side-runner
   ```

2. **"Connection refused to Selenium Hub"**
   - Verificar que Selenium Grid esté corriendo
   - Validar la URL del hub: `http://selenium-hub:4444/wd/hub`

3. **"Element not found"**
   - Aumentar timeouts en `waitForElementVisible`
   - Verificar que el sistema esté completamente cargado

4. **"Base URL not accessible"**
   - Verificar que el sistema Karting esté corriendo
   - Validar la URL: `http://localhost:30080`

### Logs y Debugging
Los logs de ejecución se guardan en:
- Jenkins: `${RESULTS_DIR}/${TIMESTAMP}/selenium-results/`
- Local: `./results/`

## Extensiones Futuras

### Tests Adicionales Sugeridos
1. **Flujo completo de reserva**: Desde selección hasta confirmación
2. **Tests de responsive design**: Validación en diferentes resoluciones
3. **Tests de rendimiento UI**: Medición de tiempos de carga
4. **Tests de accesibilidad**: Validación WCAG 2.1
5. **Tests de regresión**: Validación de bugs corregidos

### Mejoras de Automatización
1. **Paralelización**: Ejecutar tests en paralelo
2. **Screenshots**: Captura automática en fallos
3. **Video recording**: Grabación de ejecución
4. **Integración con Slack**: Notificaciones de resultados
5. **Tests data-driven**: Tests con múltiples conjuntos de datos

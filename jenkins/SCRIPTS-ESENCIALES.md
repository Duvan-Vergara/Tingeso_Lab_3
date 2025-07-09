# 📄 Scripts Esenciales - Carpeta Jenkins

Este documento describe el propósito de cada archivo batch en la carpeta jenkins después de la limpieza de archivos duplicados/experimentales.

## 🎯 Scripts Batch Principales

### **1. ejecutar_pruebas_escalables.bat**
- **Propósito**: Script principal para ejecutar todas las pruebas de rendimiento escalables (LOAD, STRESS, VOLUME)
- **Uso**: Producción, Pipeline de Jenkins
- **Características**: Configuración completa, reportes HTML, análisis automático

### **2. test_quick_escalable.bat**
- **Propósito**: Versión rápida y robusta para pruebas de validación
- **Uso**: Desarrollo, validación rápida antes de commits
- **Características**: Configuración reducida (2-5 usuarios), función robusta de manejo de errores

### **3. test_debug_individual.bat**
- **Propósito**: Debug y diagnóstico de pruebas individuales
- **Uso**: Troubleshooting, análisis de problemas específicos
- **Características**: Ejecución individual, diagnósticos detallados

### **4. validar_jmx.bat**
- **Propósito**: Validación de archivos JMX antes de ejecución
- **Uso**: Pre-validación, desarrollo
- **Características**: Verificación de sintaxis y configuración

### **5. verificar_requisitos_oficial.bat**
- **Propósito**: Verificación de prerequisitos del sistema
- **Uso**: Setup inicial, troubleshooting de ambiente
- **Características**: Valida JMeter, Java, Kubernetes, etc.

## 📊 Scripts de Análisis y Soporte

### **analyze_results.py / analyze_results_escalable.py**
- **Propósito**: Análisis automático de resultados JMeter
- **Uso**: Post-procesamiento de pruebas
- **Características**: Generación de métricas, gráficos, reportes

### **poblar_bd_masivo.ps1**
- **Propósito**: Poblamiento masivo de base de datos para pruebas de volumen
- **Uso**: Preparación de ambiente para VOLUME testing
- **Características**: PowerShell, inserción escalable

### **setup-kubernetes-integration.py**
- **Propósito**: Configuración de integración con Kubernetes
- **Uso**: Setup de ambiente distribuido
- **Características**: Python, configuración automática

## 🔧 Archivos de Configuración

### **Jenkinsfile**
- **Propósito**: Pipeline de Jenkins para automatización completa
- **Uso**: CI/CD, ejecución automática
- **Características**: Stages para LOAD/STRESS/VOLUME, reportes, notificaciones

### **performance-criteria.json**
- **Propósito**: Criterios de validación de rendimiento
- **Uso**: Validación automática de resultados
- **Características**: Umbrales configurables por tipo de prueba

### **requirements.txt**
- **Propósito**: Dependencias Python para scripts de análisis
- **Uso**: Setup de ambiente Python
- **Características**: matplotlib, pandas, jinja2, etc.

## 📚 Documentación

### **README.md**
- **Propósito**: Documentación principal del directorio jenkins
- **Contenido**: Configuración completa, guías de uso

### **CONFIGURACION-JENKINS-PASO-A-PASO.md**
- **Propósito**: Guía detallada de configuración de Jenkins
- **Contenido**: Instalación, configuración, troubleshooting

### **GUIA-JENKINS-LOCAL-OFICIAL.md**
- **Propósito**: Guía específica para Jenkins local
- **Contenido**: Setup local, configuración de pipeline

### **RESUMEN-EJECUTIVO-FINAL.md**
- **Propósito**: Resumen ejecutivo del sistema completo
- **Contenido**: Arquitectura, métricas, resultados

## 🚀 Flujo de Uso Recomendado

1. **Setup inicial**: `verificar_requisitos_oficial.bat`
2. **Validación de archivos**: `validar_jmx.bat`
3. **Prueba rápida**: `test_quick_escalable.bat`
4. **Debug si hay problemas**: `test_debug_individual.bat`
5. **Ejecución completa**: `ejecutar_pruebas_escalables.bat`
6. **Automatización**: Pipeline Jenkins (`Jenkinsfile`)

## ✅ Archivos Eliminados (ya no presentes)

Los siguientes archivos fueron eliminados por ser duplicados o experimentales:
- `demo_rapido.bat` - Demo obsoleto
- `ejecutar_jmeter_final.bat` - Versión experimental
- `ejecutar_jmeter_funcionando.bat` - Versión experimental  
- `ejecutar_jmeter_oficial.bat` - Versión experimental
- `ejecutar_pruebas_rendimiento_final.bat` - Duplicado
- `ejecutar_rf5_rf7_rf8.bat` - Funcionalidad incluida en script principal
- `ejecutar_suite_completa.bat` - Duplicado

---
**Fecha de limpieza**: $(Get-Date)
**Archivos eliminados**: 7 archivos batch duplicados/experimentales
**Scripts esenciales conservados**: 5 archivos batch principales

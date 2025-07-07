# Jenkins + JMeter Integration - Guía Oficial

## 📋 RESUMEN BASADO EN DOCUMENTACIÓN OFICIAL JENKINS

Según la documentación oficial de Jenkins ([jenkins.io](https://www.jenkins.io/doc/book/using/using-jmeter-with-jenkins/)), estos son los pasos correctos:

## ✅ PASO 1: PERFORMANCE PLUGIN (OBLIGATORIO)

### El ÚNICO plugin necesario:
- **Performance Plugin** - [plugins.jenkins.io/performance](https://plugins.jenkins.io/performance)
- ❌ **NO instalar "JMeter Plugin"** - no es necesario

### Instalación:
1. Manage Jenkins → Plugins → Available  
2. Buscar "performance"
3. Instalar "Performance Plugin"
4. Reiniciar Jenkins

## ✅ PASO 2: CONFIGURACIÓN JDK

### En Global Tool Configuration:
- **Name**: `OpenJDK-21`
- **JAVA_HOME**: `/opt/java/openjdk` 
- **❌ DESMARCAR "Install automatically"**

## ✅ PASO 3: JMETER AUTOMÁTICO EN PIPELINE

### JMeter se descarga automáticamente:
```groovy
environment {
    JMETER_VERSION = '5.6.3'
    JMETER_HOME = "/var/jenkins_home/workspace/${env.JOB_NAME}/apache-jmeter-${JMETER_VERSION}"
}
```

### Configuración automática user.properties:
```bash
echo "jmeter.save.saveservice.output_format=xml" >> ${JMETER_HOME}/bin/user.properties
```

### Comando JMeter oficial:
```bash
${JMETER_HOME}/bin/jmeter -j jmeter.save.saveservice.output_format=xml \
    -n -t test-plan.jmx \
    -l results.jtl
```

## ✅ PASO 4: REPORTES CON PERFORMANCE PLUGIN

### Sintaxis correcta perfReport:
```groovy
perfReport sourceDataFiles: "results.jtl",
          compareBuildPrevious: true,
          modePerformancePerTestCase: true,
          configType: 'ART',
          errorFailedThreshold: 5,
          errorUnstableThreshold: 10
```

## 🎯 VENTAJAS DE ESTE ENFOQUE

✅ **Siguiendo documentación oficial Jenkins**
✅ **Performance Plugin integra automáticamente con JMeter**  
✅ **JMeter se descarga automáticamente en cada build**
✅ **Configuración portable entre diferentes entornos**
✅ **Reportes nativos de Jenkins con gráficos**
✅ **Integración completa con pipelines**

## 🚀 PRÓXIMOS PASOS

1. **Verificar Performance Plugin instalado** ✅
2. **Configurar JDK en Global Tool Configuration** 
3. **Crear Pipeline job apuntando a jenkins/Jenkinsfile**
4. **Ejecutar Build with Parameters**
5. **Ver reportes en Performance Trend**

## 📁 ARCHIVOS YA LISTOS

- ✅ `jenkins/Jenkinsfile` - Pipeline completo según documentación oficial
- ✅ `Karting-Load-Testing.jmx` - Plan de pruebas JMeter
- ✅ `Karting-Stress-Testing.jmx` - Plan de pruebas JMeter  
- ✅ `Karting-Volume-Testing.jmx` - Plan de pruebas JMeter

## 🔗 REFERENCIAS

- [Jenkins + JMeter Official Documentation](https://www.jenkins.io/doc/book/using/using-jmeter-with-jenkins/)
- [Performance Plugin](https://plugins.jenkins.io/performance)
- [Apache JMeter](https://jmeter.apache.org/)

---
**Estado actual: READY TO GO** 🚀

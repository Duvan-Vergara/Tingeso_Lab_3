# Configuración Actualizada de SonarQube

## ✅ Cambios Realizados

### 1. Archivo `build.yml` Actualizado
- ✅ Agregado análisis en Pull Requests
- ✅ Configurado `fetch-depth: 0` para mejor análisis
- ✅ Incluido paso para generar cobertura de código con JaCoCo (Backend)
- ✅ **Nuevo: Análisis completo del Frontend React**
- ✅ Actualizado token de SonarQube (`sonar.token` en lugar de `sonar.login`)
- ✅ Agregado `GITHUB_TOKEN` para análisis de PR
- ✅ Incluidos reportes de JUnit y cobertura para Frontend
- ✅ Configuración específica de Java 17 y Node.js 18
- ✅ Jobs separados para Backend, Frontend y análisis completo

### 2. Configuración de Maven (Backend)
- ✅ Actualizado `tariff-service/pom.xml` con:
  - Plugin JaCoCo para cobertura de código
  - Plugin Surefire para reportes de pruebas
  - Plugin SonarQube Scanner

### 3. Configuración de Frontend
- ✅ Actualizado `frontend/package.json` con:
  - Scripts de testing (vitest)
  - Scripts de cobertura
  - Dependencias de testing (@testing-library, vitest)
- ✅ Configurado `vite.config.js` para testing y cobertura
- ✅ Creado archivo `setupTests.js`
- ✅ Ejemplo de prueba en `App.test.jsx`
- ✅ Ya existe `frontend/sonar-project.properties`

### 4. Archivos de Configuración
- ✅ Creado `tariff-service/sonar-project.properties`
- ✅ Script `UPDATE-SONARQUBE-CONFIG.ps1` para automatizar el resto

## 🔧 Pasos Pendientes

### 1. Ejecutar el Script de Configuración
```powershell
.\UPDATE-SONARQUBE-CONFIG.ps1
```

### 2. Actualizar los archivos pom.xml restantes
Para cada microservicio, agregar estos plugins en la sección `<build><plugins>`:

```xml
<!-- Plugin JaCoCo para cobertura de código -->
<plugin>
    <groupId>org.jacoco</groupId>
    <artifactId>jacoco-maven-plugin</artifactId>
    <version>0.8.8</version>
    <executions>
        <execution>
            <goals>
                <goal>prepare-agent</goal>
            </goals>
        </execution>
        <execution>
            <id>report</id>
            <phase>test</phase>
            <goals>
                <goal>report</goal>
            </goals>
        </execution>
    </executions>
</plugin>

<!-- Plugin Surefire para reportes de pruebas -->
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-surefire-plugin</artifactId>
    <version>3.0.0-M7</version>
    <configuration>
        <includes>
            <include>**/*Test.java</include>
            <include>**/*Tests.java</include>
        </includes>
    </configuration>
</plugin>

<!-- Plugin SonarQube Scanner -->
<plugin>
    <groupId>org.sonarsource.scanner.maven</groupId>
    <artifactId>sonar-maven-plugin</artifactId>
    <version>3.9.1.2184</version>
</plugin>
```

### 3. Configurar Secretos en GitHub
En tu repositorio de GitHub, ve a **Settings** > **Secrets and variables** > **Actions** y agrega:

- `SONAR_TOKEN`: Token de tu proyecto SonarQube
- `SONAR_HOST_URL`: URL de tu servidor SonarQube (ej: https://sonarcloud.io)

### 4. Instalar dependencias del Frontend
```bash
cd frontend
npm install
```

### 5. Ejecutar Pruebas Locales

**Backend:**
```bash
# Para probar un microservicio específico
cd backend/tariff-service
mvn clean compile test jacoco:report

# Verificar que se generen los reportes
ls target/site/jacoco/
ls target/surefire-reports/
```

**Frontend:**
```bash
cd frontend
npm run test:coverage
npm run lint

# Verificar que se generen los reportes
ls coverage/
```

## 📊 Beneficios de la Nueva Configuración

1. **Cobertura de Código Completa**: 
   - JaCoCo para Backend (Java)
   - Vitest + V8 para Frontend (JavaScript/React)
2. **Análisis de PR**: Comentarios automáticos en Pull Requests
3. **Mejor Caché**: Optimización de tiempos de build
4. **Reportes Integrados**: 
   - JUnit para Backend
   - Vitest para Frontend
5. **Quality Gates**: Verificación automática de calidad
6. **Configuración por Tecnología**: Específica para Java y React
7. **ESLint Integration**: Análisis de código JavaScript

## 🚀 Resultado Final

Una vez completados estos pasos, tendrás:
- ✅ **Análisis automatizado** de Backend (Java/Spring Boot)
- ✅ **Análisis automatizado** de Frontend (React/Vite)
- ✅ **Reportes de cobertura** para ambas tecnologías
- ✅ **Integración completa** con GitHub Actions
- ✅ **Quality Gates automáticos** para todo el stack
- ✅ **Configuración específica** por microservicio y frontend

## 🎯 Estructura Final de Análisis

```
SonarQube Analysis
├── Backend (10 microservicios)
│   ├── config-service
│   ├── eureka-service
│   ├── gateway-service
│   ├── tariff-service
│   ├── discount-people-service
│   ├── discount-frequent-service
│   ├── special-rates-service
│   ├── reserve-service
│   ├── rack-service
│   └── reports-service
├── Frontend (React/Vite)
│   ├── Análisis de código JavaScript
│   ├── ESLint integration
│   ├── Cobertura de pruebas
│   └── Quality metrics
└── Proyecto Completo
    ├── Quality Gate general
    └── Reportes consolidados
```

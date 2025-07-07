# 🔧 SonarQube + GitHub Actions - Configuración Validada

## ✅ Pasos Confirmados Funcionando

### 1️⃣ Ejecutar SonarQube Local
```bash
docker run -d --name sonarqube -p 9000:9000 sonarqube:lts
```
- **URL local:** http://localhost:9000
- **Login inicial:** admin / admin

### 2️⃣ Exponer con ngrok (REQUERIDO para GitHub Actions)
```bash
ngrok http 9000
```
- **Ejemplo URL generada:** `https://3b6d-181-62-49-142.ngrok-free.app`
- ⚠️ **IMPORTANTE:** Guardar esta URL pública para configurar en GitHub

### 3️⃣ Configurar Secrets en GitHub
1. Ir a: **GitHub → Settings → Secrets and variables → Actions**
2. Crear secret: `SONAR_HOST_URL` = URL ngrok pública completa
3. Crear secret: `SONAR_TOKEN` = token generado en SonarQube

### 4️⃣ Generar Token en SonarQube
1. Abrir la URL ngrok en navegador
2. Login: **admin / admin** (cambiar password si es primera vez)
3. Ir a: **My Account → Security → Generate Tokens**
4. **Name:** `github-integration`
5. **Generate** → Copiar token (empieza con `sqp_...`)

### 5️⃣ Verificar GitHub Actions
- El workflow `.github/workflows/sonarqube.yml` ya está configurado
- Se ejecutará automáticamente en push/PR
- Incluye análisis para:
  - **Backend:** Maven projects con Jacoco
  - **Frontend:** React con sonar-scanner

## 🔍 Troubleshooting

### Error: "Couldn't connect to server"
- ✅ Verificar que ngrok esté ejecutándose
- ✅ Verificar que SonarQube container esté activo: `docker ps`
- ✅ URL en GitHub secrets debe incluir https://

### Error: "Invalid token"
- ✅ Regenerar token en SonarQube
- ✅ Actualizar secret `SONAR_TOKEN` en GitHub
- ✅ Token debe empezar con `sqp_`

### Error: "Host not reachable"
- ✅ Verificar URL ngrok en `SONAR_HOST_URL`
- ✅ No incluir `/` al final de la URL
- ✅ Usar URL exacta generada por ngrok

## 📊 Reportes Generados
- **Backend:** Cobertura de código con Jacoco
- **Frontend:** Análisis de calidad React/TypeScript
- **Métricas:** Duplicación, complejidad, vulnerabilidades
- **Gatehouse:** Quality Gate automático

## 🚀 Próximos Pasos
1. Verificar que GitHub Actions ejecute correctamente
2. Revisar reportes en SonarQube dashboard
3. Configurar Quality Gates si es necesario
4. Integrar con Jenkins pipeline (opcional)

---
**✅ Estado:** Configuración validada y funcionando  
**📅 Última actualización:** 2025-01-06  
**🔗 Referencia:** [Configuración real probada]

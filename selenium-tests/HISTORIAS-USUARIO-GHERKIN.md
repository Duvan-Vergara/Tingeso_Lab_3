# 📋 HISTORIAS DE USUARIO - SISTEMA KARTING
## Pruebas Funcionales RF5, RF7, RF8 (Rúbrica 20%)

Este documento define **15 Historias de Usuario** (5 por cada RF) usando **lenguaje Gherkin**. De estas, **8 están automatizadas** con Selenium IDE (53.3% > 50% requerido).

---

## 🎯 RF5 - REGISTRO DE RESERVAS

### HU001: Registro exitoso de reserva ✅ AUTOMATIZADA
**Como** cliente del karting  
**Quiero** registrar una reserva para usar las instalaciones  
**Para** asegurar mi tiempo de uso de la pista  

**Escenario:** Registro exitoso con datos válidos
```gherkin
Dado que el cliente está en la página de registro de reservas
Cuando completa todos los campos obligatorios:
  | Campo       | Valor               |
  | Nombre      | Juan Pérez Test     |
  | Fecha       | 2025-07-20          |
  | Hora inicio | 15:00               |
  | Tarifa      | Estándar            |
Y hace clic en "Registrar Reserva"
Entonces debe ver el mensaje "Reserva registrada exitosamente"
Y debe recibir un número de confirmación
```

### HU002: Validación de campos obligatorios ✅ AUTOMATIZADA
**Como** administrador del sistema  
**Quiero** validar que se ingresen todos los datos requeridos  
**Para** garantizar información correcta en las reservas  

**Escenario:** Validación de campos vacíos
```gherkin
Dado que el administrador está en el formulario de reservas
Cuando intenta enviar el formulario sin completar campos obligatorios
Entonces debe ver mensajes de error para cada campo requerido:
  | Campo       | Mensaje                    |
  | Nombre      | "Nombre es obligatorio"    |
  | Fecha       | "Fecha es requerida"       |
  | Hora        | "Hora es obligatoria"      |
Y el formulario no debe enviarse
```

### HU003: Cálculo automático de precios ✅ AUTOMATIZADA
**Como** cliente  
**Quiero** ver el cálculo automático del precio  
**Para** conocer el costo antes de confirmar la reserva  

**Escenario:** Cálculo según tarifa seleccionada
```gherkin
Dado que el cliente está completando una reserva
Cuando selecciona una tarifa específica
Entonces debe ver el precio calculado automáticamente
Y el precio debe corresponder a la tarifa elegida
Y debe mostrarse el desglose de costos
```

### HU004: Edición de reservas ⚪ MANUAL
**Como** cliente  
**Quiero** poder modificar mi reserva  
**Para** ajustar horarios según mi disponibilidad  

**Escenario:** Modificación exitosa dentro del plazo permitido
```gherkin
Dado que el cliente tiene una reserva confirmada
Y la reserva está dentro del plazo de modificación (24h antes)
Cuando accede a "Mis Reservas" y selecciona "Editar"
Y modifica la hora de inicio de 15:00 a 16:00
Entonces debe ver "Reserva modificada exitosamente"
Y debe recibir nueva confirmación por email
```

### HU005: Cancelación de reservas ⚪ MANUAL
**Como** cliente  
**Quiero** cancelar mi reserva  
**Para** liberar el espacio si no puedo asistir  

**Escenario:** Cancelación con reembolso
```gherkin
Dado que el cliente tiene una reserva confirmada
Y la cancelación se hace con más de 24h de anticipación
Cuando selecciona "Cancelar Reserva" y confirma
Entonces debe ver "Reserva cancelada exitosamente"
Y debe procesarse el reembolso correspondiente
```

---

## 🎯 RF7 - RACK SEMANAL DE OCUPACIÓN

### HU006: Visualización del rack semanal ✅ AUTOMATIZADA
**Como** administrador  
**Quiero** visualizar el rack semanal de ocupación  
**Para** monitorear el uso de las instalaciones  

**Escenario:** Vista completa del rack semanal
```gherkin
Dado que el administrador accede al módulo de rack
Cuando selecciona "Vista Semanal"
Entonces debe ver una grilla con:
  | Elemento    | Detalle                    |
  | Días        | Lunes a Domingo            |
  | Horarios    | 8:00 a 22:00               |
  | Estados     | Libre/Ocupado/Mantenimiento|
  | Colores     | Verde/Rojo/Amarillo        |
```

### HU007: Consulta por fecha específica ✅ AUTOMATIZADA
**Como** operador  
**Quiero** consultar el estado de ocupación por fecha  
**Para** informar disponibilidad a los clientes  

**Escenario:** Búsqueda por fecha específica
```gherkin
Dado que el operador está en el rack semanal
Cuando ingresa una fecha específica "2025-07-20"
Y hace clic en "Consultar"
Entonces debe ver solo la información de ese día
Y debe mostrar horarios disponibles y ocupados
```

### HU008: Filtrado del rack por tipo ⚪ MANUAL
**Como** supervisor  
**Quiero** filtrar el rack por tipo de reserva  
**Para** analizar patrones de uso específicos  

**Escenario:** Filtro por tipo de cliente
```gherkin
Dado que el supervisor está viendo el rack semanal
Cuando selecciona el filtro "Solo Clientes VIP"
Entonces debe mostrar únicamente las reservas de clientes VIP
Y debe mantener la estructura visual del rack
```

### HU009: Exportación de datos del rack ⚪ MANUAL
**Como** gerente  
**Quiero** exportar los datos del rack  
**Para** realizar análisis externos de ocupación  

**Escenario:** Exportación a Excel
```gherkin
Dado que el gerente está viendo el rack semanal
Cuando hace clic en "Exportar a Excel"
Entonces debe descargarse un archivo Excel
Y debe contener todos los datos de ocupación de la semana
```

### HU010: Monitoreo de ocupación en tiempo real ⚪ MANUAL
**Como** operador de pista  
**Quiero** ver actualizaciones en tiempo real  
**Para** gestionar eficientemente las operaciones  

**Escenario:** Actualización automática
```gherkin
Dado que el operador tiene abierta la vista del rack
Cuando se registra una nueva reserva
Entonces el rack debe actualizarse automáticamente
Y debe mostrar el cambio de estado sin recargar la página
```

---

## 🎯 RF8 - REPORTES DE INGRESOS

### HU011: Generación de reportes de ingresos ✅ AUTOMATIZADA
**Como** administrador  
**Quiero** generar reportes de ingresos  
**Para** analizar el rendimiento financiero  

**Escenario:** Reporte mensual de ingresos
```gherkin
Dado que el administrador está en el módulo de reportes
Cuando selecciona:
  | Parámetro    | Valor           |
  | Tipo         | Ingresos        |
  | Período      | Mensual         |
  | Fecha inicio | 2025-07-01      |
  | Fecha fin    | 2025-07-31      |
Y hace clic en "Generar Reporte"
Entonces debe ver un reporte con:
  - Total de ingresos del período
  - Desglose por día
  - Gráficos de tendencias
```

### HU012: Filtrado de reportes por período ✅ AUTOMATIZADA
**Como** gerente  
**Quiero** filtrar reportes por diferentes períodos  
**Para** comparar rendimiento en distintos timeframes  

**Escenario:** Comparación semanal vs mensual
```gherkin
Dado que el gerente está generando un reporte
Cuando selecciona "Período: Semanal"
Entonces debe ver datos agrupados por semanas
Y cuando cambia a "Período: Mensual"
Entonces debe ver los mismos datos agrupados por meses
```

### HU013: Exportación de datos contables ✅ AUTOMATIZADA
**Como** contador  
**Quiero** exportar datos para procesos contables  
**Para** integrar con sistemas de contabilidad externos  

**Escenario:** Exportación formato contable
```gherkin
Dado que el contador ha generado un reporte de ingresos
Cuando hace clic en "Exportar para Contabilidad"
Entonces debe descargarse un archivo Excel
Y debe contener:
  - Códigos de cuenta contable
  - Fechas de transacción
  - Montos con decimales
  - Referencias de reserva
```

### HU014: Análisis por tipo de tarifa ⚪ MANUAL
**Como** analista de negocios  
**Quiero** analizar ingresos por tipo de tarifa  
**Para** optimizar la estrategia de precios  

**Escenario:** Desglose por tarifa
```gherkin
Dado que el analista está en reportes de ingresos
Cuando selecciona "Análisis por Tarifa"
Entonces debe ver:
  | Tarifa      | Ingresos | % Total | Reservas |
  | Estándar    | $500K    | 45%     | 1,200    |
  | Premium     | $400K    | 35%     | 800      |
  | VIP         | $200K    | 20%     | 300      |
```

### HU015: Reportes de tendencias ⚪ MANUAL
**Como** director general  
**Quiero** ver tendencias de ingresos  
**Para** tomar decisiones estratégicas  

**Escenario:** Tendencia anual
```gherkin
Dado que el director está revisando rendimiento anual
Cuando selecciona "Reporte de Tendencias Anuales"
Entonces debe ver:
  - Gráfico de ingresos mensuales
  - Porcentaje de crecimiento/decrecimiento
  - Proyecciones para próximos meses
  - Comparativo con años anteriores
```

---

## 📊 RESUMEN DE AUTOMATIZACIÓN

### ✅ Tests Automatizados (8/15 = 53.3%)
| RF | Historia | Automatizada | Archivo Selenium |
|----|----------|--------------|------------------|
| RF5 | HU001 | ✅ | karting-functional-tests-optimized.side |
| RF5 | HU002 | ✅ | karting-functional-tests-optimized.side |
| RF5 | HU003 | ✅ | karting-functional-tests-optimized.side |
| RF7 | HU006 | ✅ | karting-functional-tests-optimized.side |
| RF7 | HU007 | ✅ | karting-functional-tests-optimized.side |
| RF8 | HU011 | ✅ | karting-functional-tests-optimized.side |
| RF8 | HU012 | ✅ | karting-functional-tests-optimized.side |
| RF8 | HU013 | ✅ | karting-functional-tests-optimized.side |

### ⚪ Tests Manuales (7/15 = 46.7%)
- RF5: HU004, HU005 (Edición y cancelación de reservas)
- RF7: HU008, HU009, HU010 (Filtrado, exportación, tiempo real)
- RF8: HU014, HU015 (Análisis por tarifa, tendencias)

---

## 🚀 EJECUCIÓN DE TESTS

### Prerequisitos
```bash
# Sistema desplegado en Kubernetes
kubectl get pods  # Verificar que todo esté running

# Acceso al frontend
http://localhost:30080
```

### Ejecución Manual
1. Abrir Selenium IDE
2. Cargar archivo: `selenium-tests/karting-functional-tests-optimized.side`
3. Ejecutar suite: "Suite Completa - 8 Tests Automatizados"

### Ejecución en Jenkins
Los tests se ejecutan automáticamente en el pipeline de CI/CD como parte de la validación de funcionalidad.

---

**Cumplimiento Rúbrica:** ✅ 20% - Pruebas Funcionales  
**Tests Definidos:** 15 Historias de Usuario en formato Gherkin  
**Automatización:** 53.3% (>50% requerido)  
**Herramienta:** Selenium IDE  
**Cobertura:** RF5, RF7, RF8 completamente cubiertas

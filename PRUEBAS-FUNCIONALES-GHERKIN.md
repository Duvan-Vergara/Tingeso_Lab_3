# HISTORIAS DE USUARIO Y PRUEBAS FUNCIONALES - SISTEMA KARTING
## RF5, RF7, RF8 - Cumplimiento Rúbrica Laboratorio 3

| Historia de Usuario | Descripción |
|-------------------|-------------|
| HU001 | Como cliente del sistema de karting quiero registrar una nueva reserva para poder usar las instalaciones |
| HU002 | Como administrador quiero validar datos de reservas para garantizar información correcta |
| HU003 | Como cliente quiero ver el cálculo automático de precios para conocer el costo total |
| HU004 | Como usuario quiero editar mis reservas para modificar detalles según mis necesidades |
| HU005 | Como cliente quiero cancelar reservas para liberar espacios cuando no pueda asistir |
| HU006 | Como administrador quiero visualizar el rack semanal para planificar mantenimiento |
| HU007 | Como operador quiero consultar estado por fecha para verificar disponibilidad |
| HU008 | Como administrador quiero filtrar el rack para encontrar información específica |
| HU009 | Como supervisor quiero exportar datos del rack para generar reportes externos |
| HU010 | Como gerente quiero monitorear ocupación para optimizar recursos |
| HU011 | Como administrador quiero generar reportes de ingresos para análisis financiero |
| HU012 | Como gerente quiero filtrar reportes por período para análisis específicos |
| HU013 | Como contador quiero exportar datos de ingresos para procesos contables |
| HU014 | Como administrador quiero validar cálculos de reportes para garantizar exactitud |
| HU015 | Como director quiero acceder a métricas consolidadas para toma de decisiones |

---

## RF5 - REGISTRO DE RESERVAS (5 Historias de Usuario)

### HU001 - Como cliente del sistema de karting quiero registrar una nueva reserva para poder usar las instalaciones

**Criterios de aceptación:**

• **Escenario 1: Registro exitoso de reserva básica (RF5)**
```gherkin
Dado que estoy en la página de "Registrar Reserva"
Y el sistema está disponible
Cuando ingreso los siguientes datos válidos:
  | Campo           | Valor                    |
  | Nombre Cliente  | Juan Pérez              |
  | Fecha Reserva   | 2025-07-15              |
  | Hora Inicio     | 14:00                   |
  | Tarifa          | Tarifa Básica (10 vueltas) |
  | Usuarios        | 2 personas              |
Y hago clic en "Registrar Reserva"
Entonces el sistema debe mostrar el mensaje "Reserva registrada exitosamente"
Y la reserva debe aparecer en la lista de reservas
Y el precio final debe calcularse automáticamente
```

• **Escenario 2: Registro fallido por datos incompletos**
```gherkin
Dado que estoy en la página de "Registrar Reserva"
Cuando dejo campos obligatorios vacíos:
  | Campo Faltante  | Estado |
  | Nombre Cliente  | Vacío  |
  | Fecha Reserva   | Vacío  |
Y hago clic en "Registrar Reserva"
Entonces el sistema debe mostrar mensajes de validación
Y no debe permitir continuar con el registro
Y debe mantener los datos ya ingresados
```

---

### HU002 - Como administrador quiero validar datos de reservas para garantizar información correcta

**Criterios de aceptación:**

• **Escenario 1: Validación exitosa de campos obligatorios**
```gherkin
Dado que estoy registrando una nueva reserva
Cuando ingreso todos los campos requeridos correctamente
Entonces el sistema debe aceptar la información
Y debe proceder con el registro
```

• **Escenario 2: Validación fallida por formato incorrecto**
```gherkin
Dado que estoy en el formulario de reserva
Cuando ingreso datos con formato incorrecto:
  | Campo     | Valor Incorrecto | Error Esperado |
  | Email     | email-inválido   | "Formato de email inválido" |
  | Teléfono  | abc123          | "Solo números permitidos" |
Entonces el sistema debe mostrar mensajes de error específicos
Y no debe permitir el envío del formulario
```

---

### HU003 - Como cliente quiero ver el cálculo automático de precios para conocer el costo total

**Criterios de aceptación:**

• **Escenario 1: Cálculo correcto con descuentos aplicables**
```gherkin
Dado que estoy configurando una reserva
Cuando selecciono:
  | Campo           | Valor                    |
  | Tarifa          | Tarifa Premium (15 vueltas) |
  | Usuarios        | 4 personas (descuento 10%) |
  | Día Especial    | Sí (descuento adicional 5%) |
Entonces el sistema debe calcular automáticamente:
  | Concepto              | Valor    |
  | Precio Base           | $50.000  |
  | Descuento Personas    | -$5.000  |
  | Descuento Día Especial| -$2.250  |
  | Precio Final          | $42.750  |
Y debe mostrar el desglose completo del cálculo
```

---

### HU004 - Como usuario quiero editar mis reservas para modificar detalles según mis necesidades

**Criterios de aceptación:**

• **Escenario 1: Edición exitosa de reserva existente**
```gherkin
Dado que existe una reserva:
  | ID    | Cliente     | Fecha      | Estado    |
  | R001  | María López | 2025-07-20 | Pendiente |
Y estoy en la lista de reservas
Cuando hago clic en "Editar" para la reserva R001
Y modifico los datos:
  | Campo           | Valor Original | Valor Nuevo     |
  | Hora Inicio     | 14:00         | 16:00          |
  | Usuarios        | 2 personas    | 3 personas     |
Y hago clic en "Actualizar Reserva"
Entonces el sistema debe actualizar la reserva
Y debe recalcular el precio automáticamente
Y debe mostrar "Reserva actualizada exitosamente"
```

---

### HU005 - Como cliente quiero cancelar reservas para liberar espacios cuando no pueda asistir

**Criterios de aceptación:**

• **Escenario 1: Cancelación exitosa con confirmación**
```gherkin
Dado que existe una reserva confirmada:
  | ID    | Cliente      | Fecha      | Estado    |
  | R002  | Carlos Ruiz  | 2025-07-25 | Confirmada|
Y estoy en la lista de reservas
Cuando hago clic en "Cancelar" para la reserva R002
Entonces el sistema debe mostrar un diálogo de confirmación
Cuando confirmo la cancelación
Entonces la reserva debe cambiar a estado "Cancelada"
Y debe mostrar "Reserva cancelada exitosamente"
Y debe enviar notificación al cliente
```

---

## RF7 - RACK SEMANAL (5 Historias de Usuario)

### HU006 - Como administrador quiero visualizar el rack semanal para planificar mantenimiento

**Criterios de aceptación:**

• **Escenario 1: Visualización exitosa del rack semanal completo**
```gherkin
Dado que estoy en la página de "Rack Semanal"
Y hay karts registrados en el sistema
Cuando selecciono la semana actual
Entonces el sistema debe mostrar:
  | Información          | Detalle                           |
  | Días de la semana    | Lunes a Domingo                  |
  | Estados de karts     | Disponible, En Uso, Mantenimiento|
  | Colores diferenciados| Verde, Rojo, Amarillo            |
  | Total karts          | Número total por día             |
Y debe actualizar la información en tiempo real
```

---

### HU007 - Como operador quiero consultar estado por fecha para verificar disponibilidad

**Criterios de aceptación:**

• **Escenario 1: Consulta exitosa por fecha específica**
```gherkin
Dado que estoy en la página de "Rack Semanal"
Cuando selecciono una fecha específica "2025-07-15"
Y hago clic en "Consultar"
Entonces el sistema debe mostrar:
  | Kart ID | Estado        | Hora Última Revisión | Observaciones    |
  | K001    | Disponible    | 08:00               | Sin observaciones |
  | K002    | En Uso        | 14:30               | Reserva activa    |
  | K003    | Mantenimiento | 10:00               | Revisión mensual  |
Y debe permitir filtrar por estado
```

• **Escenario 2: Consulta fallida por fecha inválida**
```gherkin
Dado que estoy en el formulario de consulta
Cuando ingreso una fecha inválida o futura más de 30 días
Y hago clic en "Consultar"
Entonces el sistema debe mostrar "Fecha no válida para consulta"
Y debe mantener la vista anterior
```

---

### HU008 - Como administrador quiero filtrar el rack para encontrar información específica

**Criterios de aceptación:**

• **Escenario 1: Filtrado exitoso por estado de kart**
```gherkin
Dado que estoy viendo el rack semanal
Cuando aplico filtro por estado "Mantenimiento"
Entonces el sistema debe mostrar solo los karts en mantenimiento
Y debe indicar el total de karts filtrados
Y debe permitir limpiar el filtro para ver todos
```

---

### HU009 - Como supervisor quiero exportar datos del rack para generar reportes externos

**Criterios de aceptación:**

• **Escenario 1: Exportación exitosa de datos del rack**
```gherkin
Dado que estoy viendo datos del rack semanal
Cuando hago clic en "Exportar a Excel"
Entonces el sistema debe generar un archivo Excel
Y debe incluir todos los datos visibles en pantalla
Y debe descargar automáticamente el archivo
```

---

### HU010 - Como gerente quiero monitorear ocupación para optimizar recursos

**Criterios de aceptación:**

• **Escenario 1: Monitoreo exitoso de ocupación en tiempo real**
```gherkin
Dado que estoy en el dashboard de rack
Cuando selecciono "Vista de Ocupación"
Entonces el sistema debe mostrar:
  | Métrica              | Valor en tiempo real |
  | Karts disponibles    | Número actual        |
  | Karts en uso         | Número actual        |
  | Porcentaje ocupación | Cálculo automático   |
Y debe actualizar cada 30 segundos
```

---

## RF8 - REPORTES DE INGRESOS (5 Historias de Usuario)

### HU011 - Como administrador quiero generar reportes de ingresos para análisis financiero

**Criterios de aceptación:**

• **Escenario 1: Generación exitosa de reporte mensual**
```gherkin
Dado que estoy en la página de "Generar Reportes"
Cuando selecciono:
  | Campo        | Valor      |
  | Tipo Reporte | Ingresos   |
  | Período      | Mensual    |
  | Mes          | Julio 2025 |
Y hago clic en "Generar Reporte"
Entonces el sistema debe mostrar:
  | Información       | Detalle              |
  | Total ingresos    | Suma total del mes   |
  | Reservas          | Número de reservas   |
  | Promedio diario   | Cálculo automático   |
  | Gráfico temporal  | Visualización de datos|
```

---

### HU012 - Como gerente quiero filtrar reportes por período para análisis específicos

**Criterios de aceptación:**

• **Escenario 1: Filtrado exitoso por rango de fechas personalizado**
```gherkin
Dado que estoy configurando un reporte
Cuando selecciono:
  | Campo        | Valor        |
  | Fecha Inicio | 2025-07-01   |
  | Fecha Fin    | 2025-07-15   |
  | Tipo         | Detallado    |
Y hago clic en "Aplicar Filtro"
Entonces el sistema debe mostrar datos solo del período seleccionado
Y debe recalcular todas las métricas
Y debe actualizar gráficos correspondientes
```

---

### HU013 - Como contador quiero exportar datos de ingresos para procesos contables

**Criterios de aceptación:**

• **Escenario 1: Exportación exitosa en formato Excel**
```gherkin
Dado que tengo un reporte de ingresos generado
Cuando hago clic en "Exportar a Excel"
Entonces el sistema debe generar archivo con:
  | Contenido         | Formato           |
  | Datos tabulados   | Formato Excel     |
  | Gráficos          | Incluidos         |
  | Resumen ejecutivo | Hoja separada     |
Y debe descargar automáticamente
```

---

### HU014 - Como administrador quiero validar cálculos de reportes para garantizar exactitud

**Criterios de aceptación:**

• **Escenario 1: Validación exitosa de cálculos automáticos**
```gherkin
Dado que estoy revisando un reporte generado
Cuando comparo totales mostrados con datos base
Entonces todos los cálculos deben ser exactos
Y debe mostrar fórmulas utilizadas si se solicita
Y debe permitir audit trail de los datos
```

---

### HU015 - Como director quiero acceder a métricas consolidadas para toma de decisiones

**Criterios de aceptación:**

• **Escenario 1: Dashboard ejecutivo con métricas clave**
```gherkin
Dado que accedo al dashboard ejecutivo
Cuando selecciono "Vista Consolidada"
Entonces el sistema debe mostrar:
  | Métrica KPI          | Período    | Visualización |
  | Ingresos totales     | Último mes | Gráfico barras|
  | Tendencia crecimiento| 6 meses    | Línea temporal|
  | Comparativa períodos | Año actual | Tabla comparativa|
Y debe permitir drill-down en cada métrica
```

---

## 🤖 MAPEO A PRUEBAS SELENIUM AUTOMATIZADAS

### Archivo Principal: `selenium-tests/historias-usuario-automatizadas.side`

| Historia Usuario | Escenario Automatizado | Test ID | Estado |
|-----------------|------------------------|---------|---------|
| **HU001** | Registro exitoso de reserva básica | `hu001-registro-reserva-exitoso` | ✅ Automatizado |
| **HU002** | Validación de campos obligatorios | `hu002-validacion-campos-obligatorios` | ✅ Automatizado |
| **HU003** | Cálculo automático de precios | `hu003-calculo-automatico-precios` | ✅ Automatizado |
| **HU006** | Visualización rack semanal completo | `hu006-visualizacion-rack-semanal` | ✅ Automatizado |
| **HU007** | Consulta estado por fecha específica | `hu007-consulta-estado-por-fecha` | ✅ Automatizado |
| **HU011** | Generación reporte de ingresos | `hu011-generacion-reporte-ingresos` | ✅ Automatizado |
| **HU012** | Filtrado de reportes por período | `hu012-filtrado-reportes-periodo` | ✅ Automatizado |
| **HU013** | Exportación datos a Excel | `hu013-exportacion-datos-excel` | ✅ Automatizado |

**📊 COBERTURA DE AUTOMATIZACIÓN:**
- **Total Historias Usuario:** 15
- **Historias Automatizadas:** 8
- **Porcentaje Automatización:** 53.3%
- **✅ Cumple requisito:** >50% automatización

### Criterios de Selección para Automatización:
1. **Flujos críticos de negocio** (RF5 - Reservas)
2. **Funcionalidades más utilizadas** (RF7 - Rack semanal)
3. **Operaciones complejas** (RF8 - Reportes y exportación)
4. **Validaciones de datos** (Formularios y cálculos)

#### Prueba Funcional RF7-01: Visualización de rack semanal actual
**Funcionalidad:** Mostrar el estado de los karts para la semana actual
**Escenario:** El usuario puede ver el rack completo de la semana

```gherkin
Característica: Rack Semanal
  Como administrador del sistema
  Quiero visualizar el estado de todos los karts durante la semana
  Para planificar mantenimiento y disponibilidad

Escenario: Visualización de rack semanal actual
  Dado que estoy en la página de "Rack Semanal"
  Y hay karts registrados en el sistema
  Cuando selecciono la semana actual
  Entonces el sistema debe mostrar:
    | Información          | Detalle                           |
    | Días de la semana    | Lunes a Domingo                  |
    | Estados de karts     | Disponible, En Uso, Mantenimiento|
    | Colores diferenciados| Verde, Rojo, Amarillo            |
    | Total karts          | Número total por día             |
  Y debe actualizar en tiempo real
```

#### Prueba Funcional RF7-02: Filtrado por fecha específica
**Funcionalidad:** Consultar rack para una fecha específica
**Escenario:** El usuario puede ver el estado de los karts en una fecha particular

```gherkin
Escenario: Filtrado por fecha específica
  Dado que estoy en la página de "Rack Semanal"
  Cuando selecciono una fecha específica "2025-07-15"
  Y hago clic en "Consultar"
  Entonces el sistema debe mostrar:
    | Kart ID | Estado        | Hora Última Revisión | Observaciones    |
    | K001    | Disponible    | 08:00               | Sin observaciones |
    | K002    | En Uso        | 14:30               | Reserva activa    |
    | K003    | Mantenimiento | 12:00               | Cambio de aceite  |
  Y debe indicar el porcentaje de disponibilidad
```

#### Prueba Funcional RF7-03: Cambio de estado de kart
**Funcionalidad:** Modificar el estado de un kart específico
**Escenario:** El administrador puede cambiar el estado de disponibilidad

```gherkin
Escenario: Cambio de estado de kart
  Dado que estoy viendo el rack para "2025-07-15"
  Y existe un kart K001 en estado "Disponible"
  Cuando hago clic en el kart K001
  Y selecciono "Cambiar a Mantenimiento"
  Y agrego la observación "Revisión programada"
  Y confirmo el cambio
  Entonces el kart K001 debe cambiar a estado "Mantenimiento"
  Y debe aparecer con color amarillo
  Y debe registrar la hora del cambio
  Y debe mostrar la observación ingresada
```

#### Prueba Funcional RF7-04: Generación de reporte semanal
**Funcionalidad:** Generar reporte del estado semanal de karts
**Escenario:** El sistema genera un resumen de utilización semanal

```gherkin
Escenario: Generación de reporte semanal
  Dado que estoy en la página de "Rack Semanal"
  Cuando selecciono el rango "Semana del 14 al 20 de Julio 2025"
  Y hago clic en "Generar Reporte Semanal"
  Entonces el sistema debe generar un reporte con:
    | Métrica                    | Valor Esperado |
    | Promedio disponibilidad    | 85%           |
    | Karts en mantenimiento     | 2 unidades    |
    | Horas de uso total         | 120 horas     |
    | Kart más utilizado         | K005          |
    | Días de mayor demanda      | Viernes-Sábado|
  Y debe permitir exportar a PDF
```

#### Prueba Funcional RF7-05: Navegación entre semanas
**Funcionalidad:** Navegar entre diferentes semanas del año
**Escenario:** El usuario puede consultar semanas anteriores y futuras

```gherkin
Escenario: Navegación entre semanas
  Dado que estoy viendo la semana actual en el rack
  Cuando hago clic en "Semana Anterior"
  Entonces debe mostrar la semana del 7 al 13 de Julio
  Y debe mantener el formato de visualización
  Cuando hago clic en "Semana Siguiente" dos veces
  Entonces debe mostrar la semana del 21 al 27 de Julio
  Y debe indicar claramente las fechas mostradas
  Y debe deshabilitar navegación a futuro más allá de 4 semanas
```

---

### RF8 - REPORTES (5 Pruebas Funcionales)

#### Prueba Funcional RF8-01: Generación de reporte por tarifas
**Funcionalidad:** Generar reporte de reservas agrupadas por tipo de tarifa
**Escenario:** El administrador puede ver estadísticas de uso por tarifa

```gherkin
Característica: Reportes del Sistema
  Como administrador
  Quiero generar reportes detallados del sistema
  Para tomar decisiones basadas en datos de uso

Escenario: Generación de reporte por tarifas
  Dado que estoy en la página de "Reportes"
  Y existen reservas registradas en el último mes
  Cuando selecciono "Reporte por Tarifas"
  Y selecciono el período "Julio 2025"
  Y hago clic en "Generar Reporte"
  Entonces el sistema debe mostrar:
    | Tarifa              | Reservas | Ingresos  | Porcentaje |
    | Básica (10 vueltas) | 45       | $1.350.000| 35%       |
    | Premium (15 vueltas)| 30       | $1.500.000| 40%       |
    | VIP (20 vueltas)    | 15       | $750.000  | 25%       |
  Y debe incluir gráfico de barras
  Y debe permitir exportar a Excel
```

#### Prueba Funcional RF8-02: Reporte por tamaño de grupo
**Funcionalidad:** Analizar reservas según número de participantes
**Escenario:** Generar estadísticas de reservas por tamaño de grupo

```gherkin
Escenario: Reporte por tamaño de grupo
  Dado que estoy en la página de "Reportes"
  Cuando selecciono "Reporte por Tamaño de Grupo"
  Y selecciono el período "Último trimestre"
  Y hago clic en "Generar"
  Entonces el sistema debe mostrar:
    | Tamaño Grupo | Cantidad Reservas | Ingreso Promedio | Descuento Aplicado |
    | 1 persona    | 20               | $25.000         | 0%                |
    | 2-3 personas | 35               | $40.000         | 5%                |
    | 4-5 personas | 25               | $55.000         | 10%               |
    | 6+ personas  | 10               | $70.000         | 15%               |
  Y debe mostrar gráfico circular
  Y debe calcular ingresos totales por categoría
```

#### Prueba Funcional RF8-03: Reporte de utilización por fecha
**Funcionalidad:** Mostrar patrones de uso por días y horarios
**Escenario:** Analizar tendencias de reservas por períodos temporales

```gherkin
Escenario: Reporte de utilización por fecha
  Dado que estoy en la página de "Reportes"
  Cuando selecciono "Reporte de Utilización"
  Y configuro los parámetros:
    | Período      | Últimos 30 días |
    | Agrupación   | Por día semana  |
    | Horario      | Todo el día     |
  Y genero el reporte
  Entonces debe mostrar:
    | Día Semana | Reservas | Utilización | Horario Peak    |
    | Lunes      | 8        | 45%        | 15:00-17:00    |
    | Viernes    | 15       | 85%        | 17:00-20:00    |
    | Sábado     | 18       | 95%        | 14:00-19:00    |
  Y debe incluir gráfico de líneas temporales
```

#### Prueba Funcional RF8-04: Reporte financiero mensual
**Funcionalidad:** Generar resumen financiero del período seleccionado
**Escenario:** Obtener métricas financieras para análisis de negocio

```gherkin
Escenario: Reporte financiero mensual
  Dado que estoy en la página de "Reportes"
  Cuando selecciono "Reporte Financiero"
  Y selecciono "Julio 2025"
  Y incluyo las opciones:
    | Opción              | Seleccionado |
    | Incluir descuentos  | Sí          |
    | Agrupar por semana  | Sí          |
    | Comparar mes anterior| Sí          |
  Entonces el reporte debe contener:
    | Métrica                | Valor        | Variación vs Mes Anterior |
    | Ingresos Brutos        | $4.500.000  | +12%                     |
    | Descuentos Aplicados   | $450.000    | +5%                      |
    | Ingresos Netos         | $4.050.000  | +15%                     |
    | Reservas Totales       | 90          | +8%                      |
    | Ticket Promedio        | $45.000     | +7%                      |
```

#### Prueba Funcional RF8-05: Exportación de reportes
**Funcionalidad:** Exportar reportes en diferentes formatos
**Escenario:** El usuario puede descargar reportes en múltiples formatos

```gherkin
Escenario: Exportación de reportes
  Dado que he generado un "Reporte por Tarifas"
  Y el reporte muestra datos válidos
  Cuando hago clic en "Exportar"
  Entonces debo ver las opciones:
    | Formato | Descripción                    |
    | PDF     | Documento con gráficos        |
    | Excel   | Hoja de cálculo con datos     |
    | CSV     | Datos separados por comas     |
  Cuando selecciono "PDF" y confirmo
  Entonces debe descargar un archivo PDF
  Y el archivo debe contener todos los datos del reporte
  Y debe incluir fecha de generación
  Y debe mantener el formato visual
```

---

## AUTOMATIZACIÓN REQUERIDA (50% de las pruebas)

**Total pruebas definidas:** 15 (5 por cada RF)
**Pruebas a automatizar (50%):** 8 pruebas mínimo

### Pruebas Seleccionadas para Automatización:
1. **RF5-01:** Registro exitoso de reserva básica ✅
2. **RF5-02:** Validación de campos obligatorios ✅
3. **RF7-01:** Visualización de rack semanal actual ✅
4. **RF7-02:** Filtrado por fecha específica ✅
5. **RF8-01:** Generación de reporte por tarifas ✅
6. **RF8-02:** Reporte por tamaño de grupo ✅
7. **RF5-04:** Edición de reserva existente ✅
8. **RF7-03:** Cambio de estado de kart ✅

*Total automatizadas: 8/15 = 53.3% ✅*

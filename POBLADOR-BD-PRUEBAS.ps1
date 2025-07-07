# ============================================================================================================
# POBLADOR DE BASE DE DATOS PARA PRUEBAS REALES
# ============================================================================================================
# Este script pobla la BD con datos realistas para pruebas de rendimiento:
# - RF5: Reservas con diferentes volúmenes
# - RF7: Rack semanal con diferentes semanas y años
# - RF8: Reportes con histórico suficiente
# ============================================================================================================

param(
    [string]$ScenarioType = "ALL",  # ALL, LOAD, STRESS, VOLUME
    [int]$BaseReservations = 1000,
    [int]$WeeksHistorical = 52,
    [switch]$Force = $false
)

function Write-Step {
    param([string]$Message, [string]$Type = "INFO")
    $timestamp = Get-Date -Format "HH:mm:ss"
    switch ($Type) {
        "SUCCESS" { Write-Host "[$timestamp] ✅ $Message" -ForegroundColor Green }
        "ERROR"   { Write-Host "[$timestamp] ❌ $Message" -ForegroundColor Red }
        "WARNING" { Write-Host "[$timestamp] ⚠️ $Message" -ForegroundColor Yellow }
        "INFO"    { Write-Host "[$timestamp] ℹ️ $Message" -ForegroundColor White }
    }
}

function Generate-PopulationSQL {
    param([string]$Scenario, [int]$ReservationCount, [int]$WeeksBack)
    
    Write-Step "Generando SQL para escenario: $Scenario ($ReservationCount reservas, $WeeksBack semanas)"
    
    $sqlContent = @"
-- ============================================================================================================
-- POBLACIÓN DE BD PARA PRUEBAS DE RENDIMIENTO - ESCENARIO: $Scenario
-- ============================================================================================================
-- Generado automáticamente: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
-- Reservas: $ReservationCount
-- Semanas históricas: $WeeksBack
-- ============================================================================================================

USE karting_db;

-- Limpiar datos anteriores si es necesario
DELETE FROM reserves WHERE id > 0;
DELETE FROM frequent_customer WHERE id > 0;
DELETE FROM people_discount WHERE id > 0;

-- ============================================================================================================
-- DATOS PARA RF5: REGISTRO DE RESERVAS
-- ============================================================================================================

-- Insertar reservas con diferentes estados y fechas
"@

    # Generar reservas realistas
    for ($i = 1; $i -le $ReservationCount; $i++) {
        $daysBack = Get-Random -Minimum 0 -Maximum ($WeeksBack * 7)
        $reserveDate = (Get-Date).AddDays(-$daysBack).ToString("yyyy-MM-dd")
        $reserveTime = "{0:D2}:{1:D2}:00" -f (Get-Random -Minimum 8 -Maximum 20), (Get-Random -Minimum 0 -Maximum 59)
        
        $customerName = "Cliente$i"
        $customerEmail = "cliente$i@test.com"
        $customerRut = "1{0:D7}-{1}" -f $i, (Get-Random -Minimum 0 -Maximum 9)
        
        # Diferentes tipos de reservas
        $karts = Get-Random -Minimum 1 -Maximum 8
        $minutes = @(15, 30, 45, 60) | Get-Random
        $totalCost = $karts * $minutes * 25  # Tarifa base
        
        # Estado aleatorio pero realista
        $status = if ((Get-Random -Minimum 1 -Maximum 100) -le 85) { "CONFIRMED" } else { "CANCELLED" }
        
        $sqlContent += @"

INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES ($i, '$customerName', '$customerEmail', '$customerRut', '$reserveDate', '$reserveTime', $karts, $minutes, $totalCost, '$status', NOW(), NOW());
"@
    }

    # Datos para descuentos por frecuencia
    $sqlContent += @"

-- ============================================================================================================
-- DATOS PARA DESCUENTOS POR FRECUENCIA
-- ============================================================================================================

"@
    
    $frequentCustomers = [math]::Min(100, $ReservationCount / 10)
    for ($i = 1; $i -le $frequentCustomers; $i++) {
        $customerRut = "1{0:D7}-{1}" -f $i, (Get-Random -Minimum 0 -Maximum 9)
        $reservations = Get-Random -Minimum 5 -Maximum 20
        $discount = switch ($reservations) {
            {$_ -ge 15} { 15 }
            {$_ -ge 10} { 10 }
            {$_ -ge 5} { 5 }
            default { 0 }
        }
        
        $sqlContent += @"
INSERT INTO frequent_customer (id, customer_rut, total_reservations, discount_percentage, last_updated)
VALUES ($i, '$customerRut', $reservations, $discount, NOW());
"@
    }

    # Datos para descuentos por personas
    $sqlContent += @"

-- ============================================================================================================
-- DATOS PARA DESCUENTOS POR CANTIDAD DE PERSONAS
-- ============================================================================================================

"@
    
    $peopleDiscounts = @(
        @{ MinPeople = 5; MaxPeople = 9; Discount = 10 },
        @{ MinPeople = 10; MaxPeople = 15; Discount = 15 },
        @{ MinPeople = 16; MaxPeople = 99; Discount = 20 }
    )
    
    $discountId = 1
    foreach ($discount in $peopleDiscounts) {
        $sqlContent += @"
INSERT INTO people_discount (id, min_people, max_people, discount_percentage, is_active, created_at)
VALUES ($discountId, $($discount.MinPeople), $($discount.MaxPeople), $($discount.Discount), true, NOW());
"@
        $discountId++
    }

    # Datos adicionales para RF7 (Rack Semanal) y RF8 (Reportes)
    $sqlContent += @"

-- ============================================================================================================
-- DATOS ADICIONALES PARA RF7 (RACK SEMANAL) Y RF8 (REPORTES)
-- ============================================================================================================

-- Insertar reservas distribuidas por diferentes semanas para rack semanal
"@

    # Generar datos específicos para rack semanal (diferentes semanas)
    $currentWeek = Get-Date
    for ($week = 0; $week -lt $WeeksBack; $week++) {
        $weekDate = $currentWeek.AddDays(-($week * 7))
        $weekStart = $weekDate.AddDays(-(([int]$weekDate.DayOfWeek) - 1))
        
        # 3-8 reservas por semana
        $weeklyReservations = Get-Random -Minimum 3 -Maximum 8
        
        for ($day = 0; $day -lt 7; $day++) {
            if ($day -lt $weeklyReservations) {
                $reserveDate = $weekStart.AddDays($day).ToString("yyyy-MM-dd")
                $reserveTime = "{0:D2}:00:00" -f (Get-Random -Minimum 9 -Maximum 18)
                $karts = Get-Random -Minimum 1 -Maximum 6
                $minutes = @(30, 45, 60) | Get-Random
                $cost = $karts * $minutes * 25
                
                $reserveId = $ReservationCount + ($week * 10) + $day + 1
                
                $sqlContent += @"

INSERT INTO reserves (id, customer_name, customer_email, customer_rut, reserve_date, reserve_time, karts_count, minutes, total_cost, status, created_at, updated_at)
VALUES ($reserveId, 'ClienteW$week-D$day', 'cliente.w$week.d$day@test.com', '2{0:D7}-{1}', '$reserveDate', '$reserveTime', $karts, $minutes, $cost, 'CONFIRMED', NOW(), NOW());
"@ -f ($week * 10 + $day), (Get-Random -Minimum 0 -Maximum 9)
            }
        }
    }

    $sqlContent += @"

-- ============================================================================================================
-- FINALIZACIÓN
-- ============================================================================================================

-- Actualizar estadísticas
ANALYZE TABLE reserves;
ANALYZE TABLE frequent_customer;
ANALYZE TABLE people_discount;

-- Confirmar datos insertados
SELECT 'RESERVAS' as tabla, COUNT(*) as registros FROM reserves
UNION ALL
SELECT 'CLIENTES_FRECUENTES' as tabla, COUNT(*) as registros FROM frequent_customer
UNION ALL
SELECT 'DESCUENTOS_PERSONAS' as tabla, COUNT(*) as registros FROM people_discount;

-- ============================================================================================================
-- SCRIPT COMPLETADO EXITOSAMENTE
-- ============================================================================================================
"@

    return $sqlContent
}

function Create-PopulationJobs {
    Write-Step "Creando jobs de población para diferentes escenarios..."
    
    $scenarios = switch ($ScenarioType.ToUpper()) {
        "LOAD" { @(@{ Name = "Load"; Reservations = $BaseReservations; Weeks = 12 }) }
        "STRESS" { @(@{ Name = "Stress"; Reservations = $BaseReservations * 2; Weeks = 24 }) }
        "VOLUME" { @(@{ Name = "Volume"; Reservations = $BaseReservations * 5; Weeks = $WeeksHistorical }) }
        "ALL" { @(
            @{ Name = "Load"; Reservations = $BaseReservations; Weeks = 12 },
            @{ Name = "Stress"; Reservations = $BaseReservations * 2; Weeks = 24 },
            @{ Name = "Volume"; Reservations = $BaseReservations * 5; Weeks = $WeeksHistorical }
        )}
        default { @(@{ Name = "Default"; Reservations = $BaseReservations; Weeks = $WeeksHistorical }) }
    }
    
    foreach ($scenario in $scenarios) {
        Write-Step "Generando población para escenario: $($scenario.Name)"
        
        # Generar SQL
        $sqlContent = Generate-PopulationSQL -Scenario $scenario.Name -ReservationCount $scenario.Reservations -WeeksBack $scenario.Weeks
        
        # Guardar archivo SQL
        $sqlFile = "deployment\karting-db-populate-$($scenario.Name.ToLower()).sql"
        $sqlContent | Out-File -FilePath $sqlFile -Encoding UTF8
        Write-Step "SQL generado: $sqlFile"
        
        # Crear ConfigMap para el SQL
        $configMapContent = @"
apiVersion: v1
kind: ConfigMap
metadata:
  name: karting-db-populate-$($scenario.Name.ToLower())-config
  namespace: default
data:
  populate.sql: |
$($sqlContent -replace '^', '    ')
"@
        
        $configMapFile = "deployment\karting-db-populate-$($scenario.Name.ToLower())-configmap.yaml"
        $configMapContent | Out-File -FilePath $configMapFile -Encoding UTF8
        
        # Crear Job de población
        $jobContent = @"
apiVersion: batch/v1
kind: Job
metadata:
  name: karting-db-populate-$($scenario.Name.ToLower())-job
  namespace: default
spec:
  ttlSecondsAfterFinished: 300
  template:
    spec:
      restartPolicy: Never
      containers:
      - name: mysql-populate
        image: mysql:8.0
        env:
        - name: MYSQL_HOST
          value: "mysql-service"
        - name: MYSQL_PORT
          value: "3306"
        - name: MYSQL_DATABASE
          value: "karting_db"
        - name: MYSQL_USER
          valueFrom:
            secretKeyRef:
              name: mysql-user-secret
              key: username
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-user-secret
              key: password
        command:
        - /bin/bash
        - -c
        - |
          echo "Esperando MySQL..."
          until mysql -h`$MYSQL_HOST -P`$MYSQL_PORT -u`$MYSQL_USER -p`$MYSQL_PASSWORD -e "SELECT 1" > /dev/null 2>&1; do
            echo "MySQL no disponible aún..."
            sleep 5
          done
          echo "MySQL disponible, ejecutando población..."
          mysql -h`$MYSQL_HOST -P`$MYSQL_PORT -u`$MYSQL_USER -p`$MYSQL_PASSWORD `$MYSQL_DATABASE < /sql/populate.sql
          echo "Población completada para escenario: $($scenario.Name)"
        volumeMounts:
        - name: sql-volume
          mountPath: /sql
        resources:
          requests:
            memory: "128Mi"
            cpu: "100m"
          limits:
            memory: "256Mi"
            cpu: "200m"
      volumes:
      - name: sql-volume
        configMap:
          name: karting-db-populate-$($scenario.Name.ToLower())-config
"@
        
        $jobFile = "deployment\karting-db-populate-$($scenario.Name.ToLower())-job.yaml"
        $jobContent | Out-File -FilePath $jobFile -Encoding UTF8
        Write-Step "Job creado: $jobFile"
    }
}

function Execute-Population {
    param([string]$Scenario = "load")
    
    Write-Step "Ejecutando población para escenario: $Scenario"
    
    try {
        # Aplicar ConfigMap
        kubectl apply -f "deployment\karting-db-populate-$Scenario-configmap.yaml"
        Start-Sleep 2
        
        # Aplicar Job
        kubectl apply -f "deployment\karting-db-populate-$Scenario-job.yaml"
        
        # Esperar completación
        Write-Step "Esperando completación del job de población..."
        $timeout = 300 # 5 minutos
        $elapsed = 0
        
        do {
            Start-Sleep 10
            $elapsed += 10
            $jobStatus = kubectl get job "karting-db-populate-$Scenario-job" -o jsonpath="{.status.conditions[?(@.type=='Complete')].status}" 2>$null
            $jobFailed = kubectl get job "karting-db-populate-$Scenario-job" -o jsonpath="{.status.conditions[?(@.type=='Failed')].status}" 2>$null
            
            if ($jobStatus -eq "True") {
                Write-Step "Población completada exitosamente" "SUCCESS"
                return $true
            } elseif ($jobFailed -eq "True") {
                Write-Step "Error en la población" "ERROR"
                # Mostrar logs del error
                kubectl logs job/karting-db-populate-$Scenario-job
                return $false
            } elseif ($elapsed -ge $timeout) {
                Write-Step "Timeout esperando población" "ERROR"
                return $false
            }
            
            Write-Step "Población en progreso... ($elapsed/$timeout s)"
            
        } while ($true)
        
    } catch {
        Write-Step "Error ejecutando población: $($_.Exception.Message)" "ERROR"
        return $false
    }
}

# ============================================================================================================
# FUNCIÓN PRINCIPAL
# ============================================================================================================

function Main {
    Write-Host "=" * 80 -ForegroundColor Cyan
    Write-Host " POBLADOR DE BD PARA PRUEBAS DE RENDIMIENTO" -ForegroundColor White
    Write-Host "=" * 80 -ForegroundColor Cyan
    Write-Step "Escenario: $ScenarioType"
    Write-Step "Reservas base: $BaseReservations"
    Write-Step "Semanas históricas: $WeeksHistorical"
    
    # Crear jobs de población
    Create-PopulationJobs
    
    Write-Step "Jobs de población creados exitosamente" "SUCCESS"
    Write-Step "Para ejecutar: kubectl apply -f deployment/karting-db-populate-[scenario]-configmap.yaml" "INFO"
    Write-Step "Luego: kubectl apply -f deployment/karting-db-populate-[scenario]-job.yaml" "INFO"
}

# Ejecutar si no se está importando como módulo
if ($MyInvocation.InvocationName -ne '.') {
    Main
}

# ============================================================================================================
# SCRIPT PARA GENERAR DIFERENTES VOLÚMENES DE DATOS - PRUEBAS DE RENDIMIENTO
# ============================================================================================================
# Este script permite generar diferentes cantidades de datos para las pruebas de JMeter
# Según los compañeros: 100, 1000, 10000 reservas para comparar rendimiento
# ============================================================================================================

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("100", "1000", "10000", "clean")]
    [string]$Volume,
    
    [switch]$Stats = $false
)

# Colores para output
$Green = [System.ConsoleColor]::Green
$Yellow = [System.ConsoleColor]::Yellow
$Red = [System.ConsoleColor]::Red
$Cyan = [System.ConsoleColor]::Cyan
$Blue = [System.ConsoleColor]::Blue

function Write-ColorOutput {
    param([string]$Message, [System.ConsoleColor]$Color)
    Write-Host $Message -ForegroundColor $Color
}

function Show-Header {
    Write-ColorOutput "============================================================================================================" $Blue
    Write-ColorOutput "🚀 GENERADOR DE VOLÚMENES DE DATOS - PRUEBAS DE RENDIMIENTO KARTING" $Blue
    Write-ColorOutput "============================================================================================================" $Blue
}

function Show-Stats {
    Write-ColorOutput "📊 ESTADÍSTICAS ACTUALES DE LA BASE DE DATOS:" $Cyan
    
    $podName = kubectl get pods -l app=reserve-service-db -o jsonpath="{.items[0].metadata.name}"
    if ($LASTEXITCODE -eq 0) {
        $stats = kubectl exec $podName -- mysql -h localhost -uroot -proot -D reserve -e "
            SELECT 
                'USUARIOS' as tipo, COUNT(*) as cantidad FROM users
            UNION ALL
            SELECT 
                'RESERVAS' as tipo, COUNT(*) as cantidad FROM reserves
            UNION ALL
            SELECT 
                'ASIGNACIONES' as tipo, COUNT(*) as cantidad FROM reserves_users
            UNION ALL
            SELECT 
                'DÍAS CON RESERVAS' as tipo, COUNT(DISTINCT reserveday) as cantidad FROM reserves;" 2>$null
        
        if ($LASTEXITCODE -eq 0) {
            Write-ColorOutput $stats $Green
        } else {
            Write-ColorOutput "❌ Error al obtener estadísticas" $Red
        }
    } else {
        Write-ColorOutput "❌ No se pudo conectar a la base de datos" $Red
    }
}

function Generate-Volume {
    param([string]$TargetVolume)
    
    Write-ColorOutput "🎯 GENERANDO VOLUMEN DE $TargetVolume RESERVAS..." $Yellow
    
    $configMapName = "volume-$TargetVolume-config"
    $jobName = "volume-$TargetVolume-job"
    
    # Limpiar job anterior si existe
    kubectl delete job $jobName 2>$null
    kubectl delete configmap $configMapName 2>$null
    
    # Crear ConfigMap con SQL específico para el volumen
    $sqlContent = Generate-SQLForVolume -Volume $TargetVolume
    
    # Crear archivo temporal
    $tempFile = [System.IO.Path]::GetTempFileName()
    $sqlContent | Out-File -FilePath $tempFile -Encoding UTF8
    
    # Crear ConfigMap
    kubectl create configmap $configMapName "--from-file=volume-$TargetVolume.sql=$tempFile" 2>$null
    Remove-Item $tempFile -Force
    
    # Crear Job
    $jobYaml = @"
apiVersion: batch/v1
kind: Job
metadata:
  name: $jobName
spec:
  ttlSecondsAfterFinished: 1800
  backoffLimit: 3
  activeDeadlineSeconds: 1800
  template:
    spec:
      containers:
      - name: mysql-client
        image: mysql:latest
        command:
        - sh
        - -c
        - |
          set -e
          echo "🚀 GENERANDO VOLUMEN DE $TargetVolume RESERVAS"
          echo "⏰ Tiempo estimado: 2-5 minutos"
          
          # Esperar BD
          timeout=60
          elapsed=0
          while [ `$elapsed -lt `$timeout ]; do
            if mysql -h reserve-service-db-service -uroot -proot -e "SELECT 1" > /dev/null 2>&1; then
              echo "✅ BD disponible"
              break
            fi
            sleep 5
            elapsed=`$((`$elapsed + 5))
          done
          
          if [ `$elapsed -ge `$timeout ]; then
            echo "❌ Error: BD no disponible"
            exit 1
          fi
          
          echo "📈 Ejecutando generación de volumen..."
          mysql -h reserve-service-db-service -uroot -proot < /scripts/volume-$TargetVolume.sql
          
          echo "✅ VOLUMEN DE $TargetVolume RESERVAS GENERADO"
          echo "🎯 Sistema listo para pruebas de rendimiento"
          
        volumeMounts:
        - name: sql-script
          mountPath: /scripts
        resources:
          limits:
            memory: "256Mi"
            cpu: "200m"
          requests:
            memory: "128Mi"
            cpu: "100m"
      restartPolicy: Never
      volumes:
      - name: sql-script
        configMap:
          name: $configMapName
          defaultMode: 0644
"@
    
    # Aplicar Job
    $jobYaml | kubectl apply -f -
    
    Write-ColorOutput "⏳ Esperando completación del job..." $Yellow
    kubectl wait --for=condition=complete job/$jobName --timeout=300s
    
    if ($LASTEXITCODE -eq 0) {
        Write-ColorOutput "✅ VOLUMEN DE $TargetVolume RESERVAS GENERADO EXITOSAMENTE" $Green
        Show-Stats
    } else {
        Write-ColorOutput "❌ Error al generar volumen" $Red
        kubectl logs job/$jobName
    }
}

function Generate-SQLForVolume {
    param([string]$Volume)
    
    $baseDate = Get-Date -Format "yyyy-MM-dd"
    $reserveCount = [int]$Volume
    
    $sql = @"
-- GENERACIÓN DE VOLUMEN DE $Volume RESERVAS
USE reserve;

-- Configuración para inserción masiva
SET autocommit = 0;
SET unique_checks = 0;
SET foreign_key_checks = 0;

-- Limpiar reservas existentes de pruebas anteriores
DELETE FROM reserves_users WHERE reserve_id > 100;
DELETE FROM reserves WHERE id > 100;

-- Generar $reserveCount reservas
INSERT INTO reserves (reserveday, begin, finish, tariff_id, final_price) VALUES
"@
    
    for ($i = 1; $i -le $reserveCount; $i++) {
        $dayOffset = ($i % 30) + 1
        $hour = 8 + ($i % 14)  # 8:00 AM a 10:00 PM
        $minute = (($i % 4) * 15)  # 0, 15, 30, 45
        $tariffId = (($i % 3) + 1)  # 1, 2, 3
        $price = 25000 + (($i % 4) * 10000)  # 25000, 35000, 45000, 55000
        
        $reserveDate = (Get-Date).AddDays($dayOffset).ToString("yyyy-MM-dd")
        $beginTime = "{0:D2}:{1:D2}:00" -f $hour, $minute
        $finishTime = "{0:D2}:{1:D2}:00" -f ($hour + 1), $minute
        
        $sql += "('$reserveDate', '$beginTime', '$finishTime', $tariffId, $price.00)"
        
        if ($i -lt $reserveCount) {
            $sql += ",`n"
        } else {
            $sql += ";`n"
        }
    }
    
    $sql += @"

-- Asignar usuarios a reservas
INSERT INTO reserves_users (reserve_id, user_id) 
SELECT 
    r.id as reserve_id,
    (((r.id - 101) % 50) + 1) as user_id
FROM reserves r
WHERE r.id > 100;

COMMIT;

-- Restaurar configuración
SET foreign_key_checks = 1;
SET unique_checks = 1;
SET autocommit = 1;

-- Estadísticas
SELECT 
    'VOLUMEN GENERADO' as status,
    COUNT(*) as reservas_generadas,
    COUNT(DISTINCT reserveday) as dias_con_reservas,
    MIN(reserveday) as primera_reserva,
    MAX(reserveday) as ultima_reserva
FROM reserves WHERE id > 100;

SELECT '✅ VOLUMEN DE $Volume RESERVAS LISTO PARA PRUEBAS' as resultado;
"@
    
    return $sql
}

function Clean-TestData {
    Write-ColorOutput "🧹 LIMPIANDO DATOS DE PRUEBAS..." $Yellow
    
    $podName = kubectl get pods -l app=reserve-service-db -o jsonpath="{.items[0].metadata.name}"
    if ($LASTEXITCODE -eq 0) {
        kubectl exec $podName -- mysql -h localhost -uroot -proot -D reserve -e "
            SET foreign_key_checks = 0;
            DELETE FROM reserves_users WHERE reserve_id > 100;
            DELETE FROM reserves WHERE id > 100;
            DELETE FROM users WHERE id > 100;
            SET foreign_key_checks = 1;
            SELECT 'DATOS DE PRUEBAS LIMPIADOS' as resultado;
        " 2>$null
        
        if ($LASTEXITCODE -eq 0) {
            Write-ColorOutput "✅ DATOS DE PRUEBAS LIMPIADOS" $Green
        } else {
            Write-ColorOutput "❌ Error al limpiar datos" $Red
        }
    } else {
        Write-ColorOutput "❌ No se pudo conectar a la base de datos" $Red
    }
}

# Main execution
Show-Header

switch ($Volume) {
    "100" { Generate-Volume -TargetVolume "100" }
    "1000" { Generate-Volume -TargetVolume "1000" }
    "10000" { Generate-Volume -TargetVolume "10000" }
    "clean" { Clean-TestData }
}

if ($Stats) {
    Show-Stats
}

Write-ColorOutput "============================================================================================================" $Blue
Write-ColorOutput "🎯 SISTEMA LISTO PARA PRUEBAS DE RENDIMIENTO CON JMETER" $Blue
Write-ColorOutput "   RF5: Registro de Reservas - Load/Stress Testing" $Blue
Write-ColorOutput "   RF7: Rack Semanal - Load Testing" $Blue
Write-ColorOutput "   RF8: Reporte de Ingresos - Volume Testing" $Blue
Write-ColorOutput "============================================================================================================" $Blue

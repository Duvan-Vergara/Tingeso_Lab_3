#!/bin/bash

# ============================================================================================================
# SCRIPT PARA GENERAR VOLÚMENES DE DATOS - PRUEBAS DE RENDIMIENTO
# ============================================================================================================
# Genera diferentes cantidades de reservas para pruebas de JMeter
# Uso: ./generate-test-volumes.sh [100|1000|10000|clean]
# ============================================================================================================

set -e

VOLUME=${1:-1000}

echo "============================================================================================================"
echo "🚀 GENERADOR DE VOLÚMENES DE DATOS - PRUEBAS DE RENDIMIENTO KARTING"
echo "============================================================================================================"

function show_stats() {
    echo "📊 ESTADÍSTICAS DE LA BASE DE DATOS:"
    kubectl exec -it $(kubectl get pods -l app=reserve-service-db -o jsonpath="{.items[0].metadata.name}") -- \
        mysql -h localhost -uroot -proot -D reserve -e "
            SELECT 'USUARIOS' as tipo, COUNT(*) as cantidad FROM users
            UNION ALL
            SELECT 'RESERVAS' as tipo, COUNT(*) as cantidad FROM reserves
            UNION ALL
            SELECT 'ASIGNACIONES' as tipo, COUNT(*) as cantidad FROM reserves_users;" 2>/dev/null || echo "Error al obtener stats"
}

function generate_volume() {
    local target_volume=$1
    echo "🎯 GENERANDO VOLUMEN DE $target_volume RESERVAS..."
    
    # Crear ConfigMap con SQL
    kubectl create configmap "volume-$target_volume-sql" --from-literal="volume.sql=
USE reserve;
SET autocommit = 0;
SET unique_checks = 0;
SET foreign_key_checks = 0;

-- Limpiar reservas de pruebas anteriores
DELETE FROM reserves_users WHERE reserve_id > 100;
DELETE FROM reserves WHERE id > 100;

-- Generar $target_volume reservas
INSERT INTO reserves (reserveday, begin, finish, tariff_id, final_price) VALUES
$(for i in $(seq 1 $target_volume); do
    day_offset=$((i % 30 + 1))
    hour=$((8 + i % 14))
    minute=$(((i % 4) * 15))
    tariff_id=$((i % 3 + 1))
    price=$((25000 + (i % 4) * 10000))
    
    reserve_date=$(date -d \"+$day_offset days\" +%Y-%m-%d)
    begin_time=$(printf \"%02d:%02d:00\" $hour $minute)
    finish_time=$(printf \"%02d:%02d:00\" $((hour + 1)) $minute)
    
    echo \"('$reserve_date', '$begin_time', '$finish_time', $tariff_id, $price.00)\"
    if [ $i -lt $target_volume ]; then
        echo \",\"
    else
        echo \";\"
    fi
done)

-- Asignar usuarios a reservas
INSERT INTO reserves_users (reserve_id, user_id) 
SELECT 
    r.id as reserve_id,
    (((r.id - 101) % 50) + 1) as user_id
FROM reserves r
WHERE r.id > 100;

COMMIT;
SET foreign_key_checks = 1;
SET unique_checks = 1;
SET autocommit = 1;

SELECT '✅ VOLUMEN DE $target_volume RESERVAS GENERADO' as resultado;
" --dry-run=client -o yaml | kubectl apply -f -

    # Crear y ejecutar job
    kubectl delete job "volume-$target_volume-job" 2>/dev/null || true
    
    cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
  name: volume-$target_volume-job
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
          echo "🚀 GENERANDO VOLUMEN DE $target_volume RESERVAS"
          
          # Esperar BD
          timeout=60
          elapsed=0
          while [ \$elapsed -lt \$timeout ]; do
            if mysql -h reserve-service-db-service -uroot -proot -e "SELECT 1" > /dev/null 2>&1; then
              echo "✅ BD disponible"
              break
            fi
            sleep 5
            elapsed=\$((elapsed + 5))
          done
          
          if [ \$elapsed -ge \$timeout ]; then
            echo "❌ Error: BD no disponible"
            exit 1
          fi
          
          echo "📈 Ejecutando generación de volumen..."
          mysql -h reserve-service-db-service -uroot -proot < /scripts/volume.sql
          
          echo "✅ VOLUMEN DE $target_volume RESERVAS GENERADO"
          
        volumeMounts:
        - name: sql-script
          mountPath: /scripts
      restartPolicy: Never
      volumes:
      - name: sql-script
        configMap:
          name: volume-$target_volume-sql
EOF

    echo "⏳ Esperando completación del job..."
    kubectl wait --for=condition=complete job/volume-$target_volume-job --timeout=300s
    
    if [ $? -eq 0 ]; then
        echo "✅ VOLUMEN DE $target_volume RESERVAS GENERADO EXITOSAMENTE"
        show_stats
    else
        echo "❌ Error al generar volumen"
        kubectl logs job/volume-$target_volume-job
    fi
}

function clean_data() {
    echo "🧹 LIMPIANDO DATOS DE PRUEBAS..."
    kubectl exec -it $(kubectl get pods -l app=reserve-service-db -o jsonpath="{.items[0].metadata.name}") -- \
        mysql -h localhost -uroot -proot -D reserve -e "
            SET foreign_key_checks = 0;
            DELETE FROM reserves_users WHERE reserve_id > 100;
            DELETE FROM reserves WHERE id > 100;
            DELETE FROM users WHERE id > 100;
            SET foreign_key_checks = 1;
            SELECT 'DATOS DE PRUEBAS LIMPIADOS' as resultado;" 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo "✅ DATOS DE PRUEBAS LIMPIADOS"
    else
        echo "❌ Error al limpiar datos"
    fi
}

# Main execution
case $VOLUME in
    "100"|"1000"|"10000")
        generate_volume $VOLUME
        ;;
    "clean")
        clean_data
        ;;
    *)
        echo "❌ Uso: $0 [100|1000|10000|clean]"
        exit 1
        ;;
esac

echo "============================================================================================================"
echo "🎯 SISTEMA LISTO PARA PRUEBAS DE RENDIMIENTO CON JMETER"
echo "   RF5: Registro de Reservas - Load/Stress Testing"
echo "   RF7: Rack Semanal - Load Testing"
echo "   RF8: Reporte de Ingresos - Volume Testing"
echo "============================================================================================================"

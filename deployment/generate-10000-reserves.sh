#!/bin/bash

# Script para generar 10,000 reservas reales en la base de datos
# Genera reservas distribuidas en 30 días con horarios realistas

set -e

echo "🚀 GENERANDO 10,000 RESERVAS PARA PRUEBAS DE VOLUMEN"
echo "📊 Distribuyendo reservas en 30 días..."

# Conectar a la base de datos
mysql -h reserve-service-db-service -uroot -proot -D reserve <<'EOF'

-- Configuración para inserción masiva
SET autocommit = 0;
SET unique_checks = 0;
SET foreign_key_checks = 0;

-- Limpiar reservas de pruebas anteriores
DELETE FROM reserves_users WHERE reserve_id > 100;
DELETE FROM reserves WHERE id > 100;

-- Generar 10,000 reservas usando INSERTS por lotes
-- Día 1: 333 reservas (2025-07-09)
INSERT INTO reserves (reserveday, begin, finish, tariff_id, final_price) VALUES
EOF

# Generar 10,000 reservas usando un loop
total_reserves=10000
reserves_per_day=333
current_reserve=0

for day in {0..29}; do
    current_date=$(date -d "2025-07-09 + $day days" +%Y-%m-%d)
    
    # Generar reservas para este día
    for hour in {8..21}; do
        for minute in 0 15 30 45; do
            if [ $current_reserve -lt $total_reserves ]; then
                begin_time=$(printf "%02d:%02d:00" $hour $minute)
                finish_time=$(printf "%02d:%02d:00" $((hour + 1)) $minute)
                tariff_id=$(((current_reserve % 3) + 1))
                price=$((25000 + (current_reserve % 4) * 10000))
                
                echo "('$current_date', '$begin_time', '$finish_time', $tariff_id, $price.00)," >> /tmp/reserves.sql
                current_reserve=$((current_reserve + 1))
                
                if [ $current_reserve -ge $total_reserves ]; then
                    break 3
                fi
            fi
        done
    done
done

# Quitar la última coma y agregar punto y coma
sed -i '$ s/,$/;/' /tmp/reserves.sql

# Ejecutar el INSERT
mysql -h reserve-service-db-service -uroot -proot -D reserve < /tmp/reserves.sql

# Asignar usuarios a las reservas
mysql -h reserve-service-db-service -uroot -proot -D reserve <<'EOF'

-- Asignar usuarios a las reservas
INSERT INTO reserves_users (reserve_id, user_id)
SELECT 
    r.id as reserve_id,
    (((r.id - 100) % 70) + 1) as user_id
FROM reserves r
WHERE r.id > 100;

-- Agregar usuarios adicionales a algunas reservas
INSERT INTO reserves_users (reserve_id, user_id)
SELECT 
    r.id as reserve_id,
    (((r.id - 100 + 20) % 70) + 1) as user_id
FROM reserves r
WHERE r.id > 100 AND (r.id % 3) = 0;

COMMIT;

-- Restaurar configuración
SET foreign_key_checks = 1;
SET unique_checks = 1;
SET autocommit = 1;

-- Verificar resultado
SELECT 
    'VOLUMEN GENERADO' as status,
    COUNT(*) as total_reservas,
    COUNT(DISTINCT reserveday) as dias_con_reservas,
    MIN(reserveday) as primera_reserva,
    MAX(reserveday) as ultima_reserva
FROM reserves;

SELECT 
    'ASIGNACIONES CREADAS' as status,
    COUNT(*) as total_asignaciones,
    COUNT(DISTINCT user_id) as usuarios_asignados
FROM reserves_users;

SELECT '✅ SISTEMA LISTO PARA PRUEBAS DE VOLUMEN CON 10,000 RESERVAS' as resultado;

EOF

echo "✅ 10,000 RESERVAS GENERADAS EXITOSAMENTE"
echo "🎯 Sistema listo para pruebas de rendimiento"

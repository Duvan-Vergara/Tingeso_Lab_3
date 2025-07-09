#!/bin/bash

# ============================================================================================================
# SCRIPT PARA EJECUTAR POBLADO MASIVO DE DATOS - PRUEBAS DE VOLUMEN
# ============================================================================================================
# Este script te permite generar diferentes cantidades de datos para pruebas de rendimiento
# ACTUALIZADO PARA ARQUITECTURA DE MICROSERVICIOS
# Uso: ./run-volume-tests.sh [cantidad]
# ============================================================================================================

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${BLUE}============================================================================================================${NC}"
echo -e "${BLUE}🚀 KARTING VOLUME TEST DATA GENERATOR - MICROSERVICES ARCHITECTURE${NC}"
echo -e "${BLUE}============================================================================================================${NC}"

# Función para mostrar opciones
show_options() {
    echo -e "${YELLOW}Selecciona el tipo de prueba de volumen:${NC}"
    echo -e "${GREEN}1)${NC} Prueba Básica           - 1,000 reservas    (desarrollo)"
    echo -e "${GREEN}2)${NC} Prueba de Carga         - 5,000 reservas    (carga normal)"
    echo -e "${GREEN}3)${NC} Prueba de Volumen       - 10,000 reservas   (volumen estándar)"
    echo -e "${GREEN}4)${NC} Prueba de Volumen Alto  - 25,000 reservas   (volumen alto)"
    echo -e "${GREEN}5)${NC} Prueba de Estrés        - 50,000 reservas   (estrés)"
    echo -e "${GREEN}6)${NC} Prueba Extrema          - 100,000 reservas  (extremo)"
    echo -e "${GREEN}7)${NC} Cantidad personalizada"
    echo -e "${GREEN}8)${NC} Limpiar datos de prueba"
    echo -e "${GREEN}9)${NC} Ver estadísticas actuales"
    echo ""
}

# Función para limpiar jobs anteriores
cleanup_jobs() {
    echo -e "${YELLOW}🧹 Limpiando jobs anteriores...${NC}"
    kubectl delete job volume-test-microservices-job 2>/dev/null || true
    kubectl delete configmap volume-test-microservices-config 2>/dev/null || true
    sleep 2
}

# Función para crear el job con la cantidad especificada
create_volume_job() {
    local reserve_count=$1
    local job_name="volume-test-microservices-job"
    
    echo -e "${YELLOW}📊 Creando job para generar $reserve_count reservas...${NC}"
    
    # Verificar que existe el archivo
    if [ ! -f "volume-test-microservices-job.yaml" ]; then
        echo -e "${RED}❌ Error: No se encontró volume-test-microservices-job.yaml${NC}"
        echo -e "${YELLOW}   Asegúrate de ejecutar este script desde el directorio deployment${NC}"
        return 1
    fi
    
    # Actualizar el archivo con la cantidad específica
    sed -i "s/args: \[\"\/scripts\/populate-volume-microservices.sh\", \"[0-9]*\"\]/args: [\"\/scripts\/populate-volume-microservices.sh\", \"$reserve_count\"]/" volume-test-microservices-job.yaml
    
    # Aplicar el job
    kubectl apply -f volume-test-microservices-job.yaml
    
    echo -e "${GREEN}✅ Job creado exitosamente${NC}"
    echo -e "${YELLOW}⏳ Monitoreando progreso...${NC}"
    
    # Monitorear el job
    kubectl wait --for=condition=complete --timeout=3600s job/$job_name
    
    echo -e "${GREEN}🎉 Poblado masivo completado exitosamente${NC}"
    
    # Mostrar logs
    echo -e "${BLUE}📋 Logs del job:${NC}"
    kubectl logs job/$job_name
}

# Función para mostrar estadísticas
show_stats() {
    echo -e "${BLUE}📊 Estadísticas actuales de los microservicios:${NC}"
    
    # Estadísticas de reserve-service-db
    echo -e "${CYAN}📋 RESERVE SERVICE DATABASE:${NC}"
    kubectl exec deployment/reserve-service-db -- mysql -uroot -proot reserve -e "
    SELECT 'ESTADÍSTICAS DE RESERVAS:' as info;
    SELECT COUNT(*) as total_reservas FROM reserves;
    SELECT COUNT(*) as total_usuarios FROM users;
    SELECT COUNT(*) as total_asignaciones FROM reserves_users;
    SELECT 
        YEAR(reserveday) as año,
        MONTH(reserveday) as mes,
        COUNT(*) as reservas_mes
    FROM reserves 
    GROUP BY YEAR(reserveday), MONTH(reserveday)
    ORDER BY año DESC, mes DESC 
    LIMIT 6;
    " 2>/dev/null
    
    # Estadísticas de tariff-service-db
    echo -e "${CYAN}💰 TARIFF SERVICE DATABASE:${NC}"
    kubectl exec deployment/tariff-service-db -- mysql -uroot -proot tartifasbd -e "
    SELECT 'ESTADÍSTICAS DE TARIFAS:' as info;
    SELECT COUNT(*) as total_tarifas FROM tariffs;
    SELECT laps, regular_price FROM tariffs ORDER BY laps;
    " 2>/dev/null
}

# Función para limpiar datos
clean_data() {
    echo -e "${YELLOW}🧹 Limpiando datos de prueba masivos...${NC}"
    kubectl exec deployment/reserve-service-db -- mysql -uroot -proot reserve -e "
    DELETE FROM reserves_users WHERE reserve_id > 100;
    DELETE FROM reserves WHERE id > 100;
    DELETE FROM users WHERE id > 20;
    ALTER TABLE reserves AUTO_INCREMENT = 101;
    ALTER TABLE users AUTO_INCREMENT = 21;
    SELECT 'Datos de prueba limpiados, datos base mantenidos' as resultado;
    " 2>/dev/null
    echo -e "${GREEN}✅ Datos de prueba limpiados${NC}"
}

# Main script
main() {
    if [ ! -f "volume-test-microservices-job.yaml" ]; then
        echo -e "${RED}❌ Error: No se encontró el archivo volume-test-microservices-job.yaml${NC}"
        echo -e "${YELLOW}Asegúrate de ejecutar este script desde el directorio deployment${NC}"
        exit 1
    fi
    
    if [ $# -eq 1 ]; then
        # Si se pasa un parámetro, usarlo directamente
        cleanup_jobs
        create_volume_job $1
        return
    fi
    
    while true; do
        show_options
        read -p "Selecciona una opción (1-9): " choice
        
        case $choice in
            1)
                cleanup_jobs
                create_volume_job 1000
                break
                ;;
            2)
                cleanup_jobs
                create_volume_job 5000
                break
                ;;
            3)
                cleanup_jobs
                create_volume_job 10000
                break
                ;;
            4)
                cleanup_jobs
                create_volume_job 25000
                break
                ;;
            5)
                cleanup_jobs
                create_volume_job 50000
                break
                ;;
            6)
                cleanup_jobs
                create_volume_job 100000
                break
                ;;
            7)
                read -p "Ingresa la cantidad de reservas a generar: " custom_count
                if [[ $custom_count =~ ^[0-9]+$ ]] && [ $custom_count -gt 0 ]; then
                    cleanup_jobs
                    create_volume_job $custom_count
                    break
                else
                    echo -e "${RED}❌ Error: Ingresa un número válido${NC}"
                fi
                ;;
            8)
                clean_data
                ;;
            9)
                show_stats
                ;;
            *)
                echo -e "${RED}❌ Opción inválida${NC}"
                ;;
        esac
        
        echo ""
    done
}

main "$@"
    
    DROP PROCEDURE IF EXISTS GenerateVolumeReserves\$\$
    
    CREATE PROCEDURE GenerateVolumeReserves(IN reserve_count INT)
    BEGIN
        DECLARE i INT DEFAULT 1;
        DECLARE rut_base VARCHAR(10);
        DECLARE email_base VARCHAR(50);
        DECLARE random_date DATE;
        DECLARE random_time TIME;
        DECLARE random_karts INT;
        DECLARE random_minutes INT;
        DECLARE calculated_cost DECIMAL(10,2);
        DECLARE random_status VARCHAR(20);
        DECLARE progress_count INT DEFAULT 0;
        
        SELECT CONCAT('🚀 INICIANDO GENERACIÓN DE ', reserve_count, ' RESERVAS...') AS mensaje;
        
        WHILE i <= reserve_count DO
            SET rut_base = CONCAT('1000', LPAD(i, 4, '0'), '-', (i % 10));
            SET email_base = CONCAT('cliente', i, '@karting-test.com');
            SET random_date = DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 730) DAY);
            SET random_time = TIME(CONCAT(8 + FLOOR(RAND() * 12), ':', LPAD(FLOOR(RAND() * 60), 2, '0'), ':00'));
            SET random_karts = 1 + FLOOR(RAND() * 7);
            SET random_minutes = CASE FLOOR(RAND() * 4)
                WHEN 0 THEN 15
                WHEN 1 THEN 30
                WHEN 2 THEN 45
                ELSE 60
            END;
            SET calculated_cost = random_karts * random_minutes * 25;
            SET random_status = IF(RAND() < 0.9, 'CONFIRMED', 'CANCELLED');
            
            INSERT INTO reserves (
                customer_name, customer_email, customer_rut, 
                reserve_date, reserve_time, karts_count, 
                minutes, total_cost, status, created_at, updated_at
            ) VALUES (
                CONCAT('Cliente ', i),
                email_base,
                rut_base,
                random_date,
                random_time,
                random_karts,
                random_minutes,
                calculated_cost,
                random_status,
                NOW(),
                NOW()
            );
            
            IF i % 1000 = 0 THEN
                COMMIT;
                SET progress_count = progress_count + 1000;
                SELECT CONCAT('✅ Procesadas ', progress_count, ' reservas de ', reserve_count, ' (', ROUND((progress_count/reserve_count)*100, 1), '%)') AS progreso;
            END IF;
            
            SET i = i + 1;
        END WHILE;
        
        COMMIT;
        
        SELECT CONCAT('🎉 COMPLETADO! Se generaron ', reserve_count, ' reservas exitosamente') AS resultado;
        SELECT CONCAT('📊 Total de reservas en BD: ', (SELECT COUNT(*) FROM reserves)) AS total_final;
        
    END\$\$
    
    DELIMITER ;
    
    CALL GenerateVolumeReserves($reserve_count);
    
    CREATE INDEX IF NOT EXISTS idx_reserves_date ON reserves(reserve_date);
    CREATE INDEX IF NOT EXISTS idx_reserves_customer ON reserves(customer_rut);
    CREATE INDEX IF NOT EXISTS idx_reserves_status ON reserves(status);
    CREATE INDEX IF NOT EXISTS idx_reserves_date_status ON reserves(reserve_date, status);
    
    SET sql_log_bin = 1;
    SET foreign_key_checks = 1;
    SET unique_checks = 1;
    SET autocommit = 1;
    
    SELECT 'ESTADÍSTICAS DE POBLADO MASIVO:' AS info;
    SELECT COUNT(*) as total_reservas FROM reserves;
    SELECT status, COUNT(*) as cantidad FROM reserves GROUP BY status;
    SELECT 'DATOS LISTOS PARA PRUEBAS DE VOLUMEN ✅' AS resultado_final;
EOF
)"
    
    # Aplicar el job
    kubectl apply -f volume-test-data-job.yaml
    
    echo -e "${GREEN}✅ Job creado exitosamente${NC}"
    echo -e "${YELLOW}⏳ Monitoreando progreso...${NC}"
    
    # Monitorear el job
    kubectl wait --for=condition=complete --timeout=3600s job/$job_name
    
    echo -e "${GREEN}🎉 Poblado masivo completado exitosamente${NC}"
    
    # Mostrar logs
    echo -e "${BLUE}📋 Logs del job:${NC}"
    kubectl logs job/$job_name
}

# Función para mostrar estadísticas
show_stats() {
    echo -e "${BLUE}📊 Estadísticas actuales de la base de datos:${NC}"
    kubectl exec -it deployment/mysql -- mysql -uroot -proot karting_db -e "
    SELECT 'ESTADÍSTICAS ACTUALES:' as info;
    SELECT COUNT(*) as total_reservas FROM reserves;
    SELECT status, COUNT(*) as cantidad FROM reserves GROUP BY status;
    SELECT 
        YEAR(reserve_date) as año,
        MONTH(reserve_date) as mes,
        COUNT(*) as reservas_mes
    FROM reserves 
    GROUP BY YEAR(reserve_date), MONTH(reserve_date)
    ORDER BY año DESC, mes DESC 
    LIMIT 12;
    "
}

# Función para limpiar datos
clean_data() {
    echo -e "${YELLOW}🧹 Limpiando datos existentes...${NC}"
    kubectl exec -it deployment/mysql -- mysql -uroot -proot karting_db -e "
    DELETE FROM reserves WHERE id > 0;
    DELETE FROM frequent_customer WHERE id > 0;
    DELETE FROM people_discount WHERE id > 0;
    ALTER TABLE reserves AUTO_INCREMENT = 1;
    SELECT 'Datos limpiados exitosamente' as resultado;
    "
    echo -e "${GREEN}✅ Datos limpiados${NC}"
}

# Main script
main() {
    if [ ! -f "volume-test-data-job.yaml" ]; then
        echo -e "${RED}❌ Error: No se encontró el archivo volume-test-data-job.yaml${NC}"
        echo -e "${YELLOW}Asegúrate de ejecutar este script desde el directorio deployment${NC}"
        exit 1
    fi
    
    if [ $# -eq 1 ]; then
        # Si se pasa un parámetro, usarlo directamente
        cleanup_jobs
        kubectl apply -f volume-test-data-job.yaml
        create_volume_job $1
        return
    fi
    
    while true; do
        show_options
        read -p "Selecciona una opción (1-8): " choice
        
        case $choice in
            1)
                cleanup_jobs
                kubectl apply -f volume-test-data-job.yaml
                create_volume_job 1000
                break
                ;;
            2)
                cleanup_jobs
                kubectl apply -f volume-test-data-job.yaml
                create_volume_job 5000
                break
                ;;
            3)
                cleanup_jobs
                kubectl apply -f volume-test-data-job.yaml
                create_volume_job 10000
                break
                ;;
            4)
                cleanup_jobs
                kubectl apply -f volume-test-data-job.yaml
                create_volume_job 25000
                break
                ;;
            5)
                cleanup_jobs
                kubectl apply -f volume-test-data-job.yaml
                create_volume_job 100000
                break
                ;;
            6)
                read -p "Ingresa la cantidad de reservas a generar: " custom_count
                if [[ $custom_count =~ ^[0-9]+$ ]] && [ $custom_count -gt 0 ]; then
                    cleanup_jobs
                    kubectl apply -f volume-test-data-job.yaml
                    create_volume_job $custom_count
                    break
                else
                    echo -e "${RED}❌ Error: Ingresa un número válido${NC}"
                fi
                ;;
            7)
                clean_data
                ;;
            8)
                show_stats
                ;;
            *)
                echo -e "${RED}❌ Opción inválida${NC}"
                ;;
        esac
        
        echo ""
    done
}

main "$@"

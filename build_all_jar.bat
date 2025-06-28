@echo off
REM Compilar todos los microservicios Java (backend) de una sola vez

cd backend\config-service
call mvn clean package -DskipTests
cd ../..

cd backend\eureka-service
call mvn clean package -DskipTests
cd ../..

cd backend\gateway-service
call mvn clean package -DskipTests
cd ../..

for %%i in (tariff-service discount-people-service discount-frequent-service special-rates-service reserve-service rack-service reports-service) do (
    cd backend\%%i
    call mvn clean package -DskipTests
    cd ../..
)

echo Todos los JARs han sido generados.
pause
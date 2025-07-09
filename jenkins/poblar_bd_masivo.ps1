# =====================================================
# SCRIPT DE POBLAMIENTO MASIVO DE BD - POWERSHELL
# =====================================================
# Script para poblar la base de datos con diferentes volúmenes
# de datos para pruebas de volumen realistas
# =====================================================

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("10K", "100K", "1M", "CLEAN")]
    [string]$Nivel = "10K",
    
    [Parameter(Mandatory=$false)]
    [string]$DBHost = "localhost",
    
    [Parameter(Mandatory=$false)]
    [string]$DBPort = "30006",
    
    [Parameter(Mandatory=$false)]
    [string]$DBName = "kart_db",
    
    [Parameter(Mandatory=$false)]
    [string]$DBUser = "root",
    
    [Parameter(Mandatory=$false)]
    [string]$DBPassword = "root"
)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "   POBLAMIENTO MASIVO DE BD" -ForegroundColor Cyan
Write-Host "   Sistema de Karting - Volume Testing" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar disponibilidad de MySQL
Write-Host "Verificando disponibilidad de MySQL..." -ForegroundColor Yellow
try {
    $testConnection = mysql -h $DBHost -P $DBPort -u $DBUser -p$DBPassword -e "SELECT 1;" 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw "No se puede conectar a MySQL"
    }
    Write-Host "✓ Conexión a MySQL exitosa" -ForegroundColor Green
} catch {
    Write-Host "✗ Error: No se puede conectar a MySQL en $DBHost`:$DBPort" -ForegroundColor Red
    Write-Host "Verifique que:" -ForegroundColor Yellow
    Write-Host "  - El servicio MySQL esté ejecutándose" -ForegroundColor Yellow
    Write-Host "  - Los puertos estén disponibles" -ForegroundColor Yellow
    Write-Host "  - Las credenciales sean correctas" -ForegroundColor Yellow
    exit 1
}

# Obtener directorio del script
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectDir = Split-Path -Parent $scriptDir
$sqlFile = Join-Path $projectDir "deployment\poblamiento-masivo-bd.sql"

Write-Host "Directorio del proyecto: $projectDir" -ForegroundColor Gray
Write-Host "Archivo SQL: $sqlFile" -ForegroundColor Gray
Write-Host ""

# Verificar que existe el archivo SQL
if (-not (Test-Path $sqlFile)) {
    Write-Host "✗ Error: No se encuentra el archivo SQL en $sqlFile" -ForegroundColor Red
    exit 1
}

Write-Host "Nivel seleccionado: $Nivel" -ForegroundColor Cyan
Write-Host ""

switch ($Nivel) {
    "CLEAN" {
        Write-Host "======================================" -ForegroundColor Red
        Write-Host "   LIMPIANDO BASE DE DATOS" -ForegroundColor Red
        Write-Host "======================================" -ForegroundColor Red
        Write-Host ""
        Write-Host "ADVERTENCIA: Esto eliminará TODAS las reservas" -ForegroundColor Red
        $confirm = Read-Host "¿Continuar? (S/N)"
        if ($confirm.ToUpper() -ne "S") {
            Write-Host "Operación cancelada" -ForegroundColor Yellow
            exit 0
        }
        
        $cleanQuery = @"
USE $DBName;
DELETE FROM reserve WHERE id > 0;
ALTER TABLE reserve AUTO_INCREMENT = 1;
SELECT COUNT(*) as reservas_restantes FROM reserve;
"@
        
        Write-Host "Ejecutando limpieza..." -ForegroundColor Yellow
        $cleanQuery | mysql -h $DBHost -P $DBPort -u $DBUser -p$DBPassword
        Write-Host "✓ Base de datos limpiada" -ForegroundColor Green
    }
    
    "10K" {
        Write-Host "======================================" -ForegroundColor Green
        Write-Host "   POBLANDO 10,000 RESERVAS" -ForegroundColor Green
        Write-Host "======================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Tiempo estimado: 2-5 minutos" -ForegroundColor Gray
        
        $populateQuery = @"
USE $DBName;
SOURCE $sqlFile;
CALL GenerarReservasMasivas(10000, 'VOLUMEN-10K');
SELECT COUNT(*) as total_reservas FROM reserve;
"@
        
        Write-Host "Ejecutando poblamiento de 10K reservas..." -ForegroundColor Yellow
        Write-Host "Iniciado a las $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Gray
        
        $populateQuery | mysql -h $DBHost -P $DBPort -u $DBUser -p$DBPassword
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ 10K reservas creadas exitosamente" -ForegroundColor Green
        } else {
            Write-Host "✗ Error en el poblamiento" -ForegroundColor Red
            exit 1
        }
    }
    
    "100K" {
        Write-Host "======================================" -ForegroundColor Orange
        Write-Host "   POBLANDO 100,000 RESERVAS" -ForegroundColor Orange
        Write-Host "======================================" -ForegroundColor Orange
        Write-Host ""
        Write-Host "Tiempo estimado: 10-20 minutos" -ForegroundColor Gray
        Write-Host "ADVERTENCIA: Operación intensiva de BD" -ForegroundColor Red
        
        $confirm = Read-Host "¿Continuar? (S/N)"
        if ($confirm.ToUpper() -ne "S") {
            Write-Host "Operación cancelada" -ForegroundColor Yellow
            exit 0
        }
        
        $populateQuery = @"
USE $DBName;
SOURCE $sqlFile;
CALL GenerarReservasMasivas(100000, 'VOLUMEN-100K');
SELECT COUNT(*) as total_reservas FROM reserve;
"@
        
        Write-Host "Ejecutando poblamiento de 100K reservas..." -ForegroundColor Yellow
        Write-Host "Iniciado a las $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Gray
        Write-Host "Por favor espere, esta operación puede tomar varios minutos..." -ForegroundColor Gray
        
        $populateQuery | mysql -h $DBHost -P $DBPort -u $DBUser -p$DBPassword
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ 100K reservas creadas exitosamente" -ForegroundColor Green
        } else {
            Write-Host "✗ Error en el poblamiento" -ForegroundColor Red
            exit 1
        }
    }
    
    "1M" {
        Write-Host "======================================" -ForegroundColor Red
        Write-Host "   POBLANDO 1,000,000 RESERVAS" -ForegroundColor Red
        Write-Host "======================================" -ForegroundColor Red
        Write-Host ""
        Write-Host "Tiempo estimado: 30-60 minutos" -ForegroundColor Gray
        Write-Host "ADVERTENCIA: Operación MUY intensiva de BD" -ForegroundColor Red
        Write-Host "Requiere recursos significativos del sistema" -ForegroundColor Red
        
        $confirm = Read-Host "¿Continuar? (S/N)"
        if ($confirm.ToUpper() -ne "S") {
            Write-Host "Operación cancelada" -ForegroundColor Yellow
            exit 0
        }
        
        $populateQuery = @"
USE $DBName;
SOURCE $sqlFile;
CALL GenerarReservasMasivas(1000000, 'VOLUMEN-1M');
SELECT COUNT(*) as total_reservas FROM reserve;
"@
        
        Write-Host "Ejecutando poblamiento de 1M reservas..." -ForegroundColor Yellow
        Write-Host "Iniciado a las $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Gray
        Write-Host "Esta operación puede tomar hasta 1 hora..." -ForegroundColor Gray
        
        $populateQuery | mysql -h $DBHost -P $DBPort -u $DBUser -p$DBPassword
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ 1M reservas creadas exitosamente" -ForegroundColor Green
        } else {
            Write-Host "✗ Error en el poblamiento" -ForegroundColor Red
            exit 1
        }
    }
}

# Mostrar estadísticas finales
Write-Host ""
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "   ESTADÍSTICAS FINALES" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan

$statsQuery = @"
USE $DBName;
SELECT 'Total de reservas:' as metrica, COUNT(*) as valor FROM reserve
UNION ALL
SELECT 'Reservas último mes:', COUNT(*) FROM reserve WHERE reserveday >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
UNION ALL
SELECT 'Ingresos totales:', SUM(final_price) FROM reserve
UNION ALL
SELECT 'Precio promedio:', AVG(final_price) FROM reserve;
"@

Write-Host "Generando estadísticas..." -ForegroundColor Yellow
$statsQuery | mysql -h $DBHost -P $DBPort -u $DBUser -p$DBPassword -t

Write-Host ""
Write-Host "✓ Poblamiento completado exitosamente" -ForegroundColor Green
Write-Host "Finalizado a las $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Gray
Write-Host ""
Write-Host "La base de datos está lista para pruebas de volumen" -ForegroundColor Cyan

# Ejemplos de uso
Write-Host ""
Write-Host "======================================" -ForegroundColor Gray
Write-Host "   EJEMPLOS DE USO" -ForegroundColor Gray
Write-Host "======================================" -ForegroundColor Gray
Write-Host "Para 10K reservas:" -ForegroundColor Gray
Write-Host "  .\poblar_bd_masivo.ps1 -Nivel 10K" -ForegroundColor Gray
Write-Host ""
Write-Host "Para 100K reservas:" -ForegroundColor Gray
Write-Host "  .\poblar_bd_masivo.ps1 -Nivel 100K" -ForegroundColor Gray
Write-Host ""
Write-Host "Para limpiar BD:" -ForegroundColor Gray
Write-Host "  .\poblar_bd_masivo.ps1 -Nivel CLEAN" -ForegroundColor Gray

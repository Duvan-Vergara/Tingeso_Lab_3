Clear-Host

# Función robusta para esperar la finalización de jobs de Kubernetes
function Wait-ForJobsCompletion {
    param(
        [string[]]$JobNames,
        [int]$TimeoutSeconds = 300,
        [string]$JobType = "población"
    )
    
    if ($JobNames.Count -eq 0) {
        Write-Host "⚠️  No hay jobs de $JobType para esperar." -ForegroundColor Yellow
        return @{ Success = $true; CompletedJobs = @(); FailedJobs = @() }
    }
    
    Write-Host "`n⚠️  Esperando que terminen todos los jobs de $JobType..." -ForegroundColor Yellow
    Write-Host "   Jobs a completar: $($JobNames -join ', ')" -ForegroundColor Gray
    Write-Host "   Tiempo máximo de espera: $($TimeoutSeconds/60) minutos" -ForegroundColor Gray
    
    $elapsed = 0
    $completedJobs = @()
    $failedJobs = @()
    $checkInterval = 10
    
    do {
        Start-Sleep -Seconds $checkInterval
        $elapsed += $checkInterval
        
        foreach ($job in $JobNames) {
            if ($job -notin $completedJobs -and $job -notin $failedJobs) {
                try {
                    # Método más confiable: verificar directamente el estado del job
                    $jobStatus = kubectl get job $job -o jsonpath="{.status.conditions[?(@.type=='Complete')].status}" 2>$null
                    $jobFailed = kubectl get job $job -o jsonpath="{.status.conditions[?(@.type=='Failed')].status}" 2>$null
                    $jobExists = kubectl get job $job --ignore-not-found 2>$null
                    
                    if ($jobExists) {
                        if ($jobStatus -eq "True") {
                            Write-Host "✅ $job completado exitosamente" -ForegroundColor Green
                            $completedJobs += $job
                        } elseif ($jobFailed -eq "True") {
                            Write-Host "❌ Error en $job" -ForegroundColor Red
                            $failedJobs += $job
                            # Obtener mensaje de error
                            $errorMessage = kubectl get job $job -o jsonpath="{.status.conditions[?(@.type=='Failed')].message}" 2>$null
                            if ($errorMessage) {
                                Write-Host "   Motivo del fallo: $errorMessage" -ForegroundColor Gray
                            }
                        }
                    }
                } catch {
                    # Job podría no existir aún o error de kubectl, continuar
                    Write-Verbose "Error verificando job $job"
                }
            }
        }
        
        $totalCompleted = $completedJobs.Count + $failedJobs.Count
        $remaining = $JobNames.Count - $totalCompleted
        
        # Mostrar progreso cada 30 segundos
        if ($remaining -gt 0 -and $elapsed % 30 -eq 0) {
            Write-Host "   Esperando $remaining jobs... ($elapsed/$TimeoutSeconds segundos)" -ForegroundColor Gray
            Write-Host "      Completados: $($completedJobs.Count) | Fallidos: $($failedJobs.Count)" -ForegroundColor Gray
        }
        
    } while ($totalCompleted -lt $JobNames.Count -and $elapsed -lt $TimeoutSeconds)
    
    # Verificación final: antes de declarar timeout, hacer una última verificación
    if ($elapsed -ge $TimeoutSeconds) {
        Write-Host "   Verificación final de jobs pendientes..." -ForegroundColor Cyan
        foreach ($job in $JobNames) {
            if ($job -notin $completedJobs -and $job -notin $failedJobs) {
                $finalStatus = kubectl get job $job -o jsonpath="{.status.conditions[?(@.type=='Complete')].status}" 2>$null
                $finalFailed = kubectl get job $job -o jsonpath="{.status.conditions[?(@.type=='Failed')].status}" 2>$null
                
                if ($finalStatus -eq "True") {
                    Write-Host "   ✅ $job detectado como completado en verificación final" -ForegroundColor Green
                    $completedJobs += $job
                } elseif ($finalFailed -eq "True") {
                    Write-Host "   ❌ $job detectado como fallido en verificación final" -ForegroundColor Red
                    $failedJobs += $job
                }
            }
        }
        $totalCompleted = $completedJobs.Count + $failedJobs.Count
    }
    
    # Resultado final
    $result = @{
        Success = $totalCompleted -eq $JobNames.Count
        CompletedJobs = $completedJobs
        FailedJobs = $failedJobs
        TimedOut = $elapsed -ge $TimeoutSeconds -and $totalCompleted -lt $JobNames.Count
        ElapsedSeconds = $elapsed
    }
    
    if ($result.TimedOut) {
        Write-Host "⚠️  Tiempo agotado esperando jobs de $JobType" -ForegroundColor Yellow
        $pendingJobs = $JobNames | Where-Object { $_ -notin $completedJobs -and $_ -notin $failedJobs }
        if ($pendingJobs.Count -gt 0) {
            Write-Host "   Jobs pendientes: $($pendingJobs -join ', ')" -ForegroundColor Gray
            Write-Host "   Para verificar manualmente: kubectl get jobs" -ForegroundColor Gray
        }
    } else {
        if ($failedJobs.Count -eq 0) {
            Write-Host "✅ TODOS LOS JOBS DE $($JobType.ToUpper()) COMPLETADOS EXITOSAMENTE" -ForegroundColor Green
        } else {
            Write-Host "⚠️  Jobs de $JobType terminados con algunos errores:" -ForegroundColor Yellow
            if ($completedJobs.Count -gt 0) {
                Write-Host "   Exitosos: $($completedJobs -join ', ')" -ForegroundColor Green
            }
            Write-Host "   Fallidos: $($failedJobs -join ', ')" -ForegroundColor Red
        }
    }
    
    return $result
}

# Función para verificar el estado de un job específico
function Get-JobStatus {
    param([string]$JobName)
    
    try {
        $exists = kubectl get job $JobName --ignore-not-found 2>$null
        if (-not $exists) {
            return @{Status="NotFound"; Message="Job no encontrado"}
        }
        
        $completed = kubectl get job $JobName -o jsonpath="{.status.conditions[?(@.type=='Complete')].status}" 2>$null
        $failed = kubectl get job $JobName -o jsonpath="{.status.conditions[?(@.type=='Failed')].status}" 2>$null
        $completions = kubectl get job $JobName -o jsonpath="{.status.completions}" 2>$null
        $succeeded = kubectl get job $JobName -o jsonpath="{.status.succeeded}" 2>$null
        
        if ($completed -eq "True") {
            return @{
                Status="Complete"
                Completions=$completions
                Succeeded=$succeeded
                Message="Job completado exitosamente"
            }
        } elseif ($failed -eq "True") {
            $reason = kubectl get job $JobName -o jsonpath="{.status.conditions[?(@.type=='Failed')].reason}" 2>$null
            $message = kubectl get job $JobName -o jsonpath="{.status.conditions[?(@.type=='Failed')].message}" 2>$null
            return @{
                Status="Failed"
                Reason=$reason
                Message="Job falló: $message"
            }
        } else {
            return @{
                Status="Running"
                Completions=$completions
                Succeeded=$succeeded
                Message="Job en ejecución"
            }
        }
    } catch {
        return @{Status="Error"; Message="Error verificando job: $($_.Exception.Message)"}
    }
}

$exitMenu = $false
do {
    Write-Host "==============================="
    Write-Host "  Despliegue Kubernetes"
    Write-Host "1. PC (Minikube)"
    Write-Host "2. Notebook (Docker Desktop)"
    Write-Host "3. Salir"
    Write-Host "==============================="
    $opt = Read-Host "Elige una opción [1-3]"

    switch ($opt) {
        "1" {
            $KUBE_CTX = "minikube"
        }
        "2" {
            $KUBE_CTX = "docker-desktop"
        }
        "3" {
            $exitMenu = $true
            break
        }
        default {
            Write-Host "Opción no válida.`n" -ForegroundColor Yellow
            Pause
            continue
        }
    }

    if ($exitMenu) { break }

    kubectl config use-context $KUBE_CTX
    $clean = Read-Host "¿Deseas limpiar todos los recursos de Kubernetes antes de desplegar? (S/N)"
    if ($clean -eq "S" -or $clean -eq "s") {
        & "$PSScriptRoot/clean_k8s.ps1" $opt
    }

    Push-Location deployment

    # ConfigMaps y Secrets
    kubectl apply -f mysql-config-map.yaml
    kubectl apply -f mysql-root-secret.yaml
    kubectl apply -f mysql-user-secret.yaml

    # MySQL principal primero
    kubectl apply -f mysql-deployment.yaml
    Write-Host "Esperando a que MySQL esté listo..."
    kubectl wait --for=condition=ready pod -l app=mysql --timeout=300s
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: MySQL no está listo después de 5 minutos." -ForegroundColor Red
    }

    # Bases de datos de microservicios
    kubectl apply -f tariff-service-db-deployment-service.yaml
    kubectl apply -f discount-people-service-db-deployment-service.yaml
    kubectl apply -f discount-frequent-service-db-deployment-service.yaml
    kubectl apply -f special-rates-service-db-deployment-service.yaml
    kubectl apply -f reserve-service-db-deployment-service.yaml

    # Config Service
    kubectl apply -f config-service-deployment-service.yaml
    Write-Host "Esperando a que config-service esté listo..."
    kubectl wait --for=condition=ready pod -l app=config-service-deployment --timeout=300s
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: config-service no está listo después de 5 minutos." -ForegroundColor Red
    }

    # Eureka Service
    kubectl apply -f eureka-service-deployment-service.yaml
    Write-Host "Esperando a que eureka-service esté listo..."
    kubectl wait --for=condition=ready pod -l app=eureka-service-deployment --timeout=300s
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: eureka-service no está listo después de 5 minutos." -ForegroundColor Red
    }

    # Verificar si Eureka puede conectarse al Config Service (con reintentos)
    Write-Host "Verificando conexión de eureka-service al Config Service..." -ForegroundColor Cyan
    
    $maxAttempts = 5
    $attempt = 1
    $connected = $false
    
    do {
        Write-Host "Intento $attempt de $maxAttempts..." -ForegroundColor Gray
        Start-Sleep -Seconds 10  # Dar tiempo para que Eureka intente conectarse
        $eurekaPodName = kubectl get pods -l app=eureka-service-deployment -o jsonpath="{.items[0].metadata.name}"
        
        $connectionErrors = kubectl logs $eurekaPodName | Select-String "Connection refused|ConnectException"
        if ($connectionErrors) {
            Write-Host "❌ Eureka no pudo conectarse al Config Service (intento $attempt)" -ForegroundColor Red
            
            if ($attempt -lt $maxAttempts) {
                Write-Host "🔄 Reiniciando eureka-service..." -ForegroundColor Cyan
                kubectl rollout restart deployment eureka-service-deployment
                Write-Host "Esperando a que eureka-service se reinicie..." -ForegroundColor Cyan
                Start-Sleep -Seconds 20
                kubectl wait --for=condition=ready pod -l app=eureka-service-deployment --timeout=300s
                if ($LASTEXITCODE -ne 0) {
                    Write-Host "⚠️  Error: eureka-service no está listo después del reinicio." -ForegroundColor Yellow
                } else {
                    Write-Host "✅ Eureka reiniciado exitosamente." -ForegroundColor Green
                }
            } else {
                Write-Host "❌ FALLO CRÍTICO: Eureka no pudo conectarse después de $maxAttempts intentos." -ForegroundColor Red
                Write-Host "   El sistema NO FUNCIONARÁ sin esta conexión." -ForegroundColor Red
                Pause
                return
            }
        } else {
            Write-Host "✅ Conectividad Eureka → Config Service: OK" -ForegroundColor Green
            $connected = $true
        }
        
        $attempt++
    } while (-not $connected -and $attempt -le $maxAttempts)
    
    if (-not $connected) {
        Write-Host "❌ DESPLIEGUE ABORTADO: Eureka no pudo conectarse al Config Service." -ForegroundColor Red
        Write-Host "   Para depurar manualmente ejecutar:" -ForegroundColor Gray
        Write-Host "     kubectl logs $eurekaPodName" -ForegroundColor Gray
        Pause
        return
    }

    # Gateway Service
    kubectl apply -f gateway-service-deployment-service.yaml

    # Microservicios funcionales
    kubectl apply -f tariff-service-deployment.yaml
    kubectl apply -f discount-people-service-deployment.yaml
    kubectl apply -f discount-frequent-service-deployment.yaml
    kubectl apply -f special-rates-service-deployment.yaml
    kubectl apply -f reserve-service-deployment.yaml
    kubectl apply -f rack-service-deployment.yaml
    kubectl apply -f reports-service-deployment.yaml

    # Frontend
    kubectl apply -f frontend-deployment.yaml

    Pop-Location
    Write-Host "Deployments aplicados." -ForegroundColor Green

    # Poblar automáticamente las bases de datos
    Write-Host "`n=== ESPERANDO PREPARACIÓN DE BASES DE DATOS ===" -ForegroundColor Green
    Write-Host "Esperando a que todas las bases de datos estén listas..." -ForegroundColor Cyan
    
    # Esperar a que todas las bases de datos estén ready
    $dbServices = @(
        'tariff-service-db',
        'discount-people-service-db',
        'discount-frequent-service-db', 
        'special-rates-service-db',
        'reserve-service-db'
    )
    
    $allDbsReady = $true
    foreach ($dbService in $dbServices) {
        Write-Host "Esperando a que $dbService esté listo..." -ForegroundColor Gray
        kubectl wait --for=condition=ready pod -l app=$dbService --timeout=300s
        if ($LASTEXITCODE -ne 0) {
            Write-Host "❌ Error: $dbService no está listo después de 5 minutos." -ForegroundColor Red
            $allDbsReady = $false
        } else {
            Write-Host "✅ $dbService está listo" -ForegroundColor Green
        }
    }
    
    if (-not $allDbsReady) {
        Write-Host "⚠️  Algunos servicios de BD no están listos. Continuando de todos modos..." -ForegroundColor Yellow
        Write-Host "   Para depurar: kubectl get pods -l app=<db-name>" -ForegroundColor Gray
    }
    
    Write-Host "`n=== POBLANDO BASES DE DATOS ===" -ForegroundColor Green
    $servicesToPopulate = @(
        'tariff-service',
        'discount-people-service', 
        'discount-frequent-service',
        'special-rates-service',
        'reserve-service'
    )
    
    $populateJobs = @()
    
    foreach ($svc in $servicesToPopulate) {
        $configMapName = "$svc-db-sql"
        $sqlFile = "$PSScriptRoot/deployment/$svc-db.mysql.sql"
        $jobFile = "$PSScriptRoot/deployment/$svc-db-populate-job.yaml"
        
        if ((Test-Path $sqlFile) -and (Test-Path $jobFile)) {
            Write-Host "Iniciando poblado de base de datos para $svc..." -ForegroundColor Cyan
            kubectl create configmap $configMapName --from-file="$svc-db.mysql.sql=$sqlFile" --dry-run=client -o yaml | kubectl apply -f -
            kubectl apply -f $jobFile
            $populateJobs += "$svc-db-populate"
        } else {
            Write-Host "[ADVERTENCIA] Archivos de poblado no encontrados para $svc" -ForegroundColor Yellow
            if (!(Test-Path $sqlFile)) {
                Write-Host "  - Falta: $sqlFile" -ForegroundColor Red
            }
            if (!(Test-Path $jobFile)) {
                Write-Host "  - Falta: $jobFile" -ForegroundColor Red
            }
        }
    }
    
    # Esperar a que todos los jobs de población estén completos usando la función mejorada
    if ($populateJobs.Count -gt 0) {
        $populateResult = Wait-ForJobsCompletion -JobNames $populateJobs -TimeoutSeconds 300 -JobType "población básica"
        
        # Continuar solo si al menos algunos jobs se completaron exitosamente
        if ($populateResult.CompletedJobs.Count -eq 0 -and $populateResult.FailedJobs.Count -gt 0) {
            Write-Host "⚠️  ADVERTENCIA: Todos los jobs de población básica fallaron." -ForegroundColor Red
            Write-Host "   El sistema puede no funcionar correctamente sin datos." -ForegroundColor Yellow
            $continueAnyway = Read-Host "¿Continuar de todos modos? (S/N)"
            if ($continueAnyway -ne "S" -and $continueAnyway -ne "s") {
                Write-Host "Despliegue cancelado por el usuario." -ForegroundColor Yellow
                return
            }
        }
    } else {
        Write-Host "⚠️  No se encontraron jobs de población para ejecutar." -ForegroundColor Yellow
        $populateResult = @{ CompletedJobs = @(); FailedJobs = @() }
    }

    # AUTO-POBLADO CON DATOS DE PRUEBA MASIVOS
    Write-Host "`n=== GENERANDO DATOS DE PRUEBA MASIVOS ===" -ForegroundColor Green
    $autoPopulateJob = "$PSScriptRoot/deployment/auto-populate-job.yaml"
    if (Test-Path $autoPopulateJob) {
        # Verificar que al menos algunos jobs básicos se completaron antes de continuar
        if ($populateResult.CompletedJobs.Count -eq 0) {
            Write-Host "⚠️  Saltando auto-poblado masivo porque ningún job básico se completó." -ForegroundColor Yellow
            Write-Host "   Es recomendable verificar los errores antes de continuar." -ForegroundColor Gray
        } else {
            Write-Host "✅ Jobs básicos completados: $($populateResult.CompletedJobs -join ', ')" -ForegroundColor Green
            Write-Host "Aplicando auto-poblado de datos de prueba masivos..." -ForegroundColor Cyan
            Write-Host "⚠️  IMPORTANTE: Este job ejecuta después de que las BD básicas estén pobladas." -ForegroundColor Yellow
            
            # Limpiar job anterior si existe
            kubectl delete job auto-populate-data 2>$null
            Start-Sleep -Seconds 5
            
            kubectl apply -f $autoPopulateJob
            
            # Usar la función mejorada para esperar el job masivo
            $massiveResult = Wait-ForJobsCompletion -JobNames @("auto-populate-data") -TimeoutSeconds 600 -JobType "poblado masivo"
            
            if ($massiveResult.Success -and $massiveResult.CompletedJobs.Count -gt 0) {
                Write-Host "✅ Poblado masivo completado exitosamente" -ForegroundColor Green
                Write-Host "📊 El sistema ahora tiene datos de prueba completos para testing" -ForegroundColor Green
            } elseif ($massiveResult.FailedJobs.Count -gt 0) {
                Write-Host "⚠️  Poblado masivo falló, pero continuando con el despliegue" -ForegroundColor Yellow
                Write-Host "   El sistema funcionará con los datos básicos ya cargados (100 reservas)" -ForegroundColor Gray
            } else {
                Write-Host "⚠️  Poblado masivo no se completó en el tiempo esperado" -ForegroundColor Yellow
                Write-Host "   Verificar manualmente con: kubectl get jobs" -ForegroundColor Gray
            }
        }
    } else {
        Write-Host "⚠️  Archivo de job auto-populate no encontrado. Saltando poblado masivo." -ForegroundColor Yellow
        Write-Host "   El sistema funcionará con los datos básicos (100 reservas, 20 usuarios)" -ForegroundColor Gray
    }
    Write-Host "`n=== DESPLIEGUE COMPLETO ===" -ForegroundColor Green
    Write-Host "🌐 Frontend: http://localhost:30080" -ForegroundColor Cyan
    Write-Host "� Gateway: http://localhost:30088" -ForegroundColor Cyan  
    Write-Host "📊 Eureka: http://localhost:30861" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "✅ Sistema de Karting desplegado exitosamente" -ForegroundColor Green
    Write-Host "� Base de datos poblada con 20 usuarios y 100 reservas para pruebas" -ForegroundColor Green
    Pause
    $exitMenu = $true
} while (-not $exitMenu)

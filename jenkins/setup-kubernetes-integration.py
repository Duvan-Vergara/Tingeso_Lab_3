#!/usr/bin/env python3
"""
Script de configuración para integración Jenkins-Kubernetes-JMeter
Configura automáticamente el entorno para pruebas de rendimiento en Kubernetes
"""

import os
import json
import subprocess
import yaml
from pathlib import Path

class JenkinsKubernetesSetup:
    def __init__(self):
        self.config = {
            'jenkins': {
                'namespace': 'jenkins',
                'service_account': 'jenkins-performance-tests',
                'jmeter_image': 'justb4/jmeter:5.5',
                'python_image': 'python:3.9-slim'
            },
            'karting': {
                'namespace': 'default',
                'base_url': 'http://gateway-service:8080',
                'health_endpoint': '/actuator/health'
            },
            'storage': {
                'pvc_name': 'jmeter-results-pvc',
                'storage_class': 'standard',
                'size': '10Gi'
            }
        }
    
    def create_kubernetes_resources(self):
        """Crea recursos de Kubernetes necesarios para Jenkins y JMeter"""
        
        # ServiceAccount para Jenkins
        service_account = {
            'apiVersion': 'v1',
            'kind': 'ServiceAccount',
            'metadata': {
                'name': self.config['jenkins']['service_account'],
                'namespace': self.config['jenkins']['namespace']
            }
        }
        
        # ClusterRole para Jenkins
        cluster_role = {
            'apiVersion': 'rbac.authorization.k8s.io/v1',
            'kind': 'ClusterRole',
            'metadata': {
                'name': 'jenkins-performance-tests'
            },
            'rules': [
                {
                    'apiGroups': [''],
                    'resources': ['pods', 'services', 'endpoints'],
                    'verbs': ['get', 'list', 'watch']
                },
                {
                    'apiGroups': ['apps'],
                    'resources': ['deployments', 'replicasets'],
                    'verbs': ['get', 'list', 'watch']
                },
                {
                    'apiGroups': ['batch'],
                    'resources': ['jobs'],
                    'verbs': ['get', 'list', 'watch', 'create', 'delete']
                }
            ]
        }
        
        # ClusterRoleBinding
        cluster_role_binding = {
            'apiVersion': 'rbac.authorization.k8s.io/v1',
            'kind': 'ClusterRoleBinding',
            'metadata': {
                'name': 'jenkins-performance-tests'
            },
            'roleRef': {
                'apiGroup': 'rbac.authorization.k8s.io',
                'kind': 'ClusterRole',
                'name': 'jenkins-performance-tests'
            },
            'subjects': [
                {
                    'kind': 'ServiceAccount',
                    'name': self.config['jenkins']['service_account'],
                    'namespace': self.config['jenkins']['namespace']
                }
            ]
        }
        
        # PersistentVolumeClaim para resultados
        pvc = {
            'apiVersion': 'v1',
            'kind': 'PersistentVolumeClaim',
            'metadata': {
                'name': self.config['storage']['pvc_name'],
                'namespace': self.config['jenkins']['namespace']
            },
            'spec': {
                'accessModes': ['ReadWriteOnce'],
                'storageClassName': self.config['storage']['storage_class'],
                'resources': {
                    'requests': {
                        'storage': self.config['storage']['size']
                    }
                }
            }
        }
        
        # Guardar recursos
        resources_dir = Path('deployment/jenkins')
        resources_dir.mkdir(exist_ok=True)
        
        with open(resources_dir / 'service-account.yaml', 'w') as f:
            yaml.dump(service_account, f, default_flow_style=False)
        
        with open(resources_dir / 'cluster-role.yaml', 'w') as f:
            yaml.dump(cluster_role, f, default_flow_style=False)
        
        with open(resources_dir / 'cluster-role-binding.yaml', 'w') as f:
            yaml.dump(cluster_role_binding, f, default_flow_style=False)
        
        with open(resources_dir / 'jmeter-results-pvc.yaml', 'w') as f:
            yaml.dump(pvc, f, default_flow_style=False)
        
        print("✅ Recursos de Kubernetes creados en deployment/jenkins/")
    
    def create_jmeter_job_template(self):
        """Crea template de Job de Kubernetes para ejecutar JMeter"""
        
        job_template = {
            'apiVersion': 'batch/v1',
            'kind': 'Job',
            'metadata': {
                'name': 'jmeter-performance-test-${TEST_TYPE}-${BUILD_NUMBER}',
                'namespace': self.config['jenkins']['namespace'],
                'labels': {
                    'app': 'jmeter-performance-test',
                    'test-type': '${TEST_TYPE}',
                    'build': '${BUILD_NUMBER}'
                }
            },
            'spec': {
                'ttlSecondsAfterFinished': 3600,  # Limpiar después de 1 hora
                'template': {
                    'spec': {
                        'serviceAccountName': self.config['jenkins']['service_account'],
                        'restartPolicy': 'Never',
                        'containers': [
                            {
                                'name': 'jmeter',
                                'image': self.config['jenkins']['jmeter_image'],
                                'command': ['/bin/bash'],
                                'args': [
                                    '-c',
                                    '''
                                    echo "🚀 Iniciando prueba JMeter: ${TEST_TYPE}"
                                    echo "URL objetivo: ${BASE_URL}"
                                    echo "Usuarios: ${USERS_COUNT}"
                                    
                                    # Crear directorio de resultados
                                    mkdir -p /results/${TIMESTAMP}
                                    
                                    # Ejecutar JMeter
                                    jmeter -n -t /tests/Karting-${TEST_TYPE^}-Testing.jmx \
                                        -Jbase.url=${BASE_URL} \
                                        -Jusers.count=${USERS_COUNT} \
                                        -l /results/${TIMESTAMP}/${TEST_TYPE}-test-results.jtl \
                                        -e -o /results/${TIMESTAMP}/reports/${TEST_TYPE}-test-report \
                                        -j /results/${TIMESTAMP}/logs/${TEST_TYPE}-test.log
                                    
                                    echo "✅ Prueba JMeter completada"
                                    '''
                                ],
                                'env': [
                                    {
                                        'name': 'TEST_TYPE',
                                        'value': '${TEST_TYPE}'
                                    },
                                    {
                                        'name': 'BASE_URL',
                                        'value': '${BASE_URL}'
                                    },
                                    {
                                        'name': 'USERS_COUNT',
                                        'value': '${USERS_COUNT}'
                                    },
                                    {
                                        'name': 'TIMESTAMP',
                                        'value': '${TIMESTAMP}'
                                    },
                                    {
                                        'name': 'BUILD_NUMBER',
                                        'value': '${BUILD_NUMBER}'
                                    }
                                ],
                                'volumeMounts': [
                                    {
                                        'name': 'jmeter-tests',
                                        'mountPath': '/tests'
                                    },
                                    {
                                        'name': 'jmeter-results',
                                        'mountPath': '/results'
                                    }
                                ],
                                'resources': {
                                    'requests': {
                                        'memory': '1Gi',
                                        'cpu': '500m'
                                    },
                                    'limits': {
                                        'memory': '2Gi',
                                        'cpu': '1000m'
                                    }
                                }
                            }
                        ],
                        'volumes': [
                            {
                                'name': 'jmeter-tests',
                                'configMap': {
                                    'name': 'jmeter-test-plans'
                                }
                            },
                            {
                                'name': 'jmeter-results',
                                'persistentVolumeClaim': {
                                    'claimName': self.config['storage']['pvc_name']
                                }
                            }
                        ]
                    }
                }
            }
        }
        
        # Guardar template
        resources_dir = Path('deployment/jenkins')
        with open(resources_dir / 'jmeter-job-template.yaml', 'w') as f:
            yaml.dump(job_template, f, default_flow_style=False)
        
        print("✅ Template de Job JMeter creado")
    
    def create_configmap_for_jmeter_tests(self):
        """Crea ConfigMap con los planes de prueba JMeter"""
        
        configmap = {
            'apiVersion': 'v1',
            'kind': 'ConfigMap',
            'metadata': {
                'name': 'jmeter-test-plans',
                'namespace': self.config['jenkins']['namespace']
            },
            'data': {}
        }
        
        # Buscar archivos JMX en el directorio raíz
        jmx_files = ['Karting-Load-Testing.jmx', 'Karting-Stress-Testing.jmx', 'Karting-Volume-Testing.jmx']
        
        for jmx_file in jmx_files:
            if os.path.exists(jmx_file):
                with open(jmx_file, 'r', encoding='utf-8') as f:
                    configmap['data'][jmx_file] = f.read()
                print(f"✅ {jmx_file} agregado al ConfigMap")
            else:
                print(f"⚠️ {jmx_file} no encontrado")
        
        # Guardar ConfigMap
        resources_dir = Path('deployment/jenkins')
        with open(resources_dir / 'jmeter-test-plans-configmap.yaml', 'w') as f:
            yaml.dump(configmap, f, default_flow_style=False)
        
        print("✅ ConfigMap de planes de prueba creado")
    
    def create_jenkins_pipeline_enhanced(self):
        """Crea un pipeline Jenkins mejorado para Kubernetes"""
        
        enhanced_pipeline = '''
pipeline {
    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
spec:
  serviceAccountName: jenkins-performance-tests
  containers:
  - name: kubectl
    image: bitnami/kubectl:latest
    command:
    - cat
    tty: true
  - name: python
    image: python:3.9-slim
    command:
    - cat
    tty: true
    volumeMounts:
    - name: jmeter-results
      mountPath: /results
  volumes:
  - name: jmeter-results
    persistentVolumeClaim:
      claimName: jmeter-results-pvc
"""
        }
    }
    
    parameters {
        choice(
            name: 'TEST_TYPE',
            choices: ['load', 'stress', 'volume', 'all'],
            description: 'Tipo de prueba de rendimiento'
        )
        string(
            name: 'BASE_URL',
            defaultValue: 'http://gateway-service:8080',
            description: 'URL base del sistema Karting'
        )
        booleanParam(
            name: 'VALIDATE_CRITERIA',
            defaultValue: true,
            description: 'Validar criterios de rendimiento'
        )
        booleanParam(
            name: 'GENERATE_REPORTS',
            defaultValue: true,
            description: 'Generar reportes consolidados'
        )
    }
    
    environment {
        TIMESTAMP = "${new Date().format('yyyy-MM-dd_HH-mm-ss')}"
        RESULTS_DIR = "/results/${TIMESTAMP}"
        NAMESPACE = "jenkins"
    }
    
    stages {
        stage('Validar Sistema') {
            steps {
                container('kubectl') {
                    script {
                        echo "🔍 Verificando disponibilidad del sistema Karting..."
                        
                        // Verificar que los servicios estén ejecutándose
                        sh """
                            kubectl get pods -l app=gateway-service -o jsonpath='{.items[*].status.phase}' | grep -q Running || {
                                echo "❌ Gateway service no disponible"
                                exit 1
                            }
                            
                            kubectl get pods -l app=eureka-service -o jsonpath='{.items[*].status.phase}' | grep -q Running || {
                                echo "❌ Eureka service no disponible"
                                exit 1
                            }
                            
                            echo "✅ Servicios del sistema verificados"
                        """
                    }
                }
            }
        }
        
        stage('Ejecutar Pruebas JMeter') {
            parallel {
                stage('Load Testing') {
                    when {
                        anyOf {
                            expression { params.TEST_TYPE == 'load' }
                            expression { params.TEST_TYPE == 'all' }
                        }
                    }
                    steps {
                        container('kubectl') {
                            script {
                                echo "📊 Ejecutando Load Testing en Kubernetes..."
                                sh """
                                    # Crear Job de JMeter para load testing
                                    envsubst < deployment/jenkins/jmeter-job-template.yaml | \\
                                    sed 's/\\${TEST_TYPE}/load/g' | \\
                                    sed 's/\\${BASE_URL}/${params.BASE_URL}/g' | \\
                                    sed 's/\\${USERS_COUNT}/100/g' | \\
                                    sed 's/\\${TIMESTAMP}/${TIMESTAMP}/g' | \\
                                    sed 's/\\${BUILD_NUMBER}/${BUILD_NUMBER}/g' | \\
                                    kubectl apply -f -
                                    
                                    # Esperar que el job complete
                                    kubectl wait --for=condition=complete job/jmeter-performance-test-load-${BUILD_NUMBER} --timeout=1800s
                                    
                                    echo "✅ Load Testing completado"
                                """
                            }
                        }
                    }
                }
                
                stage('Stress Testing') {
                    when {
                        anyOf {
                            expression { params.TEST_TYPE == 'stress' }
                            expression { params.TEST_TYPE == 'all' }
                        }
                    }
                    steps {
                        container('kubectl') {
                            script {
                                echo "⚡ Ejecutando Stress Testing en Kubernetes..."
                                sh """
                                    # Crear Job de JMeter para stress testing
                                    envsubst < deployment/jenkins/jmeter-job-template.yaml | \\
                                    sed 's/\\${TEST_TYPE}/stress/g' | \\
                                    sed 's/\\${BASE_URL}/${params.BASE_URL}/g' | \\
                                    sed 's/\\${USERS_COUNT}/500/g' | \\
                                    sed 's/\\${TIMESTAMP}/${TIMESTAMP}/g' | \\
                                    sed 's/\\${BUILD_NUMBER}/${BUILD_NUMBER}/g' | \\
                                    kubectl apply -f -
                                    
                                    # Esperar que el job complete
                                    kubectl wait --for=condition=complete job/jmeter-performance-test-stress-${BUILD_NUMBER} --timeout=1800s
                                    
                                    echo "✅ Stress Testing completado"
                                """
                            }
                        }
                    }
                }
                
                stage('Volume Testing') {
                    when {
                        anyOf {
                            expression { params.TEST_TYPE == 'volume' }
                            expression { params.TEST_TYPE == 'all' }
                        }
                    }
                    steps {
                        container('kubectl') {
                            script {
                                echo "🗂️ Ejecutando Volume Testing en Kubernetes..."
                                sh """
                                    # Crear Job de JMeter para volume testing
                                    envsubst < deployment/jenkins/jmeter-job-template.yaml | \\
                                    sed 's/\\${TEST_TYPE}/volume/g' | \\
                                    sed 's/\\${BASE_URL}/${params.BASE_URL}/g' | \\
                                    sed 's/\\${USERS_COUNT}/1000/g' | \\
                                    sed 's/\\${TIMESTAMP}/${TIMESTAMP}/g' | \\
                                    sed 's/\\${BUILD_NUMBER}/${BUILD_NUMBER}/g' | \\
                                    kubectl apply -f -
                                    
                                    # Esperar que el job complete
                                    kubectl wait --for=condition=complete job/jmeter-performance-test-volume-${BUILD_NUMBER} --timeout=1800s
                                    
                                    echo "✅ Volume Testing completado"
                                """
                            }
                        }
                    }
                }
            }
        }
        
        stage('Analizar Resultados') {
            when {
                expression { params.VALIDATE_CRITERIA }
            }
            steps {
                container('python') {
                    script {
                        echo "📈 Analizando métricas de rendimiento..."
                        sh """
                            # Instalar dependencias
                            pip install -r jenkins/requirements.txt
                            
                            # Analizar métricas
                            python jenkins/scripts/analyze-performance-metrics.py \\
                                --results-dir ${RESULTS_DIR} \\
                                --output ${RESULTS_DIR}/performance-analysis.json
                            
                            # Validar criterios
                            python jenkins/scripts/validate-performance-criteria.py \\
                                --analysis-file ${RESULTS_DIR}/performance-analysis.json \\
                                --criteria-file jenkins/performance-criteria.json \\
                                --output ${RESULTS_DIR}/validation-results.json
                        """
                    }
                }
            }
        }
        
        stage('Generar Reportes') {
            when {
                expression { params.GENERATE_REPORTS }
            }
            steps {
                container('python') {
                    script {
                        echo "📄 Generando reportes consolidados..."
                        sh """
                            # Generar reporte HTML
                            python jenkins/scripts/generate-consolidated-report.py \\
                                --results-dir ${RESULTS_DIR} \\
                                --output ${RESULTS_DIR}/reports/consolidated-report.html
                        """
                    }
                }
            }
        }
        
        stage('Limpiar Jobs') {
            steps {
                container('kubectl') {
                    script {
                        echo "🧹 Limpiando Jobs de JMeter..."
                        sh """
                            # Eliminar jobs completados
                            kubectl delete jobs -l app=jmeter-performance-test,build=${BUILD_NUMBER} --ignore-not-found=true
                        """
                    }
                }
            }
        }
    }
    
    post {
        always {
            // Archivar resultados
            archiveArtifacts artifacts: "${RESULTS_DIR}/**/*", allowEmptyArchive: true
            
            // Publicar reportes HTML
            publishHTML([
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: "${RESULTS_DIR}/reports",
                reportFiles: 'consolidated-report.html',
                reportName: 'Performance Test Report',
                reportTitles: 'Reporte de Rendimiento JMeter'
            ])
        }
        
        success {
            echo "✅ Pipeline de pruebas de rendimiento completado exitosamente"
        }
        
        failure {
            echo "❌ Pipeline de pruebas de rendimiento falló"
        }
    }
}
'''
        
        # Guardar pipeline mejorado
        with open('jenkins/Jenkinsfile.kubernetes', 'w') as f:
            f.write(enhanced_pipeline)
        
        print("✅ Pipeline Jenkins mejorado para Kubernetes creado")
    
    def generate_deployment_script(self):
        """Genera script para desplegar todos los recursos"""
        
        deploy_script = '''#!/bin/bash
set -e

echo "🚀 Desplegando infraestructura Jenkins-JMeter en Kubernetes..."

# Crear namespace si no existe
kubectl create namespace jenkins --dry-run=client -o yaml | kubectl apply -f -

# Aplicar recursos de RBAC
echo "🔐 Configurando permisos RBAC..."
kubectl apply -f deployment/jenkins/service-account.yaml
kubectl apply -f deployment/jenkins/cluster-role.yaml
kubectl apply -f deployment/jenkins/cluster-role-binding.yaml

# Crear PVC para resultados
echo "💾 Creando almacenamiento persistente..."
kubectl apply -f deployment/jenkins/jmeter-results-pvc.yaml

# Crear ConfigMap con planes de prueba
echo "📋 Desplegando planes de prueba JMeter..."
kubectl apply -f deployment/jenkins/jmeter-test-plans-configmap.yaml

echo "✅ Infraestructura desplegada exitosamente"
echo ""
echo "📋 Recursos creados:"
echo "   • ServiceAccount: jenkins-performance-tests"
echo "   • ClusterRole: jenkins-performance-tests"  
echo "   • ClusterRoleBinding: jenkins-performance-tests"
echo "   • PVC: jmeter-results-pvc (10Gi)"
echo "   • ConfigMap: jmeter-test-plans"
echo ""
echo "🔗 Próximos pasos:"
echo "   1. Configurar Jenkins pipeline con jenkins/Jenkinsfile.kubernetes"
echo "   2. Ejecutar pruebas desde Jenkins UI"
echo "   3. Revisar reportes en Jenkins artifacts"
'''
        
        with open('deploy-jenkins-infrastructure.sh', 'w') as f:
            f.write(deploy_script)
        
        # Hacer ejecutable
        os.chmod('deploy-jenkins-infrastructure.sh', 0o755)
        
        print("✅ Script de despliegue creado: deploy-jenkins-infrastructure.sh")
    
    def run_setup(self):
        """Ejecuta la configuración completa"""
        print("🏎️ Configurando integración Jenkins-Kubernetes-JMeter...")
        print("=" * 60)
        
        self.create_kubernetes_resources()
        self.create_jmeter_job_template()
        self.create_configmap_for_jmeter_tests()
        self.create_jenkins_pipeline_enhanced()
        self.generate_deployment_script()
        
        print("\n🎉 Configuración completada exitosamente!")
        print("\n📋 Archivos generados:")
        print("   • deployment/jenkins/*.yaml - Recursos de Kubernetes")
        print("   • jenkins/Jenkinsfile.kubernetes - Pipeline mejorado")
        print("   • deploy-jenkins-infrastructure.sh - Script de despliegue")
        
        print("\n🚀 Próximos pasos:")
        print("   1. Ejecutar: ./deploy-jenkins-infrastructure.sh")
        print("   2. Configurar Jenkins con jenkins/Jenkinsfile.kubernetes")
        print("   3. Ejecutar pipeline desde Jenkins UI")
        print("   4. Revisar reportes automatizados")

if __name__ == "__main__":
    setup = JenkinsKubernetesSetup()
    setup.run_setup()

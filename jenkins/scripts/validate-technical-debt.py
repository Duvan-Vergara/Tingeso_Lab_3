#!/usr/bin/env python3
"""
Script para validar criterios de mantenibilidad en SonarQube
Valida que la deuda técnica sea menor al 5% según los criterios de la rúbrica
"""

import json
import argparse
import sys
import time
from datetime import datetime

# Intentar importar requests, si no está disponible usar urllib
try:
    import requests
    HAS_REQUESTS = True
except ImportError:
    import urllib.request
    import urllib.parse
    import urllib.error
    HAS_REQUESTS = False
    print("⚠️ requests no disponible, usando urllib como fallback")


def make_request(url, params=None, headers=None, timeout=30):
    """Hacer request HTTP usando requests o urllib como fallback"""
    if HAS_REQUESTS:
        try:
            response = requests.get(url, params=params, headers=headers, timeout=timeout)
            return {
                'status_code': response.status_code,
                'json': lambda: response.json(),
                'text': response.text
            }
        except Exception as e:
            print(f"❌ Error con requests: {e}")
            return None
    else:
        try:
            # Construir URL con parámetros
            if params:
                url_parts = list(urllib.parse.urlparse(url))
                query = dict(urllib.parse.parse_qsl(url_parts[4]))
                query.update(params)
                url_parts[4] = urllib.parse.urlencode(query)
                url = urllib.parse.urlunparse(url_parts)
            
            # Crear request
            req = urllib.request.Request(url)
            if headers:
                for key, value in headers.items():
                    req.add_header(key, value)
            
            # Hacer request
            with urllib.request.urlopen(req, timeout=timeout) as response:
                content = response.read().decode('utf-8')
                return {
                    'status_code': response.getcode(),
                    'json': lambda: json.loads(content),
                    'text': content
                }
        except Exception as e:
            print(f"❌ Error con urllib: {e}")
            return None


def wait_for_sonarqube_analysis(sonar_url, project_key, token, max_wait=300):
    """Espera a que SonarQube complete el análisis del proyecto"""
    print(f"⏳ Esperando análisis de SonarQube para {project_key}...")
    
    headers = {'Authorization': f'Bearer {token}'}
    start_time = time.time()
    
    while time.time() - start_time < max_wait:
        try:
            # Verificar estado del análisis
            response = make_request(
                f"{sonar_url}/api/ce/component",
                params={'component': project_key},
                headers=headers,
                timeout=10
            )
            
            if response and response['status_code'] == 200:
                data = response['json']()
                if 'current' in data and data['current']['status'] == 'SUCCESS':
                    print(f"✅ Análisis completado para {project_key}")
                    return True
                elif 'current' in data and data['current']['status'] == 'FAILED':
                    print(f"❌ Análisis falló para {project_key}")
                    return False
            
            time.sleep(10)
        except Exception as e:
            print(f"⚠️ Error verificando estado: {e}")
            time.sleep(10)
    
    print(f"⏰ Timeout esperando análisis de {project_key}")
    return False


def get_project_metrics(sonar_url, project_key, token):
    """Obtiene métricas de calidad del proyecto desde SonarQube"""
    print(f"📊 Obteniendo métricas para {project_key}...")
    
    headers = {'Authorization': f'Bearer {token}'}
    
    # Métricas clave para mantenibilidad
    metrics = [
        'sqale_debt_ratio',  # Deuda técnica (%)
        'reliability_rating',  # Rating de confiabilidad
        'security_rating',  # Rating de seguridad
        'maintainability_rating',  # Rating de mantenibilidad
        'coverage',  # Cobertura de código
        'duplicated_lines_density',  # Densidad de líneas duplicadas
        'code_smells',  # Code smells
        'bugs',  # Bugs
        'vulnerabilities',  # Vulnerabilidades
        'ncloc',  # Líneas de código
        'complexity',  # Complejidad ciclomática
        'cognitive_complexity'  # Complejidad cognitiva
    ]
    
    try:
        response = make_request(
            f"{sonar_url}/api/measures/component",
            params={
                'component': project_key,
                'metricKeys': ','.join(metrics)
            },
            headers=headers,
            timeout=30
        )
        
        if response and response['status_code'] == 200:
            data = response['json']()
            project_metrics = {}
            
            if 'component' in data and 'measures' in data['component']:
                for measure in data['component']['measures']:
                    metric_key = measure['metric']
                    value = measure.get('value', '0')
                    project_metrics[metric_key] = value
                
                print(f"✅ Métricas obtenidas para {project_key}")
                return project_metrics
            else:
                print(f"⚠️ No se encontraron medidas para {project_key}")
                return {}
        else:
            print(f"❌ Error obteniendo métricas para {project_key}: {response['status_code'] if response else 'No response'}")
            if response:
                print(f"Response: {response['text']}")
            return {}
            
    except Exception as e:
        print(f"❌ Error al conectar con SonarQube: {e}")
        return {}


def validate_maintainability_criteria(backend_metrics, frontend_metrics, max_debt_ratio):
    """Valida los criterios de mantenibilidad según la rúbrica"""
    
    results = {
        'timestamp': datetime.now().isoformat(),
        'criteria_validation': {},
        'backend_metrics': backend_metrics,
        'frontend_metrics': frontend_metrics,
        'overall_status': 'PASSED',
        'recommendations': []
    }
    
    # Criterio 1: Deuda Técnica < 5%
    backend_debt = float(backend_metrics.get('sqale_debt_ratio', '0'))
    frontend_debt = float(frontend_metrics.get('sqale_debt_ratio', '0'))
    
    debt_passed = backend_debt <= max_debt_ratio and frontend_debt <= max_debt_ratio
    results['criteria_validation']['technical_debt'] = {
        'criterion': f'Deuda técnica <= {max_debt_ratio}%',
        'backend_debt': backend_debt,
        'frontend_debt': frontend_debt,
        'passed': debt_passed,
        'details': f'Backend: {backend_debt}%, Frontend: {frontend_debt}%'
    }
    
    if not debt_passed:
        results['overall_status'] = 'FAILED'
        results['recommendations'].append(f'Reducir deuda técnica: Backend={backend_debt}%, Frontend={frontend_debt}%')
    
    # Criterio 2: Rating de Mantenibilidad (A o B)
    backend_maintainability = backend_metrics.get('maintainability_rating', '5')
    frontend_maintainability = frontend_metrics.get('maintainability_rating', '5')
    
    # Ratings: 1=A, 2=B, 3=C, 4=D, 5=E
    maintainability_passed = (int(backend_maintainability) <= 2 and 
                             int(frontend_maintainability) <= 2)
    
    results['criteria_validation']['maintainability_rating'] = {
        'criterion': 'Rating de mantenibilidad A o B',
        'backend_rating': backend_maintainability,
        'frontend_rating': frontend_maintainability,
        'passed': maintainability_passed,
        'details': f'Backend: {get_rating_letter(backend_maintainability)}, Frontend: {get_rating_letter(frontend_maintainability)}'
    }
    
    if not maintainability_passed:
        results['overall_status'] = 'FAILED'
        results['recommendations'].append('Mejorar rating de mantenibilidad')
    
    # Criterio 3: Densidad de duplicación < 3%
    backend_duplication = float(backend_metrics.get('duplicated_lines_density', '0'))
    frontend_duplication = float(frontend_metrics.get('duplicated_lines_density', '0'))
    
    duplication_passed = backend_duplication <= 3.0 and frontend_duplication <= 3.0
    results['criteria_validation']['code_duplication'] = {
        'criterion': 'Densidad de duplicación <= 3%',
        'backend_duplication': backend_duplication,
        'frontend_duplication': frontend_duplication,
        'passed': duplication_passed,
        'details': f'Backend: {backend_duplication}%, Frontend: {frontend_duplication}%'
    }
    
    if not duplication_passed:
        results['overall_status'] = 'FAILED'
        results['recommendations'].append(f'Reducir duplicación de código: Backend={backend_duplication}%, Frontend={frontend_duplication}%')
    
    # Criterio 4: Complejidad cognitiva razonable
    backend_complexity = int(backend_metrics.get('cognitive_complexity', '0'))
    frontend_complexity = int(frontend_metrics.get('cognitive_complexity', '0'))
    
    # Límites razonables basados en el tamaño del proyecto
    backend_lines = int(backend_metrics.get('ncloc', '1'))
    frontend_lines = int(frontend_metrics.get('ncloc', '1'))
    
    # Complejidad por línea de código (heurística)
    backend_complexity_ratio = backend_complexity / max(backend_lines, 1) if backend_lines > 0 else 0
    frontend_complexity_ratio = frontend_complexity / max(frontend_lines, 1) if frontend_lines > 0 else 0
    
    complexity_passed = backend_complexity_ratio <= 0.5 and frontend_complexity_ratio <= 0.5
    results['criteria_validation']['cognitive_complexity'] = {
        'criterion': 'Complejidad cognitiva razonable',
        'backend_complexity': backend_complexity,
        'frontend_complexity': frontend_complexity,
        'backend_ratio': round(backend_complexity_ratio, 3),
        'frontend_ratio': round(frontend_complexity_ratio, 3),
        'passed': complexity_passed,
        'details': f'Backend: {backend_complexity} ({round(backend_complexity_ratio, 3)}), Frontend: {frontend_complexity} ({round(frontend_complexity_ratio, 3)})'
    }
    
    if not complexity_passed:
        results['recommendations'].append('Revisar complejidad cognitiva del código')
    
    return results


def get_rating_letter(rating_number):
    """Convierte número de rating a letra"""
    rating_map = {'1': 'A', '2': 'B', '3': 'C', '4': 'D', '5': 'E'}
    return rating_map.get(str(rating_number), 'E')


def generate_report(results, output_file):
    """Genera reporte de validación de mantenibilidad"""
    
    print("\n" + "="*60)
    print("📊 REPORTE DE VALIDACIÓN DE MANTENIBILIDAD")
    print("="*60)
    
    print(f"\n⏰ Timestamp: {results['timestamp']}")
    print(f"🎯 Estado General: {results['overall_status']}")
    
    print("\n📋 CRITERIOS VALIDADOS:")
    for criterion, data in results['criteria_validation'].items():
        status = "✅ PASSED" if data['passed'] else "❌ FAILED"
        print(f"\n• {criterion.upper()}")
        print(f"  Criterio: {data['criterion']}")
        print(f"  Estado: {status}")
        print(f"  Detalles: {data['details']}")
    
    if results['recommendations']:
        print("\n💡 RECOMENDACIONES:")
        for i, rec in enumerate(results['recommendations'], 1):
            print(f"  {i}. {rec}")
    
    print("\n📊 MÉTRICAS DETALLADAS:")
    print("\nBackend:")
    for metric, value in results['backend_metrics'].items():
        print(f"  • {metric}: {value}")
    
    print("\nFrontend:")
    for metric, value in results['frontend_metrics'].items():
        print(f"  • {metric}: {value}")
    
    # Guardar reporte JSON
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    
    print(f"\n💾 Reporte guardado en: {output_file}")
    
    return results['overall_status'] == 'PASSED'


def main():
    parser = argparse.ArgumentParser(description='Validar criterios de mantenibilidad en SonarQube')
    parser.add_argument('--sonar-url', required=True, help='URL de SonarQube')
    parser.add_argument('--sonar-token', required=True, help='Token de autenticación de SonarQube')
    parser.add_argument('--backend-project', required=True, help='Clave del proyecto backend')
    parser.add_argument('--frontend-project', required=True, help='Clave del proyecto frontend')
    parser.add_argument('--max-debt-ratio', type=float, default=5.0, help='Máximo ratio de deuda técnica permitido (%)')
    parser.add_argument('--output', required=True, help='Archivo de salida para el reporte JSON')
    parser.add_argument('--wait-analysis', action='store_true', help='Esperar a que complete el análisis')
    
    args = parser.parse_args()
    
    print("🔍 Iniciando validación de criterios de mantenibilidad...")
    print(f"SonarQube URL: {args.sonar_url}")
    print(f"Proyecto Backend: {args.backend_project}")
    print(f"Proyecto Frontend: {args.frontend_project}")
    print(f"Máximo ratio de deuda técnica: {args.max_debt_ratio}%")
    
    # Esperar análisis si se solicita
    if args.wait_analysis:
        wait_for_sonarqube_analysis(args.sonar_url, args.backend_project, args.sonar_token)
        wait_for_sonarqube_analysis(args.sonar_url, args.frontend_project, args.sonar_token)
    
    # Obtener métricas
    backend_metrics = get_project_metrics(args.sonar_url, args.backend_project, args.sonar_token)
    frontend_metrics = get_project_metrics(args.sonar_url, args.frontend_project, args.sonar_token)
    
    if not backend_metrics and not frontend_metrics:
        print("❌ No se pudieron obtener métricas de ningún proyecto")
        sys.exit(1)
    
    # Validar criterios
    results = validate_maintainability_criteria(backend_metrics, frontend_metrics, args.max_debt_ratio)
    
    # Generar reporte
    passed = generate_report(results, args.output)
    
    if passed:
        print("\n✅ Todos los criterios de mantenibilidad han sido cumplidos")
        sys.exit(0)
    else:
        print("\n❌ Algunos criterios de mantenibilidad no han sido cumplidos")
        sys.exit(1)


if __name__ == '__main__':
    main()

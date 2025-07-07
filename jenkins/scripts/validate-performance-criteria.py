#!/usr/bin/env python3
"""
Script para validar criterios de rendimiento
Compara los resultados de las pruebas con los criterios establecidos
"""

import json
import argparse
import sys
from datetime import datetime

class PerformanceValidator:
    def __init__(self, criteria_file):
        with open(criteria_file, 'r', encoding='utf-8') as f:
            self.criteria = json.load(f)
        
        self.validation_results = {
            "timestamp": datetime.now().isoformat(),
            "overall_status": "unknown",
            "passed_criteria": [],
            "failed_criteria": [],
            "warnings": [],
            "summary": {}
        }
    
    def validate_test_type(self, test_type, analysis_data):
        """Valida un tipo de prueba específico"""
        if test_type not in self.criteria['performance_criteria']:
            print(f"⚠️ No hay criterios definidos para {test_type}")
            return
        
        criteria = self.criteria['performance_criteria'][test_type]
        results = []
        
        print(f"\n🔍 Validando {test_type}...")
        
        # Validar tiempo de respuesta máximo
        max_response = analysis_data.get('max_response_time_ms', 0)
        if max_response <= criteria['max_response_time_ms']:
            results.append({
                'criterion': f'{test_type}_max_response_time',
                'status': 'PASS',
                'value': max_response,
                'threshold': criteria['max_response_time_ms'],
                'message': f"Tiempo de respuesta máximo: {max_response}ms ≤ {criteria['max_response_time_ms']}ms"
            })
        else:
            results.append({
                'criterion': f'{test_type}_max_response_time',
                'status': 'FAIL',
                'value': max_response,
                'threshold': criteria['max_response_time_ms'],
                'message': f"Tiempo de respuesta máximo excedido: {max_response}ms > {criteria['max_response_time_ms']}ms"
            })
        
        # Validar tasa de error
        error_rate = analysis_data.get('error_rate_percent', 0)
        if error_rate <= criteria['max_error_rate_percent']:
            results.append({
                'criterion': f'{test_type}_error_rate',
                'status': 'PASS',
                'value': error_rate,
                'threshold': criteria['max_error_rate_percent'],
                'message': f"Tasa de error: {error_rate:.2f}% ≤ {criteria['max_error_rate_percent']}%"
            })
        else:
            results.append({
                'criterion': f'{test_type}_error_rate',
                'status': 'FAIL',
                'value': error_rate,
                'threshold': criteria['max_error_rate_percent'],
                'message': f"Tasa de error excedida: {error_rate:.2f}% > {criteria['max_error_rate_percent']}%"
            })
        
        # Validar tiempo de respuesta promedio
        avg_response = analysis_data.get('avg_response_time_ms', 0)
        if avg_response <= criteria['max_avg_response_time_ms']:
            results.append({
                'criterion': f'{test_type}_avg_response_time',
                'status': 'PASS',
                'value': avg_response,
                'threshold': criteria['max_avg_response_time_ms'],
                'message': f"Tiempo de respuesta promedio: {avg_response:.2f}ms ≤ {criteria['max_avg_response_time_ms']}ms"
            })
        else:
            results.append({
                'criterion': f'{test_type}_avg_response_time',
                'status': 'FAIL',
                'value': avg_response,
                'threshold': criteria['max_avg_response_time_ms'],
                'message': f"Tiempo de respuesta promedio excedido: {avg_response:.2f}ms > {criteria['max_avg_response_time_ms']}ms"
            })
        
        return results
    
    def validate_endpoints(self, analysis_data):
        """Valida endpoints específicos"""
        endpoint_results = []
        
        print(f"\n🔍 Validando endpoints críticos...")
        
        for test_type in ['load_testing', 'stress_testing', 'volume_testing']:
            if test_type in analysis_data and 'endpoints' in analysis_data[test_type]:
                endpoints_data = analysis_data[test_type]['endpoints']
                
                for endpoint_path, criteria in self.criteria['endpoints_criteria'].items():
                    # Buscar endpoint en los datos
                    matching_endpoint = None
                    for endpoint_name, endpoint_data in endpoints_data.items():
                        if endpoint_path in endpoint_name:
                            matching_endpoint = endpoint_data
                            break
                    
                    if matching_endpoint:
                        # Validar tiempo de respuesta
                        max_response = matching_endpoint.get('max_response_time_ms', 0)
                        if max_response <= criteria['max_response_time_ms']:
                            endpoint_results.append({
                                'criterion': f'{endpoint_path}_response_time_{test_type}',
                                'status': 'PASS',
                                'value': max_response,
                                'threshold': criteria['max_response_time_ms'],
                                'message': f"{endpoint_path} ({test_type}): {max_response:.2f}ms ≤ {criteria['max_response_time_ms']}ms"
                            })
                        else:
                            endpoint_results.append({
                                'criterion': f'{endpoint_path}_response_time_{test_type}',
                                'status': 'FAIL',
                                'value': max_response,
                                'threshold': criteria['max_response_time_ms'],
                                'message': f"{endpoint_path} ({test_type}): {max_response:.2f}ms > {criteria['max_response_time_ms']}ms"
                            })
                        
                        # Validar tasa de error
                        error_rate = matching_endpoint.get('error_rate_percent', 0)
                        if error_rate <= criteria['max_error_rate_percent']:
                            endpoint_results.append({
                                'criterion': f'{endpoint_path}_error_rate_{test_type}',
                                'status': 'PASS',
                                'value': error_rate,
                                'threshold': criteria['max_error_rate_percent'],
                                'message': f"{endpoint_path} ({test_type}): {error_rate:.2f}% ≤ {criteria['max_error_rate_percent']}%"
                            })
                        else:
                            endpoint_results.append({
                                'criterion': f'{endpoint_path}_error_rate_{test_type}',
                                'status': 'FAIL',
                                'value': error_rate,
                                'threshold': criteria['max_error_rate_percent'],
                                'message': f"{endpoint_path} ({test_type}): {error_rate:.2f}% > {criteria['max_error_rate_percent']}%"
                            })
        
        return endpoint_results
    
    def validate_analysis(self, analysis_data):
        """Valida el análisis completo"""
        print("🔍 Iniciando validación de criterios de rendimiento...")
        
        all_results = []
        
        # Validar cada tipo de prueba
        for test_type in ['load_testing', 'stress_testing', 'volume_testing']:
            if test_type in analysis_data and analysis_data[test_type]:
                results = self.validate_test_type(test_type, analysis_data[test_type])
                all_results.extend(results)
        
        # Validar endpoints
        endpoint_results = self.validate_endpoints(analysis_data)
        all_results.extend(endpoint_results)
        
        # Clasificar resultados
        passed = [r for r in all_results if r['status'] == 'PASS']
        failed = [r for r in all_results if r['status'] == 'FAIL']
        
        self.validation_results['passed_criteria'] = passed
        self.validation_results['failed_criteria'] = failed
        
        # Determinar estado general
        if len(failed) == 0:
            self.validation_results['overall_status'] = 'PASS'
        elif len(failed) <= len(all_results) * 0.2:  # Menos del 20% de fallas
            self.validation_results['overall_status'] = 'PASS_WITH_WARNINGS'
        else:
            self.validation_results['overall_status'] = 'FAIL'
        
        # Generar resumen
        self.validation_results['summary'] = {
            'total_criteria': len(all_results),
            'passed_count': len(passed),
            'failed_count': len(failed),
            'pass_rate_percent': (len(passed) / len(all_results)) * 100 if all_results else 0
        }
        
        return self.validation_results
    
    def print_results(self):
        """Imprime los resultados de la validación"""
        print(f"\n{'='*60}")
        print(f"📊 RESULTADOS DE VALIDACIÓN DE RENDIMIENTO")
        print(f"{'='*60}")
        
        summary = self.validation_results['summary']
        print(f"Estado general: {self.validation_results['overall_status']}")
        print(f"Criterios evaluados: {summary['total_criteria']}")
        print(f"Criterios aprobados: {summary['passed_count']}")
        print(f"Criterios fallidos: {summary['failed_count']}")
        print(f"Tasa de aprobación: {summary['pass_rate_percent']:.1f}%")
        
        if self.validation_results['failed_criteria']:
            print(f"\n❌ CRITERIOS FALLIDOS ({len(self.validation_results['failed_criteria'])}):")
            for failure in self.validation_results['failed_criteria']:
                print(f"   • {failure['message']}")
        
        if self.validation_results['passed_criteria']:
            print(f"\n✅ CRITERIOS APROBADOS ({len(self.validation_results['passed_criteria'])}):")
            for success in self.validation_results['passed_criteria'][:5]:  # Mostrar primeros 5
                print(f"   • {success['message']}")
            
            if len(self.validation_results['passed_criteria']) > 5:
                print(f"   ... y {len(self.validation_results['passed_criteria']) - 5} más")

def main():
    parser = argparse.ArgumentParser(description='Validar criterios de rendimiento')
    parser.add_argument('--analysis-file', required=True, help='Archivo JSON con análisis de rendimiento')
    parser.add_argument('--criteria-file', required=True, help='Archivo JSON con criterios de rendimiento')
    parser.add_argument('--output', help='Archivo de salida para resultados de validación')
    
    args = parser.parse_args()
    
    # Cargar análisis
    try:
        with open(args.analysis_file, 'r', encoding='utf-8') as f:
            analysis_data = json.load(f)
    except FileNotFoundError:
        print(f"❌ Archivo de análisis no encontrado: {args.analysis_file}")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"❌ Error al leer archivo de análisis: {args.analysis_file}")
        sys.exit(1)
    
    # Validar
    validator = PerformanceValidator(args.criteria_file)
    results = validator.validate_analysis(analysis_data)
    
    # Mostrar resultados
    validator.print_results()
    
    # Guardar resultados si se especifica
    if args.output:
        with open(args.output, 'w', encoding='utf-8') as f:
            json.dump(results, f, indent=2, ensure_ascii=False)
        print(f"\n📄 Resultados guardados en: {args.output}")
    
    # Determinar código de salida
    if results['overall_status'] == 'FAIL':
        print(f"\n❌ Validación FALLIDA - Criterios de rendimiento no cumplidos")
        sys.exit(1)
    elif results['overall_status'] == 'PASS_WITH_WARNINGS':
        print(f"\n⚠️ Validación APROBADA CON ADVERTENCIAS")
        sys.exit(0)
    else:
        print(f"\n✅ Validación EXITOSA - Todos los criterios cumplidos")
        sys.exit(0)

if __name__ == "__main__":
    main()

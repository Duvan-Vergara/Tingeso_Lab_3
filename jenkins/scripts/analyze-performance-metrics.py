#!/usr/bin/env python3
"""
Script para analizar métricas de rendimiento de JMeter
Genera un análisis detallado de los resultados de las pruebas
"""

import json
import csv
import argparse
import os
from datetime import datetime
from statistics import mean, median
import xml.etree.ElementTree as ET

class PerformanceAnalyzer:
    def __init__(self, results_dir):
        self.results_dir = results_dir
        self.analysis = {
            "timestamp": datetime.now().isoformat(),
            "summary": {},
            "load_testing": {},
            "stress_testing": {},
            "volume_testing": {},
            "endpoints_analysis": {},
            "recommendations": []
        }
    
    def analyze_jtl_file(self, jtl_file, test_type):
        """Analiza un archivo JTL de JMeter"""
        if not os.path.exists(jtl_file):
            print(f"⚠️ Archivo {jtl_file} no encontrado")
            return None
        
        print(f"📊 Analizando {test_type}: {jtl_file}")
        
        response_times = []
        errors = []
        endpoints = {}
        total_requests = 0
        
        try:
            with open(jtl_file, 'r', encoding='utf-8') as file:
                reader = csv.DictReader(file)
                
                for row in reader:
                    total_requests += 1
                    
                    # Tiempo de respuesta
                    response_time = int(row.get('elapsed', 0))
                    response_times.append(response_time)
                    
                    # Errores
                    success = row.get('success', 'true').lower() == 'true'
                    if not success:
                        errors.append({
                            'timestamp': row.get('timeStamp', ''),
                            'label': row.get('label', ''),
                            'error': row.get('failureMessage', 'Unknown error')
                        })
                    
                    # Análisis por endpoint
                    label = row.get('label', 'unknown')
                    if label not in endpoints:
                        endpoints[label] = {
                            'response_times': [],
                            'errors': 0,
                            'total_requests': 0
                        }
                    
                    endpoints[label]['response_times'].append(response_time)
                    endpoints[label]['total_requests'] += 1
                    if not success:
                        endpoints[label]['errors'] += 1
        
        except Exception as e:
            print(f"❌ Error procesando {jtl_file}: {e}")
            return None
        
        if total_requests == 0:
            print(f"⚠️ No se encontraron datos en {jtl_file}")
            return None
        
        # Calcular métricas
        analysis = {
            'total_requests': total_requests,
            'error_count': len(errors),
            'error_rate_percent': (len(errors) / total_requests) * 100,
            'avg_response_time_ms': mean(response_times) if response_times else 0,
            'median_response_time_ms': median(response_times) if response_times else 0,
            'min_response_time_ms': min(response_times) if response_times else 0,
            'max_response_time_ms': max(response_times) if response_times else 0,
            'p95_response_time_ms': self.percentile(response_times, 95) if response_times else 0,
            'p99_response_time_ms': self.percentile(response_times, 99) if response_times else 0,
            'endpoints': {}
        }
        
        # Análisis por endpoint
        for endpoint, data in endpoints.items():
            if data['total_requests'] > 0:
                analysis['endpoints'][endpoint] = {
                    'total_requests': data['total_requests'],
                    'error_count': data['errors'],
                    'error_rate_percent': (data['errors'] / data['total_requests']) * 100,
                    'avg_response_time_ms': mean(data['response_times']),
                    'max_response_time_ms': max(data['response_times']),
                    'min_response_time_ms': min(data['response_times'])
                }
        
        return analysis
    
    def percentile(self, data, percentile):
        """Calcula un percentil de una lista de datos"""
        if not data:
            return 0
        sorted_data = sorted(data)
        index = int((percentile / 100) * len(sorted_data))
        return sorted_data[min(index, len(sorted_data) - 1)]
    
    def generate_recommendations(self):
        """Genera recomendaciones basadas en el análisis"""
        recommendations = []
        
        # Analizar load testing
        if 'load_testing' in self.analysis and self.analysis['load_testing']:
            load = self.analysis['load_testing']
            if load.get('avg_response_time_ms', 0) > 1000:
                recommendations.append({
                    'type': 'performance',
                    'priority': 'high',
                    'message': f"Tiempo de respuesta promedio alto en load testing: {load['avg_response_time_ms']:.2f}ms. Considerar optimización de base de datos y caché."
                })
            
            if load.get('error_rate_percent', 0) > 1:
                recommendations.append({
                    'type': 'reliability',
                    'priority': 'critical',
                    'message': f"Tasa de error alta en load testing: {load['error_rate_percent']:.2f}%. Revisar logs de aplicación."
                })
        
        # Analizar stress testing
        if 'stress_testing' in self.analysis and self.analysis['stress_testing']:
            stress = self.analysis['stress_testing']
            if stress.get('error_rate_percent', 0) > 5:
                recommendations.append({
                    'type': 'scalability',
                    'priority': 'high',
                    'message': f"Sistema no maneja bien la carga de estrés. Tasa de error: {stress['error_rate_percent']:.2f}%. Considerar escalamiento horizontal."
                })
        
        # Analizar endpoints críticos
        for test_type in ['load_testing', 'stress_testing', 'volume_testing']:
            if test_type in self.analysis and self.analysis[test_type].get('endpoints'):
                for endpoint, data in self.analysis[test_type]['endpoints'].items():
                    if '/api/reserve' in endpoint and data.get('avg_response_time_ms', 0) > 2000:
                        recommendations.append({
                            'type': 'critical_endpoint',
                            'priority': 'critical',
                            'message': f"Endpoint crítico /api/reserve con tiempo de respuesta alto: {data['avg_response_time_ms']:.2f}ms en {test_type}"
                        })
        
        self.analysis['recommendations'] = recommendations
    
    def run_analysis(self):
        """Ejecuta el análisis completo"""
        print("🔍 Iniciando análisis de métricas de rendimiento...")
        
        # Analizar diferentes tipos de pruebas
        test_files = {
            'load_testing': os.path.join(self.results_dir, 'load-test-results.jtl'),
            'stress_testing': os.path.join(self.results_dir, 'stress-test-results.jtl'),
            'volume_testing': os.path.join(self.results_dir, 'volume-test-results.jtl')
        }
        
        for test_type, file_path in test_files.items():
            analysis = self.analyze_jtl_file(file_path, test_type)
            if analysis:
                self.analysis[test_type] = analysis
        
        # Generar resumen
        self.generate_summary()
        
        # Generar recomendaciones
        self.generate_recommendations()
        
        print("✅ Análisis completado")
        return self.analysis
    
    def generate_summary(self):
        """Genera un resumen ejecutivo"""
        summary = {
            'tests_executed': [],
            'overall_performance': 'unknown',
            'critical_issues': 0,
            'total_requests': 0,
            'total_errors': 0
        }
        
        for test_type in ['load_testing', 'stress_testing', 'volume_testing']:
            if test_type in self.analysis and self.analysis[test_type]:
                summary['tests_executed'].append(test_type)
                summary['total_requests'] += self.analysis[test_type].get('total_requests', 0)
                summary['total_errors'] += self.analysis[test_type].get('error_count', 0)
        
        # Calcular rendimiento general
        if summary['total_requests'] > 0:
            overall_error_rate = (summary['total_errors'] / summary['total_requests']) * 100
            if overall_error_rate < 1:
                summary['overall_performance'] = 'excellent'
            elif overall_error_rate < 3:
                summary['overall_performance'] = 'good'
            elif overall_error_rate < 7:
                summary['overall_performance'] = 'acceptable'
            else:
                summary['overall_performance'] = 'poor'
        
        self.analysis['summary'] = summary

def main():
    parser = argparse.ArgumentParser(description='Analizar métricas de rendimiento de JMeter')
    parser.add_argument('--results-dir', required=True, help='Directorio con resultados de JMeter')
    parser.add_argument('--output', required=True, help='Archivo de salida para el análisis JSON')
    
    args = parser.parse_args()
    
    if not os.path.exists(args.results_dir):
        print(f"❌ Directorio de resultados no encontrado: {args.results_dir}")
        exit(1)
    
    analyzer = PerformanceAnalyzer(args.results_dir)
    analysis = analyzer.run_analysis()
    
    # Guardar análisis
    os.makedirs(os.path.dirname(args.output), exist_ok=True)
    with open(args.output, 'w', encoding='utf-8') as f:
        json.dump(analysis, f, indent=2, ensure_ascii=False)
    
    print(f"📄 Análisis guardado en: {args.output}")
    
    # Mostrar resumen
    summary = analysis.get('summary', {})
    print(f"\n📊 RESUMEN EJECUTIVO:")
    print(f"   Pruebas ejecutadas: {', '.join(summary.get('tests_executed', []))}")
    print(f"   Rendimiento general: {summary.get('overall_performance', 'unknown')}")
    print(f"   Total requests: {summary.get('total_requests', 0)}")
    print(f"   Total errores: {summary.get('total_errors', 0)}")
    
    recommendations = analysis.get('recommendations', [])
    if recommendations:
        print(f"\n⚠️ RECOMENDACIONES ({len(recommendations)}):")
        for rec in recommendations[:5]:  # Mostrar las primeras 5
            print(f"   [{rec['priority'].upper()}] {rec['message']}")

if __name__ == "__main__":
    main()

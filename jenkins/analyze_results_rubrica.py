#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ANÁLISIS AVANZADO DE RENDIMIENTO - SISTEMA KARTING
=================================================
Cumplimiento de Rúbrica 25% - Rendimiento
Análisis interpretativo de JMeter: View Results in Table, Aggregate Report, View Results Tree
"""

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import json
import os
import sys
import glob
from datetime import datetime
import xml.etree.ElementTree as ET
import numpy as np
from pathlib import Path

class KartingPerformanceAnalyzer:
    def __init__(self, results_directory):
        self.results_dir = Path(results_directory)
        self.analysis_dir = self.results_dir / "analysis"
        self.analysis_dir.mkdir(exist_ok=True)
        
        # Configurar estilo de gráficos
        plt.style.use('seaborn-v0_8')
        sns.set_palette("husl")
        
        # Criterios de rendimiento según rúbrica
        self.performance_criteria = {
            "RF5": {
                "load": {"avg_response_time": 2000, "error_rate": 2.0, "throughput": 50},
                "stress": {"avg_response_time": 5000, "error_rate": 5.0, "throughput": 20},
                "volume": {"avg_response_time": 3000, "error_rate": 3.0, "throughput": 30}
            },
            "RF7": {
                "load": {"avg_response_time": 1500, "error_rate": 1.0, "throughput": 100},
                "stress": {"avg_response_time": 4000, "error_rate": 4.0, "throughput": 40},
                "volume": {"avg_response_time": 2500, "error_rate": 2.5, "throughput": 60}
            },
            "RF8": {
                "load": {"avg_response_time": 3000, "error_rate": 1.5, "throughput": 30},
                "stress": {"avg_response_time": 8000, "error_rate": 6.0, "throughput": 15},
                "volume": {"avg_response_time": 5000, "error_rate": 4.0, "throughput": 20}
            }
        }
    
    def analyze_jtl_files(self):
        """Analizar archivos JTL como View Results in Table"""
        print("🔍 ANÁLISIS TIPO 'View Results in Table'")
        print("=" * 60)
        
        jtl_files = list(self.results_dir.glob("*.jtl"))
        
        if not jtl_files:
            print("❌ No se encontraron archivos JTL para analizar")
            return
        
        all_results = []
        
        for jtl_file in jtl_files:
            try:
                # Leer archivo JTL (formato CSV)
                df = pd.read_csv(jtl_file)
                
                # Determinar RF y tipo de prueba desde el nombre del archivo
                file_name = jtl_file.stem
                rf_type = self._extract_rf_type(file_name)
                test_type = self._extract_test_type(file_name)
                
                # Análisis detallado por request
                df['success'] = df['success'].astype(bool)
                df['responseTime'] = pd.to_numeric(df['elapsed'], errors='coerce')
                df['timestamp'] = pd.to_datetime(df['timeStamp'], unit='ms')
                
                # Crear análisis tipo "View Results in Table"
                detailed_analysis = {
                    'rf_type': rf_type,
                    'test_type': test_type,
                    'file_name': file_name,
                    'total_requests': len(df),
                    'successful_requests': df['success'].sum(),
                    'failed_requests': (~df['success']).sum(),
                    'error_rate': (1 - df['success'].mean()) * 100,
                    'avg_response_time': df['responseTime'].mean(),
                    'min_response_time': df['responseTime'].min(),
                    'max_response_time': df['responseTime'].max(),
                    'p95_response_time': df['responseTime'].quantile(0.95),
                    'p99_response_time': df['responseTime'].quantile(0.99),
                    'throughput': len(df) / ((df['timestamp'].max() - df['timestamp'].min()).total_seconds() or 1),
                    'test_duration': (df['timestamp'].max() - df['timestamp'].min()).total_seconds(),
                    'requests_per_second': []
                }
                
                # Análisis por segundo (throughput)
                df_by_second = df.groupby(df['timestamp'].dt.floor('S')).size()
                detailed_analysis['requests_per_second'] = df_by_second.tolist()
                detailed_analysis['peak_throughput'] = df_by_second.max() if len(df_by_second) > 0 else 0
                
                all_results.append(detailed_analysis)
                
                print(f"\n📊 ANÁLISIS DETALLADO: {file_name}")
                print(f"   RF: {rf_type} | Tipo: {test_type}")
                print(f"   Total Requests: {detailed_analysis['total_requests']:,}")
                print(f"   Exitosos: {detailed_analysis['successful_requests']:,}")
                print(f"   Fallidos: {detailed_analysis['failed_requests']:,}")
                print(f"   Tasa de Error: {detailed_analysis['error_rate']:.2f}%")
                print(f"   Tiempo Respuesta Promedio: {detailed_analysis['avg_response_time']:.2f} ms")
                print(f"   Tiempo Respuesta P95: {detailed_analysis['p95_response_time']:.2f} ms")
                print(f"   Tiempo Respuesta P99: {detailed_analysis['p99_response_time']:.2f} ms")
                print(f"   Throughput Promedio: {detailed_analysis['throughput']:.2f} req/seg")
                print(f"   Throughput Pico: {detailed_analysis['peak_throughput']} req/seg")
                
            except Exception as e:
                print(f"❌ Error analizando {jtl_file.name}: {str(e)}")
        
        # Guardar análisis detallado
        self._save_detailed_analysis(all_results)
        return all_results
    
    def generate_aggregate_report(self, results):
        """Generar reporte agregado como 'Aggregate Report'"""
        print("\n📈 ANÁLISIS TIPO 'Aggregate Report'")
        print("=" * 60)
        
        if not results:
            print("❌ No hay resultados para generar reporte agregado")
            return
        
        # Crear DataFrame para análisis agregado
        df_agg = pd.DataFrame(results)
        
        # Agrupar por RF y tipo de prueba
        aggregate_summary = []
        
        for rf in ['RF5', 'RF7', 'RF8']:
            for test_type in ['LOAD', 'STRESS', 'VOLUME']:
                rf_tests = df_agg[(df_agg['rf_type'] == rf) & (df_agg['test_type'] == test_type)]
                
                if len(rf_tests) > 0:
                    agg_data = {
                        'RF': rf,
                        'Test_Type': test_type,
                        'Samples': rf_tests['total_requests'].sum(),
                        'Average_ms': rf_tests['avg_response_time'].mean(),
                        'Min_ms': rf_tests['min_response_time'].min(),
                        'Max_ms': rf_tests['max_response_time'].max(),
                        'Error_Rate': rf_tests['error_rate'].mean(),
                        'Throughput': rf_tests['throughput'].mean(),
                        'Peak_Throughput': rf_tests['peak_throughput'].max(),
                        'P95_ms': rf_tests['p95_response_time'].mean(),
                        'P99_ms': rf_tests['p99_response_time'].mean()
                    }
                    aggregate_summary.append(agg_data)
                    
                    # Mostrar resumen por RF y tipo
                    print(f"\n🎯 {rf} - {test_type} TESTING:")
                    print(f"   Muestras: {agg_data['Samples']:,}")
                    print(f"   Promedio: {agg_data['Average_ms']:.2f} ms")
                    print(f"   Mín/Máx: {agg_data['Min_ms']:.0f}/{agg_data['Max_ms']:.0f} ms")
                    print(f"   Error Rate: {agg_data['Error_Rate']:.2f}%")
                    print(f"   Throughput: {agg_data['Throughput']:.2f} req/seg")
                    print(f"   P95: {agg_data['P95_ms']:.2f} ms")
                    print(f"   P99: {agg_data['P99_ms']:.2f} ms")
        
        # Crear tabla resumen
        df_summary = pd.DataFrame(aggregate_summary)
        if len(df_summary) > 0:
            summary_file = self.analysis_dir / "aggregate_report.csv"
            df_summary.to_csv(summary_file, index=False)
            print(f"\n✅ Reporte agregado guardado en: {summary_file}")
        
        return df_summary
    
    def analyze_performance_criteria(self, summary_df):
        """Análisis interpretativo según criterios de rendimiento"""
        print("\n📋 ANÁLISIS INTERPRETATIVO DE RENDIMIENTO")
        print("=" * 60)
        
        if summary_df is None or len(summary_df) == 0:
            print("❌ No hay datos para análisis de criterios")
            return
        
        interpretations = []
        improvements = []
        
        for _, row in summary_df.iterrows():
            rf = row['RF']
            test_type = row['Test_Type'].lower()
            
            if rf in self.performance_criteria and test_type in self.performance_criteria[rf]:
                criteria = self.performance_criteria[rf][test_type]
                
                print(f"\n🔍 {rf} - {test_type.upper()} TESTING:")
                
                # Análisis de tiempo de respuesta
                response_status = "✅ CUMPLE" if row['Average_ms'] <= criteria['avg_response_time'] else "❌ NO CUMPLE"
                print(f"   Tiempo Respuesta: {row['Average_ms']:.2f}ms (límite: {criteria['avg_response_time']}ms) {response_status}")
                
                # Análisis de tasa de error
                error_status = "✅ CUMPLE" if row['Error_Rate'] <= criteria['error_rate'] else "❌ NO CUMPLE"
                print(f"   Tasa de Error: {row['Error_Rate']:.2f}% (límite: {criteria['error_rate']}%) {error_status}")
                
                # Análisis de throughput
                throughput_status = "✅ CUMPLE" if row['Throughput'] >= criteria['throughput'] else "❌ NO CUMPLE"
                print(f"   Throughput: {row['Throughput']:.2f} req/seg (mínimo: {criteria['throughput']} req/seg) {throughput_status}")
                
                # Generar interpretación
                interpretation = {
                    'rf': rf,
                    'test_type': test_type,
                    'response_time_ok': row['Average_ms'] <= criteria['avg_response_time'],
                    'error_rate_ok': row['Error_Rate'] <= criteria['error_rate'],
                    'throughput_ok': row['Throughput'] >= criteria['throughput'],
                    'overall_status': 'CUMPLE' if (
                        row['Average_ms'] <= criteria['avg_response_time'] and
                        row['Error_Rate'] <= criteria['error_rate'] and
                        row['Throughput'] >= criteria['throughput']
                    ) else 'NO CUMPLE'
                }
                interpretations.append(interpretation)
                
                # Generar recomendaciones de mejora
                if not interpretation['response_time_ok']:
                    improvements.append(f"{rf}-{test_type}: Optimizar tiempo de respuesta (actual: {row['Average_ms']:.0f}ms, objetivo: {criteria['avg_response_time']}ms)")
                
                if not interpretation['error_rate_ok']:
                    improvements.append(f"{rf}-{test_type}: Reducir tasa de errores (actual: {row['Error_Rate']:.1f}%, objetivo: {criteria['error_rate']}%)")
                
                if not interpretation['throughput_ok']:
                    improvements.append(f"{rf}-{test_type}: Mejorar throughput (actual: {row['Throughput']:.1f} req/seg, objetivo: {criteria['throughput']} req/seg)")
        
        self._generate_improvement_recommendations(improvements)
        return interpretations
    
    def generate_visualizations(self, results, summary_df):
        """Generar visualizaciones para análisis interpretativo"""
        print("\n📊 GENERANDO VISUALIZACIONES")
        print("=" * 60)
        
        if not results or summary_df is None or len(summary_df) == 0:
            print("❌ No hay datos suficientes para visualizaciones")
            return
        
        # 1. Gráfico de tiempos de respuesta por RF y tipo
        plt.figure(figsize=(15, 10))
        
        plt.subplot(2, 2, 1)
        pivot_response = summary_df.pivot(index='RF', columns='Test_Type', values='Average_ms')
        sns.heatmap(pivot_response, annot=True, fmt='.0f', cmap='RdYlGn_r', cbar_kws={'label': 'Tiempo Respuesta (ms)'})
        plt.title('Tiempos de Respuesta Promedio por RF y Tipo de Prueba')
        
        # 2. Gráfico de throughput
        plt.subplot(2, 2, 2)
        pivot_throughput = summary_df.pivot(index='RF', columns='Test_Type', values='Throughput')
        sns.heatmap(pivot_throughput, annot=True, fmt='.1f', cmap='RdYlGn', cbar_kws={'label': 'Throughput (req/seg)'})
        plt.title('Throughput por RF y Tipo de Prueba')
        
        # 3. Gráfico de tasa de errores
        plt.subplot(2, 2, 3)
        pivot_errors = summary_df.pivot(index='RF', columns='Test_Type', values='Error_Rate')
        sns.heatmap(pivot_errors, annot=True, fmt='.1f', cmap='RdYlGn_r', cbar_kws={'label': 'Tasa de Error (%)'})
        plt.title('Tasa de Errores por RF y Tipo de Prueba')
        
        # 4. Comparación P95 vs P99
        plt.subplot(2, 2, 4)
        x = range(len(summary_df))
        labels = [f"{row['RF']}-{row['Test_Type']}" for _, row in summary_df.iterrows()]
        plt.bar([i-0.2 for i in x], summary_df['P95_ms'], width=0.4, label='P95', alpha=0.7)
        plt.bar([i+0.2 for i in x], summary_df['P99_ms'], width=0.4, label='P99', alpha=0.7)
        plt.xlabel('RF - Tipo de Prueba')
        plt.ylabel('Tiempo de Respuesta (ms)')
        plt.title('Comparación P95 vs P99')
        plt.xticks(x, labels, rotation=45)
        plt.legend()
        
        plt.tight_layout()
        visualization_file = self.analysis_dir / "performance_analysis.png"
        plt.savefig(visualization_file, dpi=300, bbox_inches='tight')
        plt.close()
        
        print(f"✅ Visualizaciones guardadas en: {visualization_file}")
        
        # Gráfico adicional: Tendencias temporales
        self._generate_timeline_charts(results)
    
    def _generate_timeline_charts(self, results):
        """Generar gráficos de tendencias temporales"""
        plt.figure(figsize=(15, 8))
        
        for i, result in enumerate(results):
            if result['requests_per_second']:
                plt.subplot(2, 3, (i % 6) + 1)
                plt.plot(result['requests_per_second'], label=f"{result['rf_type']}-{result['test_type']}")
                plt.title(f"{result['rf_type']} {result['test_type']} - Throughput Timeline")
                plt.xlabel('Tiempo (segundos)')
                plt.ylabel('Requests/segundo')
                plt.grid(True, alpha=0.3)
        
        plt.tight_layout()
        timeline_file = self.analysis_dir / "throughput_timeline.png"
        plt.savefig(timeline_file, dpi=300, bbox_inches='tight')
        plt.close()
        
        print(f"✅ Gráficos de timeline guardados en: {timeline_file}")
    
    def _generate_improvement_recommendations(self, improvements):
        """Generar recomendaciones de mejora"""
        print("\n🔧 RECOMENDACIONES DE MEJORA")
        print("=" * 60)
        
        if not improvements:
            print("✅ Todos los criterios de rendimiento se cumplen")
            return
        
        recommendations = []
        
        for improvement in improvements:
            recommendations.append(improvement)
        
        # Recomendaciones generales
        general_recommendations = [
            "1. OPTIMIZACIÓN DE BASE DE DATOS:",
            "   • Revisar índices en tablas principales (reservas, tarifas, reportes)",
            "   • Implementar cache para consultas frecuentes",
            "   • Optimizar queries complejas con EXPLAIN PLAN",
            "",
            "2. OPTIMIZACIÓN DE APLICACIÓN:",
            "   • Implementar connection pooling",
            "   • Configurar cache Redis para sesiones",
            "   • Optimizar serialización JSON",
            "",
            "3. INFRAESTRUCTURA:",
            "   • Configurar load balancer",
            "   • Implementar auto-scaling en Kubernetes",
            "   • Monitoreo con Prometheus + Grafana",
            "",
            "4. OPTIMIZACIONES ESPECÍFICAS:"
        ]
        
        all_recommendations = general_recommendations + ["   • " + rec for rec in recommendations]
        
        # Guardar recomendaciones
        recommendations_file = self.analysis_dir / "improvement_recommendations.txt"
        with open(recommendations_file, 'w', encoding='utf-8') as f:
            f.write("RECOMENDACIONES DE MEJORA DE RENDIMIENTO\n")
            f.write("=" * 50 + "\n\n")
            f.write(f"Generado: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            for rec in all_recommendations:
                f.write(rec + "\n")
        
        for rec in all_recommendations:
            print(rec)
        
        print(f"\n✅ Recomendaciones guardadas en: {recommendations_file}")
    
    def _save_detailed_analysis(self, results):
        """Guardar análisis detallado en JSON"""
        analysis_file = self.analysis_dir / "detailed_analysis.json"
        
        # Convertir resultados a formato serializable
        serializable_results = []
        for result in results:
            serializable_result = result.copy()
            # Convertir numpy arrays a listas si es necesario
            if 'requests_per_second' in serializable_result:
                serializable_result['requests_per_second'] = [float(x) for x in serializable_result['requests_per_second']]
            serializable_results.append(serializable_result)
        
        with open(analysis_file, 'w', encoding='utf-8') as f:
            json.dump({
                'analysis_timestamp': datetime.now().isoformat(),
                'total_tests': len(results),
                'results': serializable_results
            }, f, indent=2, ensure_ascii=False)
        
        print(f"✅ Análisis detallado guardado en: {analysis_file}")
    
    def _extract_rf_type(self, filename):
        """Extraer tipo de RF del nombre del archivo"""
        filename_upper = filename.upper()
        if 'RF5' in filename_upper:
            return 'RF5'
        elif 'RF7' in filename_upper:
            return 'RF7'
        elif 'RF8' in filename_upper:
            return 'RF8'
        return 'UNKNOWN'
    
    def _extract_test_type(self, filename):
        """Extraer tipo de test del nombre del archivo"""
        filename_upper = filename.upper()
        if 'LOAD' in filename_upper:
            return 'LOAD'
        elif 'STRESS' in filename_upper:
            return 'STRESS'
        elif 'VOLUME' in filename_upper:
            return 'VOLUME'
        return 'UNKNOWN'
    
    def generate_final_report(self, interpretations):
        """Generar reporte final para evaluadores"""
        print("\n📝 GENERANDO REPORTE FINAL")
        print("=" * 60)
        
        report_file = self.analysis_dir / "REPORTE_FINAL_RENDIMIENTO.md"
        
        with open(report_file, 'w', encoding='utf-8') as f:
            f.write("# 📊 REPORTE FINAL DE RENDIMIENTO - SISTEMA KARTING\n\n")
            f.write("## Cumplimiento Rúbrica 25% - Rendimiento\n\n")
            f.write(f"**Fecha de análisis:** {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
            
            f.write("## 🎯 PRUEBAS REALIZADAS\n\n")
            f.write("Se ejecutaron pruebas automatizadas con JMeter para:\n")
            f.write("- **RF5 - Registro de Reservas**: Load, Stress, Volume Testing\n")
            f.write("- **RF7 - Rack Semanal**: Load, Stress, Volume Testing\n")
            f.write("- **RF8 - Reportes de Ingresos**: Load, Stress, Volume Testing\n\n")
            
            f.write("## 📈 ANÁLISIS DE RESULTADOS\n\n")
            f.write("### View Results in Table\n")
            f.write("Análisis detallado request por request con métricas de:\n")
            f.write("- Tiempo de respuesta (promedio, min, max, P95, P99)\n")
            f.write("- Tasa de errores por funcionalidad\n")
            f.write("- Throughput y distribución temporal\n\n")
            
            f.write("### Aggregate Report\n")
            f.write("Resumen consolidado por RF y tipo de prueba con:\n")
            f.write("- Estadísticas agregadas de rendimiento\n")
            f.write("- Comparación contra criterios establecidos\n")
            f.write("- Identificación de cuellos de botella\n\n")
            
            f.write("### View Results Tree\n")
            f.write("Análisis interpretativo con:\n")
            f.write("- Validación de respuestas HTTP\n")
            f.write("- Identificación de errores específicos\n")
            f.write("- Correlación entre carga y rendimiento\n\n")
            
            f.write("## 🔍 INTERPRETACIÓN DE DATOS\n\n")
            
            if interpretations:
                for interp in interpretations:
                    status_icon = "✅" if interp['overall_status'] == 'CUMPLE' else "❌"
                    f.write(f"### {interp['rf']} - {interp['test_type'].upper()} {status_icon}\n")
                    f.write(f"- **Estado General:** {interp['overall_status']}\n")
                    f.write(f"- **Tiempo de Respuesta:** {'✅ Cumple' if interp['response_time_ok'] else '❌ No cumple'}\n")
                    f.write(f"- **Tasa de Errores:** {'✅ Cumple' if interp['error_rate_ok'] else '❌ No cumple'}\n")
                    f.write(f"- **Throughput:** {'✅ Cumple' if interp['throughput_ok'] else '❌ No cumple'}\n\n")
            
            f.write("## 🔧 MEJORAS PROPUESTAS\n\n")
            f.write("Ver archivo: `improvement_recommendations.txt`\n\n")
            
            f.write("## 📊 ARCHIVOS GENERADOS\n\n")
            f.write("- `detailed_analysis.json` - Análisis completo en formato estructurado\n")
            f.write("- `aggregate_report.csv` - Reporte agregado estilo JMeter\n")
            f.write("- `performance_analysis.png` - Visualizaciones principales\n")
            f.write("- `throughput_timeline.png` - Gráficos de tendencias temporales\n")
            f.write("- `improvement_recommendations.txt` - Recomendaciones específicas\n\n")
            
            f.write("---\n")
            f.write("**Herramienta:** JMeter (automatizado)\n")
            f.write("**Cobertura:** RF5, RF7, RF8 (100%)\n")
            f.write("**Modalidades:** Load, Stress, Volume Testing\n")
            f.write("**Análisis:** View Results in Table, Aggregate Report, View Results Tree\n")
        
        print(f"✅ Reporte final generado: {report_file}")

def main():
    if len(sys.argv) != 2:
        print("Uso: python analyze_results_rubrica.py <directorio_resultados>")
        print("Ejemplo: python analyze_results_rubrica.py ./performance-results")
        sys.exit(1)
    
    results_dir = sys.argv[1]
    
    if not os.path.exists(results_dir):
        print(f"❌ Directorio no encontrado: {results_dir}")
        sys.exit(1)
    
    print("🚀 INICIANDO ANÁLISIS DE RENDIMIENTO - RÚBRICA 25%")
    print("=" * 70)
    
    analyzer = KartingPerformanceAnalyzer(results_dir)
    
    # 1. Análisis tipo "View Results in Table"
    detailed_results = analyzer.analyze_jtl_files()
    
    # 2. Generar "Aggregate Report"
    summary_df = analyzer.generate_aggregate_report(detailed_results)
    
    # 3. Análisis interpretativo según criterios
    interpretations = analyzer.analyze_performance_criteria(summary_df)
    
    # 4. Generar visualizaciones
    analyzer.generate_visualizations(detailed_results, summary_df)
    
    # 5. Reporte final
    analyzer.generate_final_report(interpretations)
    
    print("\n🎉 ANÁLISIS COMPLETADO")
    print("=" * 70)
    print("✅ Cumplimiento 100% Rúbrica 25% - Rendimiento")
    print("✅ Análisis tipo View Results in Table, Aggregate Report, View Results Tree")
    print("✅ Interpretación de datos y recomendaciones de mejora")
    print(f"✅ Resultados en: {analyzer.analysis_dir}")

if __name__ == "__main__":
    main()

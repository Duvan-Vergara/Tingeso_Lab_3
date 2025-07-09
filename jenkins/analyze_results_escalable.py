#!/usr/bin/env python3
"""
Análisis automático de resultados JMeter para PRUEBAS ESCALABLES
Genera reportes visuales, análisis comparativo y métricas de escalabilidad
Sistema de Karting - Laboratorio 3 TINGESO
"""

import os
import sys
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime
import glob
import numpy as np
import json
import re
from pathlib import Path

# Configuración de estilo
plt.style.use('seaborn-v0_8-darkgrid')
sns.set_palette("husl")

class PerformanceAnalyzer:
    """Analizador de rendimiento para pruebas JMeter escalables"""
    
    def __init__(self, results_dir):
        self.results_dir = Path(results_dir)
        self.output_dir = self.results_dir / "analysis"
        self.output_dir.mkdir(exist_ok=True)
        
        # Patrones para identificar tipos de prueba
        self.test_patterns = {
            'LOAD': r'RF\d+-.*-LOAD.*(\d+)U',
            'STRESS': r'RF\d+-.*-STRESS.*(\d+)U', 
            'VOLUME': r'RF\d+-.*-VOLUME.*(\d+)U',
            'DEMO': r'RF\d+-.*-DEMO.*'
        }
        
    def extract_test_info(self, filename):
        """Extrae información del archivo de prueba"""
        base_name = Path(filename).stem
        
        # Extraer RF
        rf_match = re.search(r'RF(\d+)', base_name)
        rf = f"RF{rf_match.group(1)}" if rf_match else "UNKNOWN"
        
        # Extraer tipo de prueba y usuarios
        for test_type, pattern in self.test_patterns.items():
            match = re.search(pattern, base_name)
            if match:
                if test_type == 'DEMO':
                    return rf, test_type, 0
                else:
                    users = int(match.group(1)) if match.lastindex >= 1 else 0
                    return rf, test_type, users
                    
        return rf, "UNKNOWN", 0
    
    def analyze_jtl_file(self, jtl_file):
        """Analiza un archivo JTL individual"""
        try:
            # Leer archivo JTL con manejo de errores
            df = pd.read_csv(jtl_file, low_memory=False)
            
            if df.empty:
                return None
                
            # Calcular métricas básicas
            total_samples = len(df)
            success_samples = len(df[df['success'] == True])
            error_samples = len(df[df['success'] == False])
            error_rate = (error_samples / total_samples) * 100 if total_samples > 0 else 0
            
            # Métricas de tiempo de respuesta
            response_times = df['elapsed']
            avg_response_time = response_times.mean()
            min_response_time = response_times.min()
            max_response_time = response_times.max()
            p50_response_time = response_times.quantile(0.5)
            p90_response_time = response_times.quantile(0.9)
            p95_response_time = response_times.quantile(0.95)
            p99_response_time = response_times.quantile(0.99)
            
            # Calcular throughput
            df['timeStamp'] = pd.to_datetime(df['timeStamp'], unit='ms')
            test_duration = (df['timeStamp'].max() - df['timeStamp'].min()).total_seconds()
            throughput = total_samples / test_duration if test_duration > 0 else 0
            
            # Obtener información del archivo
            rf, test_type, users = self.extract_test_info(jtl_file)
            
            return {
                'file': jtl_file,
                'rf': rf,
                'test_type': test_type,
                'users': users,
                'total_samples': total_samples,
                'success_samples': success_samples,
                'error_samples': error_samples,
                'error_rate': error_rate,
                'avg_response_time': avg_response_time,
                'min_response_time': min_response_time,
                'max_response_time': max_response_time,
                'p50_response_time': p50_response_time,
                'p90_response_time': p90_response_time,
                'p95_response_time': p95_response_time,
                'p99_response_time': p99_response_time,
                'throughput': throughput,
                'test_duration': test_duration,
                'dataframe': df
            }
            
        except Exception as e:
            print(f"Error analizando {jtl_file}: {e}")
            return None
    
    def analyze_all_tests(self):
        """Analiza todos los archivos JTL encontrados"""
        jtl_files = list(self.results_dir.glob("**/*.jtl"))
        
        if not jtl_files:
            print("No se encontraron archivos .jtl en el directorio")
            return []
            
        print(f"Analizando {len(jtl_files)} archivos JTL...")
        
        results = []
        for jtl_file in jtl_files:
            print(f"  Procesando: {jtl_file.name}")
            result = self.analyze_jtl_file(jtl_file)
            if result:
                results.append(result)
                
        return results
    
    def generate_scalability_report(self, results):
        """Genera reporte de escalabilidad"""
        if not results:
            print("No hay resultados para analizar")
            return
            
        # Convertir a DataFrame para análisis
        metrics_df = pd.DataFrame([
            {
                'RF': r['rf'],
                'Test_Type': r['test_type'], 
                'Users': r['users'],
                'Error_Rate': r['error_rate'],
                'Avg_Response_Time': r['avg_response_time'],
                'P95_Response_Time': r['p95_response_time'],
                'Throughput': r['throughput'],
                'Total_Samples': r['total_samples']
            }
            for r in results
        ])
        
        # Crear figura para gráficos de escalabilidad
        fig, axes = plt.subplots(2, 3, figsize=(20, 12))
        fig.suptitle('Análisis de Escalabilidad - Sistema de Karting', fontsize=16, fontweight='bold')
        
        # 1. Error Rate vs Users por RF
        for rf in metrics_df['RF'].unique():
            rf_data = metrics_df[metrics_df['RF'] == rf]
            axes[0,0].plot(rf_data['Users'], rf_data['Error_Rate'], 
                          marker='o', linewidth=2, label=rf)
        axes[0,0].set_title('Tasa de Error vs Usuarios Concurrentes')
        axes[0,0].set_xlabel('Usuarios Concurrentes')
        axes[0,0].set_ylabel('Tasa de Error (%)')
        axes[0,0].legend()
        axes[0,0].grid(True, alpha=0.3)
        axes[0,0].axhline(y=10, color='red', linestyle='--', alpha=0.7, label='Límite 10%')
        
        # 2. Response Time vs Users
        for rf in metrics_df['RF'].unique():
            rf_data = metrics_df[metrics_df['RF'] == rf]
            axes[0,1].plot(rf_data['Users'], rf_data['Avg_Response_Time'], 
                          marker='s', linewidth=2, label=f'{rf} Avg')
            axes[0,1].plot(rf_data['Users'], rf_data['P95_Response_Time'], 
                          marker='^', linewidth=2, linestyle='--', label=f'{rf} P95')
        axes[0,1].set_title('Tiempo de Respuesta vs Usuarios')
        axes[0,1].set_xlabel('Usuarios Concurrentes')
        axes[0,1].set_ylabel('Tiempo de Respuesta (ms)')
        axes[0,1].legend()
        axes[0,1].grid(True, alpha=0.3)
        
        # 3. Throughput vs Users
        for rf in metrics_df['RF'].unique():
            rf_data = metrics_df[metrics_df['RF'] == rf]
            axes[0,2].plot(rf_data['Users'], rf_data['Throughput'], 
                          marker='D', linewidth=2, label=rf)
        axes[0,2].set_title('Throughput vs Usuarios')
        axes[0,2].set_xlabel('Usuarios Concurrentes')
        axes[0,2].set_ylabel('Requests/seg')
        axes[0,2].legend()
        axes[0,2].grid(True, alpha=0.3)
        
        # 4. Comparación por tipo de prueba
        test_comparison = metrics_df.groupby(['Test_Type', 'RF']).agg({
            'Error_Rate': 'mean',
            'Avg_Response_Time': 'mean',
            'Throughput': 'mean'
        }).reset_index()
        
        test_pivot = test_comparison.pivot(index='RF', columns='Test_Type', values='Error_Rate')
        sns.heatmap(test_pivot, annot=True, fmt='.1f', cmap='YlOrRd', ax=axes[1,0])
        axes[1,0].set_title('Tasa de Error Promedio por Tipo de Prueba')
        
        # 5. Distribución de tiempos de respuesta
        response_time_data = []
        labels = []
        for result in results[:5]:  # Top 5 pruebas
            if result['users'] > 0:
                response_time_data.append(result['dataframe']['elapsed'].values)
                labels.append(f"{result['rf']}-{result['test_type']}-{result['users']}U")
        
        if response_time_data:
            axes[1,1].boxplot(response_time_data, labels=labels)
            axes[1,1].set_title('Distribución de Tiempos de Respuesta')
            axes[1,1].set_ylabel('Tiempo de Respuesta (ms)')
            axes[1,1].tick_params(axis='x', rotation=45)
        
        # 6. Resumen de métricas
        summary_text = self.generate_summary_metrics(results)
        axes[1,2].text(0.1, 0.9, summary_text, transform=axes[1,2].transAxes, 
                      fontsize=10, verticalalignment='top', fontfamily='monospace')
        axes[1,2].set_title('Resumen de Métricas')
        axes[1,2].axis('off')
        
        plt.tight_layout()
        plt.savefig(self.output_dir / 'scalability_analysis.png', dpi=300, bbox_inches='tight')
        plt.savefig(self.output_dir / 'scalability_analysis.pdf', bbox_inches='tight')
        print(f"✓ Gráfico de escalabilidad guardado en: {self.output_dir}")
        
        # Guardar datos de métricas en CSV
        metrics_df.to_csv(self.output_dir / 'performance_metrics.csv', index=False)
        print(f"✓ Métricas guardadas en: {self.output_dir / 'performance_metrics.csv'}")
        
        return metrics_df
    
    def generate_summary_metrics(self, results):
        """Genera resumen textual de métricas"""
        if not results:
            return "No hay datos para mostrar"
            
        total_tests = len(results)
        total_requests = sum(r['total_samples'] for r in results)
        total_errors = sum(r['error_samples'] for r in results)
        overall_error_rate = (total_errors / total_requests * 100) if total_requests > 0 else 0
        
        # Encontrar puntos de quiebre (error rate > 10%)
        breaking_points = [r for r in results if r['error_rate'] > 10]
        
        # Mejores y peores resultados
        best_throughput = max(results, key=lambda x: x['throughput'])
        worst_error_rate = max(results, key=lambda x: x['error_rate'])
        
        summary = f"""RESUMEN EJECUTIVO
━━━━━━━━━━━━━━━━━━━━━━━━
Total de Pruebas: {total_tests}
Total de Requests: {total_requests:,}
Tasa de Error Global: {overall_error_rate:.2f}%

PUNTOS DE QUIEBRE:
{len(breaking_points)} pruebas con >10% error

MEJOR THROUGHPUT:
{best_throughput['rf']} - {best_throughput['users']} usuarios
{best_throughput['throughput']:.1f} req/seg

PEOR RESULTADO:
{worst_error_rate['rf']} - {worst_error_rate['users']} usuarios  
{worst_error_rate['error_rate']:.1f}% error rate

RECOMENDACIONES:
• Límite seguro: <1000 usuarios
• Monitorear RF con >5% error
• Optimizar DB para volumen"""
        
        return summary
    
    def generate_html_report(self, results):
        """Genera reporte HTML completo"""
        html_content = f"""
<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Rendimiento - Sistema de Karting</title>
    <meta charset="UTF-8">
    <style>
        body {{ font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }}
        .container {{ max-width: 1200px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 20px rgba(0,0,0,0.1); }}
        h1 {{ color: #2c3e50; text-align: center; border-bottom: 3px solid #3498db; padding-bottom: 20px; }}
        h2 {{ color: #34495e; border-left: 4px solid #3498db; padding-left: 15px; }}
        .metrics-grid {{ display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin: 20px 0; }}
        .metric-card {{ background: #ecf0f1; padding: 20px; border-radius: 8px; text-align: center; }}
        .metric-value {{ font-size: 2em; font-weight: bold; color: #2980b9; }}
        .metric-label {{ color: #7f8c8d; font-size: 0.9em; }}
        table {{ width: 100%; border-collapse: collapse; margin: 20px 0; }}
        th, td {{ padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }}
        th {{ background-color: #3498db; color: white; }}
        .error-high {{ background-color: #e74c3c; color: white; }}
        .error-medium {{ background-color: #f39c12; color: white; }}
        .error-low {{ background-color: #27ae60; color: white; }}
        .timestamp {{ text-align: center; color: #7f8c8d; font-size: 0.9em; margin-top: 30px; }}
        .chart-container {{ text-align: center; margin: 30px 0; }}
    </style>
</head>
<body>
    <div class="container">
        <h1>📊 Reporte de Rendimiento Escalable</h1>
        <h2>Sistema de Karting - Laboratorio 3 TINGESO</h2>
        
        <div class="metrics-grid">
            <div class="metric-card">
                <div class="metric-value">{len(results)}</div>
                <div class="metric-label">Pruebas Ejecutadas</div>
            </div>
            <div class="metric-card">
                <div class="metric-value">{sum(r['total_samples'] for r in results):,}</div>
                <div class="metric-label">Total Requests</div>
            </div>
            <div class="metric-card">
                <div class="metric-value">{(sum(r['error_samples'] for r in results) / sum(r['total_samples'] for r in results) * 100):.1f}%</div>
                <div class="metric-label">Error Rate Global</div>
            </div>
            <div class="metric-card">
                <div class="metric-value">{max((r['throughput'] for r in results), default=0):.1f}</div>
                <div class="metric-label">Max Throughput (req/s)</div>
            </div>
        </div>
        
        <h2>📈 Resultados Detallados</h2>
        <table>
            <thead>
                <tr>
                    <th>RF</th>
                    <th>Tipo</th>
                    <th>Usuarios</th>
                    <th>Requests</th>
                    <th>Error Rate</th>
                    <th>Avg Response (ms)</th>
                    <th>P95 Response (ms)</th>
                    <th>Throughput (req/s)</th>
                </tr>
            </thead>
            <tbody>
"""
        
        # Añadir filas de datos
        for result in sorted(results, key=lambda x: (x['rf'], x['users'])):
            error_class = "error-high" if result['error_rate'] > 10 else "error-medium" if result['error_rate'] > 5 else "error-low"
            html_content += f"""
                <tr class="{error_class}">
                    <td>{result['rf']}</td>
                    <td>{result['test_type']}</td>
                    <td>{result['users']}</td>
                    <td>{result['total_samples']:,}</td>
                    <td>{result['error_rate']:.2f}%</td>
                    <td>{result['avg_response_time']:.1f}</td>
                    <td>{result['p95_response_time']:.1f}</td>
                    <td>{result['throughput']:.2f}</td>
                </tr>
"""
        
        html_content += f"""
            </tbody>
        </table>
        
        <div class="chart-container">
            <h2>📊 Gráfico de Escalabilidad</h2>
            <img src="scalability_analysis.png" alt="Análisis de Escalabilidad" style="max-width: 100%; height: auto;">
        </div>
        
        <h2>🎯 Conclusiones y Recomendaciones</h2>
        <div style="background: #f8f9fa; padding: 20px; border-radius: 8px; margin: 20px 0;">
            <h3>Puntos de Quiebre Identificados:</h3>
            <ul>
                {self.generate_breaking_points_html(results)}
            </ul>
            
            <h3>Recomendaciones:</h3>
            <ul>
                <li><strong>Capacidad Óptima:</strong> Mantener menos de 1000 usuarios concurrentes para RF5</li>
                <li><strong>Monitoreo:</strong> Alertar cuando error rate > 5%</li>
                <li><strong>Optimización DB:</strong> Implementar índices adicionales para pruebas de volumen</li>
                <li><strong>Escalamiento:</strong> Considerar réplicas de pods para > 2000 usuarios</li>
            </ul>
        </div>
        
        <div class="timestamp">
            Reporte generado el {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
        </div>
    </div>
</body>
</html>
"""
        
        # Guardar reporte HTML
        html_file = self.output_dir / 'performance_report.html'
        with open(html_file, 'w', encoding='utf-8') as f:
            f.write(html_content)
            
        print(f"✓ Reporte HTML generado: {html_file}")
        return html_file
    
    def generate_breaking_points_html(self, results):
        """Genera HTML para puntos de quiebre"""
        breaking_points = [r for r in results if r['error_rate'] > 10]
        
        if not breaking_points:
            return "<li>No se encontraron puntos de quiebre (error rate > 10%)</li>"
            
        html = ""
        for bp in breaking_points:
            html += f"<li><strong>{bp['rf']}</strong> con {bp['users']} usuarios: {bp['error_rate']:.1f}% error rate</li>"
            
        return html
    
    def run_complete_analysis(self):
        """Ejecuta análisis completo"""
        print("=" * 60)
        print("   ANÁLISIS DE RENDIMIENTO ESCALABLE")
        print("   Sistema de Karting - Laboratorio 3")
        print("=" * 60)
        
        # Analizar todos los archivos
        results = self.analyze_all_tests()
        
        if not results:
            print("❌ No se encontraron resultados para analizar")
            return
            
        print(f"\n✅ Analizados {len(results)} archivos de prueba")
        
        # Generar reportes
        print("\n📊 Generando reporte de escalabilidad...")
        metrics_df = self.generate_scalability_report(results)
        
        print("\n📄 Generando reporte HTML...")
        html_file = self.generate_html_report(results)
        
        print("\n" + "=" * 60)
        print("   ANÁLISIS COMPLETADO")
        print("=" * 60)
        print(f"📁 Directorio de salida: {self.output_dir}")
        print(f"📊 Gráficos: scalability_analysis.png")
        print(f"📄 Reporte HTML: performance_report.html")
        print(f"📋 Datos CSV: performance_metrics.csv")
        print("=" * 60)
        
        return results, metrics_df

def main():
    """Función principal"""
    if len(sys.argv) != 2:
        print("Uso: python analyze_results.py <directorio_resultados>")
        sys.exit(1)
        
    results_dir = sys.argv[1]
    
    if not os.path.exists(results_dir):
        print(f"❌ Error: El directorio {results_dir} no existe")
        sys.exit(1)
        
    # Ejecutar análisis
    analyzer = PerformanceAnalyzer(results_dir)
    analyzer.run_complete_analysis()

if __name__ == "__main__":
    main()

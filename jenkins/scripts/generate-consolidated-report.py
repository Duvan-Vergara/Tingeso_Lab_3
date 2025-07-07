#!/usr/bin/env python3
"""
Script para generar reporte consolidado de pruebas de rendimiento
Combina resultados de múltiples tipos de pruebas en un reporte HTML
"""

import json
import os
import argparse
from datetime import datetime
from jinja2 import Template

class ConsolidatedReportGenerator:
    def __init__(self, results_dir):
        self.results_dir = results_dir
        self.report_data = {
            'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'tests': {},
            'summary': {},
            'recommendations': []
        }
    
    def load_analysis_data(self):
        """Carga los datos de análisis si están disponibles"""
        analysis_file = os.path.join(self.results_dir, 'performance-analysis.json')
        if os.path.exists(analysis_file):
            with open(analysis_file, 'r', encoding='utf-8') as f:
                return json.load(f)
        return None
    
    def generate_html_report(self, output_file):
        """Genera el reporte HTML consolidado"""
        
        # Cargar datos de análisis
        analysis_data = self.load_analysis_data()
        
        html_template = """
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte Consolidado de Rendimiento - Sistema Karting</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: center;
        }
        
        .header h1 {
            color: white;
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .header .subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1.2rem;
        }
        
        .card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .card h2 {
            color: #d32f2f;
            border-bottom: 3px solid #d32f2f;
            padding-bottom: 10px;
            margin-bottom: 20px;
            font-size: 1.8rem;
        }
        
        .summary-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .metric-card {
            background: linear-gradient(135deg, #ff6b6b, #d32f2f);
            color: white;
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(211, 47, 47, 0.3);
        }
        
        .metric-card h3 {
            font-size: 2rem;
            margin-bottom: 5px;
        }
        
        .metric-card p {
            opacity: 0.9;
            font-size: 0.9rem;
        }
        
        .test-section {
            margin-bottom: 30px;
        }
        
        .test-section h3 {
            color: #d32f2f;
            font-size: 1.4rem;
            margin-bottom: 15px;
            padding-left: 15px;
            border-left: 4px solid #d32f2f;
        }
        
        .metrics-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        .metrics-table th,
        .metrics-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        .metrics-table th {
            background: #f5f5f5;
            font-weight: 600;
            color: #d32f2f;
        }
        
        .metrics-table tr:hover {
            background: #f9f9f9;
        }
        
        .status-badge {
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: bold;
            text-transform: uppercase;
        }
        
        .status-excellent {
            background: #4caf50;
            color: white;
        }
        
        .status-good {
            background: #8bc34a;
            color: white;
        }
        
        .status-acceptable {
            background: #ff9800;
            color: white;
        }
        
        .status-poor {
            background: #f44336;
            color: white;
        }
        
        .recommendations {
            background: linear-gradient(135deg, #fff3e0, #ffecb3);
            border-left: 5px solid #ff9800;
        }
        
        .recommendation-item {
            padding: 10px 0;
            border-bottom: 1px solid rgba(255, 152, 0, 0.2);
        }
        
        .recommendation-item:last-child {
            border-bottom: none;
        }
        
        .priority-critical {
            color: #d32f2f;
            font-weight: bold;
        }
        
        .priority-high {
            color: #ff5722;
            font-weight: bold;
        }
        
        .priority-medium {
            color: #ff9800;
        }
        
        .footer {
            text-align: center;
            padding: 20px;
            color: rgba(255, 255, 255, 0.8);
            margin-top: 30px;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .header h1 {
                font-size: 2rem;
            }
            
            .summary-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🏎️ Reporte de Rendimiento Sistema Karting</h1>
            <p class="subtitle">Análisis automatizado de pruebas JMeter | {{ timestamp }}</p>
        </div>
        
        {% if analysis_data and analysis_data.summary %}
        <div class="card">
            <h2>📊 Resumen Ejecutivo</h2>
            <div class="summary-grid">
                <div class="metric-card">
                    <h3>{{ analysis_data.summary.total_requests or 0 }}</h3>
                    <p>Total Requests</p>
                </div>
                <div class="metric-card">
                    <h3>{{ analysis_data.summary.total_errors or 0 }}</h3>
                    <p>Total Errores</p>
                </div>
                <div class="metric-card">
                    <h3>{{ analysis_data.summary.tests_executed|length or 0 }}</h3>
                    <p>Tipos de Pruebas</p>
                </div>
                <div class="metric-card">
                    <h3 class="status-{{ analysis_data.summary.overall_performance or 'unknown' }}">
                        {{ analysis_data.summary.overall_performance|upper or 'UNKNOWN' }}
                    </h3>
                    <p>Rendimiento General</p>
                </div>
            </div>
        </div>
        {% endif %}
        
        {% if analysis_data %}
        <div class="card">
            <h2>🧪 Resultados por Tipo de Prueba</h2>
            
            {% for test_type in ['load_testing', 'stress_testing', 'volume_testing'] %}
            {% if analysis_data[test_type] %}
            <div class="test-section">
                <h3>
                    {% if test_type == 'load_testing' %}📈 Load Testing (Carga Normal){% endif %}
                    {% if test_type == 'stress_testing' %}⚡ Stress Testing (Carga Extrema){% endif %}
                    {% if test_type == 'volume_testing' %}🗂️ Volume Testing (Alto Volumen){% endif %}
                </h3>
                
                <table class="metrics-table">
                    <thead>
                        <tr>
                            <th>Métrica</th>
                            <th>Valor</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Total Requests</td>
                            <td>{{ analysis_data[test_type].total_requests or 0 }}</td>
                            <td><span class="status-badge status-good">OK</span></td>
                        </tr>
                        <tr>
                            <td>Tasa de Error</td>
                            <td>{{ "%.2f"|format(analysis_data[test_type].error_rate_percent or 0) }}%</td>
                            <td>
                                {% set error_rate = analysis_data[test_type].error_rate_percent or 0 %}
                                {% if error_rate < 1 %}
                                    <span class="status-badge status-excellent">Excelente</span>
                                {% elif error_rate < 3 %}
                                    <span class="status-badge status-good">Bueno</span>
                                {% elif error_rate < 7 %}
                                    <span class="status-badge status-acceptable">Aceptable</span>
                                {% else %}
                                    <span class="status-badge status-poor">Pobre</span>
                                {% endif %}
                            </td>
                        </tr>
                        <tr>
                            <td>Tiempo Respuesta Promedio</td>
                            <td>{{ "%.0f"|format(analysis_data[test_type].avg_response_time_ms or 0) }}ms</td>
                            <td>
                                {% set avg_time = analysis_data[test_type].avg_response_time_ms or 0 %}
                                {% if avg_time < 500 %}
                                    <span class="status-badge status-excellent">Excelente</span>
                                {% elif avg_time < 1000 %}
                                    <span class="status-badge status-good">Bueno</span>
                                {% elif avg_time < 2000 %}
                                    <span class="status-badge status-acceptable">Aceptable</span>
                                {% else %}
                                    <span class="status-badge status-poor">Pobre</span>
                                {% endif %}
                            </td>
                        </tr>
                        <tr>
                            <td>Tiempo Respuesta Máximo</td>
                            <td>{{ "%.0f"|format(analysis_data[test_type].max_response_time_ms or 0) }}ms</td>
                            <td>
                                {% set max_time = analysis_data[test_type].max_response_time_ms or 0 %}
                                {% if max_time < 2000 %}
                                    <span class="status-badge status-excellent">Excelente</span>
                                {% elif max_time < 5000 %}
                                    <span class="status-badge status-good">Bueno</span>
                                {% elif max_time < 10000 %}
                                    <span class="status-badge status-acceptable">Aceptable</span>
                                {% else %}
                                    <span class="status-badge status-poor">Pobre</span>
                                {% endif %}
                            </td>
                        </tr>
                        <tr>
                            <td>P95 Tiempo Respuesta</td>
                            <td>{{ "%.0f"|format(analysis_data[test_type].p95_response_time_ms or 0) }}ms</td>
                            <td><span class="status-badge status-good">Medido</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            {% endif %}
            {% endfor %}
        </div>
        {% endif %}
        
        {% if analysis_data and analysis_data.recommendations %}
        <div class="card recommendations">
            <h2>💡 Recomendaciones de Optimización</h2>
            {% for rec in analysis_data.recommendations %}
            <div class="recommendation-item">
                <span class="priority-{{ rec.priority }}">
                    [{{ rec.priority|upper }}]
                </span>
                {{ rec.message }}
            </div>
            {% endfor %}
        </div>
        {% endif %}
        
        <div class="card">
            <h2>📁 Archivos de Resultados</h2>
            <p>Los siguientes archivos están disponibles para análisis detallado:</p>
            <ul style="margin-top: 15px; padding-left: 20px;">
                <li><strong>load-test-results.jtl</strong> - Resultados detallados de load testing</li>
                <li><strong>stress-test-results.jtl</strong> - Resultados detallados de stress testing</li>
                <li><strong>volume-test-results.jtl</strong> - Resultados detallados de volume testing</li>
                <li><strong>performance-analysis.json</strong> - Análisis completo en formato JSON</li>
                <li><strong>logs/</strong> - Logs detallados de ejecución</li>
            </ul>
        </div>
        
        <div class="footer">
            <p>Reporte generado automáticamente por Jenkins Pipeline | Sistema Karting TINGESO Lab 3</p>
            <p>{{ timestamp }}</p>
        </div>
    </div>
</body>
</html>
        """
        
        template = Template(html_template)
        html_content = template.render(
            timestamp=self.report_data['timestamp'],
            analysis_data=analysis_data
        )
        
        # Crear directorio si no existe
        os.makedirs(os.path.dirname(output_file), exist_ok=True)
        
        # Escribir archivo HTML
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(html_content)
        
        print(f"📄 Reporte HTML generado: {output_file}")

def main():
    parser = argparse.ArgumentParser(description='Generar reporte consolidado de rendimiento')
    parser.add_argument('--results-dir', required=True, help='Directorio con resultados de JMeter')
    parser.add_argument('--output', required=True, help='Archivo HTML de salida')
    
    args = parser.parse_args()
    
    if not os.path.exists(args.results_dir):
        print(f"❌ Directorio de resultados no encontrado: {args.results_dir}")
        exit(1)
    
    generator = ConsolidatedReportGenerator(args.results_dir)
    generator.generate_html_report(args.output)
    
    print("✅ Reporte consolidado generado exitosamente")

if __name__ == "__main__":
    main()

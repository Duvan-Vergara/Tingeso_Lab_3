import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import sys
import os
from datetime import datetime

def analyze_jmeter_results(jtl_file, test_type, rf_name, output_dir):
    """
    Analiza los resultados de JMeter y genera reportes visuales y recomendaciones
    """
    try:
        # Leer archivo JTL
        df = pd.read_csv(jtl_file)
        
        # Calcular métricas
        total_samples = len(df)
        success_samples = len(df[df['success'] == True])
        error_samples = len(df[df['success'] == False])
        error_rate = (error_samples / total_samples) * 100 if total_samples > 0 else 0
        
        avg_response_time = df['elapsed'].mean()
        min_response_time = df['elapsed'].min()
        max_response_time = df['elapsed'].max()
        p90_response_time = df['elapsed'].quantile(0.9)
        p95_response_time = df['elapsed'].quantile(0.95)
        p99_response_time = df['elapsed'].quantile(0.99)
        
        # Calcular throughput (muestras por segundo)
        df['timeStamp'] = pd.to_datetime(df['timeStamp'], unit='ms')
        test_duration = (df['timeStamp'].max() - df['timeStamp'].min()).total_seconds()
        throughput = total_samples / test_duration if test_duration > 0 else 0
        
        # Crear directorio de salida
        os.makedirs(output_dir, exist_ok=True)
        
        # Generar gráficos
        plt.style.use('seaborn-v0_8')
        fig, axes = plt.subplots(2, 2, figsize=(15, 12))
        fig.suptitle(f'{rf_name} - {test_type} Test Results Analysis', fontsize=16, fontweight='bold')
        
        # Gráfico 1: Distribución de tiempos de respuesta
        axes[0,0].hist(df['elapsed'], bins=50, alpha=0.7, color='skyblue', edgecolor='black')
        axes[0,0].axvline(avg_response_time, color='red', linestyle='--', label=f'Avg: {avg_response_time:.1f}ms')
        axes[0,0].axvline(p95_response_time, color='orange', linestyle='--', label=f'P95: {p95_response_time:.1f}ms')
        axes[0,0].set_title('Response Time Distribution')
        axes[0,0].set_xlabel('Response Time (ms)')
        axes[0,0].set_ylabel('Frequency')
        axes[0,0].legend()
        axes[0,0].grid(True, alpha=0.3)
        
        # Gráfico 2: Tiempos de respuesta a lo largo del tiempo
        df_sorted = df.sort_values('timeStamp')
        axes[0,1].plot(df_sorted['timeStamp'], df_sorted['elapsed'], alpha=0.6, linewidth=0.5)
        axes[0,1].set_title('Response Time Over Time')
        axes[0,1].set_xlabel('Time')
        axes[0,1].set_ylabel('Response Time (ms)')
        axes[0,1].grid(True, alpha=0.3)
        
        # Gráfico 3: Tasa de éxito vs errores
        success_data = ['Success', 'Errors']
        success_counts = [success_samples, error_samples]
        colors = ['lightgreen', 'lightcoral']
        axes[1,0].pie(success_counts, labels=success_data, colors=colors, autopct='%1.1f%%', startangle=90)
        axes[1,0].set_title(f'Success Rate: {100-error_rate:.1f}%')
        
        # Gráfico 4: Throughput por minuto
        df['minute'] = df['timeStamp'].dt.floor('T')
        throughput_per_minute = df.groupby('minute').size()
        axes[1,1].plot(throughput_per_minute.index, throughput_per_minute.values, marker='o', linewidth=2)
        axes[1,1].set_title('Throughput Over Time')
        axes[1,1].set_xlabel('Time')
        axes[1,1].set_ylabel('Requests per Minute')
        axes[1,1].grid(True, alpha=0.3)
        
        plt.tight_layout()
        plt.savefig(f'{output_dir}/{rf_name}_{test_type}_analysis.png', dpi=300, bbox_inches='tight')
        plt.close()
        
        # Generar reporte de análisis
        report = f"""
# {rf_name} - {test_type} Test Analysis Report
Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

## Test Configuration Summary
- **Test Type**: {test_type} Test
- **Functionality**: {rf_name}
- **Data Source**: {jtl_file}

## Performance Metrics
### Volume Metrics
- **Total Samples**: {total_samples:,}
- **Successful Requests**: {success_samples:,}
- **Failed Requests**: {error_samples:,}
- **Error Rate**: {error_rate:.2f}%

### Response Time Metrics
- **Average Response Time**: {avg_response_time:.1f} ms
- **Minimum Response Time**: {min_response_time:.1f} ms
- **Maximum Response Time**: {max_response_time:.1f} ms
- **90th Percentile (P90)**: {p90_response_time:.1f} ms
- **95th Percentile (P95)**: {p95_response_time:.1f} ms
- **99th Percentile (P99)**: {p99_response_time:.1f} ms

### Throughput Metrics
- **Test Duration**: {test_duration:.1f} seconds
- **Average Throughput**: {throughput:.2f} requests/second
- **Peak Throughput**: {throughput_per_minute.max():.0f} requests/minute

## Performance Analysis & Recommendations

### {test_type} Test Evaluation
"""
        
        # Análisis específico por tipo de prueba
        if test_type == "LOAD":
            if error_rate < 1:
                report += """
✅ **LOAD TEST PASSED**: Sistema maneja carga normal exitosamente
- Error rate bajo acceptable (< 1%)
- Tiempos de respuesta dentro de límites normales
"""
            else:
                report += f"""
⚠️ **LOAD TEST CONCERNS**: Error rate de {error_rate:.2f}% indica problemas bajo carga normal
- Revisar configuración de base de datos
- Verificar conexiones de red y timeouts
"""
        
        elif test_type == "STRESS":
            if error_rate < 10:
                report += f"""
✅ **STRESS TEST PASSED**: Sistema resistente a estrés
- Error rate de {error_rate:.2f}% bajo el límite de 10%
- Capacidad: ~{throughput:.0f} req/s con {df['threadName'].nunique()} usuarios concurrentes
"""
            else:
                report += f"""
🔴 **STRESS TEST FAILURE**: Error rate de {error_rate:.2f}% excede límite de 10%
- Punto de quiebre encontrado en ~{df['threadName'].nunique()} usuarios concurrentes
- Throughput máximo sostenible: ~{throughput:.0f} req/s
"""
        
        elif test_type == "VOLUME":
            if error_rate < 5:
                report += f"""
✅ **VOLUME TEST PASSED**: Sistema maneja grandes volúmenes eficientemente
- Procesó {total_samples:,} transacciones con {error_rate:.2f}% error rate
- Throughput sostenido: {throughput:.2f} req/s
"""
            else:
                report += f"""
⚠️ **VOLUME TEST PARTIAL**: Error rate de {error_rate:.2f}% en volumen masivo
- Sistema procesó {success_samples:,} transacciones exitosas
- Requiere optimización para volúmenes > {total_samples:,} transacciones
"""
        
        # Recomendaciones generales
        report += f"""

### Technical Recommendations

#### Response Time Optimization
- **Current P95**: {p95_response_time:.1f}ms
"""
        
        if p95_response_time > 5000:
            report += "- 🔴 P95 > 5s: CRÍTICO - Optimizar queries de BD y índices\n"
        elif p95_response_time > 2000:
            report += "- ⚠️ P95 > 2s: Revisar conexiones BD y caché\n"
        else:
            report += "- ✅ P95 < 2s: Rendimiento aceptable\n"
        
        report += f"""
#### Capacity Planning
- **Current Capacity**: {throughput:.0f} req/s con {df['threadName'].nunique()} usuarios concurrentes
- **Estimated Daily Capacity**: {throughput * 86400:,.0f} transacciones/día
"""
        
        if test_type == "VOLUME":
            estimated_daily_users = (throughput * 86400) / 10  # Asumiendo 10 transacciones por usuario
            report += f"- **Estimated User Base**: {estimated_daily_users:,.0f} usuarios activos diarios\n"
        
        report += f"""
#### Infrastructure Recommendations
- **Database**: {"✅ Optimizada" if error_rate < 2 else "🔴 Requiere optimización"}
- **Connection Pool**: {"✅ Adecuada" if p95_response_time < 3000 else "⚠️ Revisar configuración"}
- **Memory Usage**: {"✅ Estable" if max_response_time < 10000 else "🔴 Possible memory leaks"}

### Next Steps
1. {"Incrementar carga gradualmente" if test_type == "LOAD" else "Optimizar queries lentas"}
2. {"Implementar cache Redis" if p95_response_time > 1000 else "Mantener configuración actual"}
3. {"Monitorear en producción" if error_rate < 5 else "Fix errors antes de production"}

---
*Report generated by JMeter Performance Analysis Tool*
"""
        
        # Guardar reporte
        with open(f'{output_dir}/{rf_name}_{test_type}_report.md', 'w', encoding='utf-8') as f:
            f.write(report)
        
        # Generar CSV con métricas clave
        metrics_summary = pd.DataFrame({
            'Metric': ['Total_Samples', 'Success_Rate_%', 'Error_Rate_%', 'Avg_Response_Time_ms', 
                      'P90_Response_Time_ms', 'P95_Response_Time_ms', 'P99_Response_Time_ms', 
                      'Throughput_req_per_sec', 'Test_Duration_sec', 'Concurrent_Users'],
            'Value': [total_samples, 100-error_rate, error_rate, avg_response_time,
                     p90_response_time, p95_response_time, p99_response_time,
                     throughput, test_duration, df['threadName'].nunique()]
        })
        metrics_summary.to_csv(f'{output_dir}/{rf_name}_{test_type}_metrics.csv', index=False)
        
        print(f"✅ Analysis completed for {rf_name} {test_type}")
        print(f"📊 Generated: {rf_name}_{test_type}_analysis.png")
        print(f"📄 Generated: {rf_name}_{test_type}_report.md")
        print(f"📈 Generated: {rf_name}_{test_type}_metrics.csv")
        
        return {
            'total_samples': total_samples,
            'error_rate': error_rate,
            'avg_response_time': avg_response_time,
            'throughput': throughput,
            'test_duration': test_duration
        }
        
    except Exception as e:
        print(f"❌ Error analyzing {jtl_file}: {str(e)}")
        return None

if __name__ == "__main__":
    if len(sys.argv) != 5:
        print("Usage: python analyze_results.py <jtl_file> <test_type> <rf_name> <output_dir>")
        print("Example: python analyze_results.py rf5-load.jtl LOAD RF5 reports/")
        sys.exit(1)
    
    jtl_file = sys.argv[1]
    test_type = sys.argv[2]
    rf_name = sys.argv[3]
    output_dir = sys.argv[4]
    
    analyze_jmeter_results(jtl_file, test_type, rf_name, output_dir)

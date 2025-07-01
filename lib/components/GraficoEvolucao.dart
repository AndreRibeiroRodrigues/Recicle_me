import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GraficoEvolucao extends StatelessWidget {
  const GraficoEvolucao({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulando pontos por mês (Jan a Jun)
    final Map<DateTime, int> dadosPorMes = {
      DateTime(2025, 1): 10,
      DateTime(2025, 2): 15,
      DateTime(2025, 3): 12,
      DateTime(2025, 4): 18,
      DateTime(2025, 5): 22,
      DateTime(2025, 6): 25,
    };

    final List<DateTime> meses = dadosPorMes.keys.toList()..sort();
    final List<FlSpot> pontos = List.generate(
      meses.length,
      (i) => FlSpot(i.toDouble(), dadosPorMes[meses[i]]!.toDouble()),
    );

    final formatador = DateFormat('MMM', 'pt_BR');

    return LineChart(
      LineChartData(
        minY: 0,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                int index = value.toInt();
                if (index < 0 || index >= meses.length) return const SizedBox.shrink();
                return Text(formatador.format(meses[index]));
              },
            ),
          ),
        ),
        gridData: FlGridData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: pontos,
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficoPizzaTiposDeLixo extends StatelessWidget {
  const GraficoPizzaTiposDeLixo({super.key});

  @override
  Widget build(BuildContext context) {
    // Dados fictícios para cada tipo
    final Map<String, double> dados = {
      "Papel": 25,
      "Plástico": 35,
      "Vidro": 15,
      "Metal": 10,
      "Alumínio": 15,
    };

    final List<Color> cores = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];

    final List<PieChartSectionData> sections = [];
    int i = 0;

    dados.forEach((tipo, valor) {
      sections.add(PieChartSectionData(
        value: valor,
        title: '$tipo\n${valor.toInt()}%',
        radius: 70,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        color: cores[i % cores.length],
      ));
      i++;
    });

    return Center(
      child: PieChart(
        PieChartData(
          sections: sections,
          centerSpaceRadius: 40,
          sectionsSpace: 2,
        ),
      ),
    );
  }
}
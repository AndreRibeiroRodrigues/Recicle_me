import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recicle_me/Funcoes/fetchPontosPorMes.dart';
import 'package:recicle_me/Funcoes/toFlSpots.dart';

class GraficoEvolucaoMensal extends StatefulWidget {
  const GraficoEvolucaoMensal({super.key});
  @override
  State<GraficoEvolucaoMensal> createState() => _GraficoEvolucaoMensalState();
}

class _GraficoEvolucaoMensalState extends State<GraficoEvolucaoMensal> {
  late Future<Map<DateTime, int>> _future;

  @override
  void initState() {
    super.initState();
    _future = fetchPontosPorMes();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<DateTime, int>>(
      future: _future,
      builder: (context, snap) {
        if (!snap.hasData) return const CircularProgressIndicator();

        final dadosOrdenados = snap.data!;
        final spots = toFlSpots(dadosOrdenados);

        // Formata rótulos de eixo X (Jan/2025, Fev/2025, ...)
        final mesesOrdenados = dadosOrdenados.keys.toList()..sort();
        final formatMes = DateFormat('MMM/yy', 'pt_BR');

        return AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              minY: 0,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 42),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final idx = value.toInt();
                      if (idx < 0 || idx >= mesesOrdenados.length) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          formatMes.format(mesesOrdenados[idx]),
                          style: const TextStyle(fontSize: 11),
                        ),
                      );
                    },
                  ),
                ),
              ),
              gridData: FlGridData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  barWidth: 3,
                  dotData: FlDotData(show: true),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

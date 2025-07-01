import 'package:fl_chart/fl_chart.dart';

List<FlSpot> toFlSpots(Map<DateTime, int> dadosOrdenados) {
  final mesesOrdenados = dadosOrdenados.keys.toList()
    ..sort();                         // garante ordem cronológica
  return List.generate(
    mesesOrdenados.length,
    (i) => FlSpot(
      i.toDouble(),                   // eixo X: índice simples
      dadosOrdenados[mesesOrdenados[i]]!.toDouble(), // eixo Y: pontos
    ),
  );
}
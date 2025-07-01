import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recicle_me/classes/PontosDoc.dart';

Future<Map<DateTime, int>> fetchPontosPorMes() async {
  final snap = await FirebaseFirestore.instance
      .collection('pontos')
      .orderBy('criadoEm')
      .get();

  // 1) Converte cada documento para o modelo
  final docs = snap.docs.map((d) {
    final ts = d['criadoEm'] as Timestamp;
    return PontosDoc(ts.toDate(), d['pontos'] as int);
  });

  // 2) Agrupa por ano‑mês
  final Map<DateTime, int> porMes = {};
  for (var doc in docs) {
    final mes = DateTime(doc.criadoEm.year, doc.criadoEm.month);
    porMes[mes] = (porMes[mes] ?? 0) + doc.pontos;
  }
  return porMes;
}
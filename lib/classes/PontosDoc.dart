// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';

class PontosDoc {
  final DateTime criadoEm;
  final int pontos;
  final String tipo;
  PontosDoc({required this.criadoEm,required this.pontos,required this.tipo});

  factory PontosDoc.fromMap(Map<String, dynamic> map) {
    return PontosDoc(
      criadoEm: map['criadoEm'].toDate(),
      pontos: map['pontos'],
      tipo: map['tipo'],
    );
  }

  // Future<Map<DateTime, int>> fetchPontosPorMes() async {
  //   final snap =
  //       await FirebaseFirestore.instance
  //           .collection('pontos')
  //           .orderBy('criadoEm')
  //           .get();

  //   // 1) Converte cada documento para o modelo
  //   final docs = snap.docs.map((d) {
  //     final ts = d['criadoEm'] as Timestamp;
  //     return PontosDoc(ts.toDate(), d['pontos']);
  //   });

  //   // 2) Agrupa por ano‑mês
  //   final Map<DateTime, int> porMes = {};
  //   for (var doc in docs) {
  //     final mes = DateTime(doc.criadoEm.year, doc.criadoEm.month);
  //     porMes[mes] = (porMes[mes] ?? 0) + doc.pontos;
  //   }
  //   return porMes;
  // }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> buscarNomeUsuario() async {
  try {
    final doc = await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (doc.exists) {
      String nome = doc.get('nome');
      return nome;
    } else {
      return 'Usuário não encontrado';
    }
  } catch (e) {
    return 'Erro ao buscar usuário: $e';
  }
}
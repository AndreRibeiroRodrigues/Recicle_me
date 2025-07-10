import 'package:flutter/material.dart';
import 'package:recicle_me/components/AppbarSimple.dart';
import 'package:recicle_me/components/DrawerSimple.dart';


class Bloginformativo extends StatelessWidget {
  const Bloginformativo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dicas = [
      {
        "titulo": "Separe os Materiais",
        "descricao": "Organize papel, plástico, vidro e metal em recipientes diferentes."
      },
      {
        "titulo": "Lave os Recicláveis",
        "descricao": "Retire restos de alimentos para evitar contaminação dos materiais."
      },
      {
        "titulo": "Evite Desperdício",
        "descricao": "Reutilize potes e embalagens sempre que possível antes de reciclar."
      },
      {
        "titulo": "Conscientize",
        "descricao": "Ensine amigos e familiares sobre a importância da reciclagem."
      },
    ];
    return  Scaffold(
      appBar: getAppBarSimple(context, 'Blog Informativo'),
      drawer: getDrawerSimple(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bem-vindo ao Blog Informativo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Aqui você encontrará informações sobre reciclagem, sustentabilidade e como contribuir para um mundo melhor.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Adicione mais conteúdo aqui
            Container
            (
              child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
      itemCount: dicas.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 colunas
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.5, // largura / altura
      ),
      itemBuilder: (context, index) {
        final dica = dicas[index];
        return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            dica["titulo"]!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 8),
            Expanded(
            child: Text(
              dica["descricao"]!,
              style: const TextStyle(fontSize: 14),
            ),
            ),
          ],
          ),
        ),
        );
      },
      ),
    ),
            )
          ],
        ),
      ),
    );
  }
}
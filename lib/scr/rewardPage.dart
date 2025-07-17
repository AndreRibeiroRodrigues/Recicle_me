import 'package:flutter/material.dart';
import 'package:recicle_me/Funcoes/buscarNomeUsuario.dart';
import 'package:recicle_me/classes/Recompensa.dart';
import 'package:recicle_me/components/AppbarSimple.dart';
import 'package:recicle_me/components/DrawerSimple.dart';
import 'package:recicle_me/components/RewardCard.dart';
import 'package:recicle_me/components/buildPontosCard.dart';

class Rewardpage extends StatefulWidget {
  const Rewardpage({super.key});

  @override
  State<Rewardpage> createState() => _RewardpageState();
}

class _RewardpageState extends State<Rewardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarSimple(context, 'Recompensas'),
      drawer: getDrawerSimple(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            // Header com nome, nível e pontos
            Container(
              width: double.infinity,
              color: Colors.green[700],
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome e Nível
                  FutureBuilder<String>(
                    future: buscarNomeUsuario(),
                    builder: (context, snapshot) {
                      String nome = snapshot.data ?? 'Usuário';
                      return Text(
                        'Olá, $nome 👋',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Nível 1',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 16),

                  // Blocos de pontos
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: WrapAlignment.start,
                    children: [
                      buildPontosCard(
                        icon: Icons.emoji_events,
                        label: 'Pontos Disponíveis',
                        value: '149 pts',
                      ),
                      buildPontosCard(
                        icon: Icons.monetization_on,
                        label: 'Pontos de Hoje',
                        value: '60 pts',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Grid de recompensas
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: 32,
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: recompensas.length, // lista com suas recompensas
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final item = recompensas[index];
                  return RewardCard(
                    image: item.image,
                    points: item.points,
                    title: item.title,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.title} selecionada!')),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recicle_me/components/AppbarSimple.dart';
import 'package:recicle_me/components/DrawerSimple.dart';
import 'package:recicle_me/components/RewardCard.dart';

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
              color: Colors.green[700],
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Saudação e nível
                  Text(
                    'Ola, Usuario',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Nível 1',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      // Pontos Disponíveis
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.emoji_events, color: Colors.yellow[700]),
                            SizedBox(width: 6),
                            Text(
                              'Pontos Disponíveis\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '149 pts',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      // Pontos de Hoje
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: Colors.yellow[700],
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Pontos de Hoje\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '60 pts',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Grid de recompensas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.95,
                children: [
                  RewardCard(
                    image: 'assets/caneca.pngh',
                    points: 100,
                    title: 'Caneca Personalizada',
                  ),
                  RewardCard(
                    image: 'assets/camisa.png',
                    points: 50,
                    title: 'Camisa Verde',
                  ),
                  RewardCard(
                    image: 'assets/cupom.png',
                    points: 500,
                    title: 'Cupom de 15% de Desconto',
                  ),
                  RewardCard(
                    image: 'assets/ovo.png',
                    points: 200,
                    title: 'Ovo de Páscoa',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

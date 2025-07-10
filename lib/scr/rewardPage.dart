import 'package:flutter/material.dart';
import 'package:recicle_me/Funcoes/buscarNomeUsuario.dart';
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Saudação e nível
                  Column(
                    children: [
                      FutureBuilder<String>(
                        future: buscarNomeUsuario(), 
                        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text(
                              'Carregando...',
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              'Erro ao carregar nome',
                              style: TextStyle(color: Colors.white, fontSize: 22),
                            );
                          } else {
                            return Text(
                              'Olá, ${snapshot.data}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                        },
                      ),
                      Text(
                        'Nível 1',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
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
                            Column(
                              children: [
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
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    ],
                  ),
                ],
              ),
            ),
            // Grid de recompensas
            Padding(
              padding: const EdgeInsets.all(100),
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width < 1000 ? 1 : 3,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                
                childAspectRatio: 0.95,
                children: [
                  RewardCard(
                    image: 'assets/images/Camisa.jpeg',
                    points: 100,
                    title: 'Caneca Personalizada',
                    onTap: () {
                      // Ação ao clicar na recompensa
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Recompensa selecionada!')),
                      );
                    },
                  ),
                  RewardCard(
                    image: 'assets/images/Caneca.jpeg',
                    points: 50,
                    title: 'Camisa Verde',
                    onTap: () {
                      // Ação ao clicar na recompensa
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Recompensa selecionada!')),
                      );
                    },
                  ),
                  RewardCard(
                    image: 'assets/images/Cupom.jpeg',
                    points: 500,
                    title: 'Cupom de 15% de Desconto',
                    onTap: () {
                      // Ação ao clicar na recompensa
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Recompensa selecionada!')),
                      );
                    },
                  ),
                  // RewardCard(
                  //   image: 'assets/ovo.png',
                  //   points: 200,
                  //   title: 'Ovo de Páscoa',
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recicle_me/scr/Loginpages/LoginCadastroPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C9328),
      appBar: AppBar(
        backgroundColor: Color(0xff114C10),
        title: Text(
          'Recicle-me',
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Color(0xff1C9328),
        child: SingleChildScrollView(
          child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset('assets/images/Logo.png',
                  width: 400,
                  height: 350,
                  ),
                  Column(
                    children: [
                      Text('Recicle, ganhe recompensas \ne ajude o planeta',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xffffffff),
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginCadastro())
                            ), 
                            child: Text('Começar Agora'),
                            ),
                          // SizedBox(
                          //   width: 20
                          // ),
                          // ElevatedButton(
                          //   onPressed: (){}, 
                          //   child: Text('saiba mais'),
                          //   )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),//
            Padding(
              padding: EdgeInsets.only(top:50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                  children: [
                  Image.asset('assets/images/PostoDeColetaSeletiva.jpg',
                  width: 250,
                  height: 150,
                  ),
                  SizedBox(
                    width: 100),
                  Container(
                    child: Image.asset('assets/images/th.jpg'),
                    color: Color(0xffffffff)),
                  SizedBox(
                    width: 100),
                  Container(
                    child: Image.asset('assets/images/6543.jpg'),
                    width: 300, 
                    height: 150, 
                    color: Color(0xffffffff)),
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50,10,10,10),
              child: Column(
                children: [
                  Text(
                    'Como Funciona',
                    style: TextStyle(
                      fontSize: 30

                    ),
                  ),
                  Text('''
1. Desc arte Consciente: Leve seus materiais recicláveis (como papel, plástico, vidro e metal) aos nossos postos de coleta parceiros.
2. Acúmulo de Pontos: Ao depositar s   eus itens recicláveis, eles serão pesados e convertidos em pontos na sua conta.
3. Resgate seus Prêmios: Com os pontos acumulados, você pode escolher entre uma variedade de recompensas incríveis, desde brindes como canecas e ecobags até descontos especiais em produtos e serviços de nossos parceiros.
    ''',
                style: TextStyle(
                    fontSize: 20
                  ),
                    ),
                ],
              ),
            )
          ],
        ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
         child: SizedBox(
          height: 10.0,
          child: Center(
            child: Text(
              '© 2025 Meu Site',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}

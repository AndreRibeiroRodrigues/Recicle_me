import 'package:flutter/material.dart';
import 'package:recicle_me/components/Textoebotao.dart';
import 'package:recicle_me/components/homepageresponsi.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
        final bool isLargeScreen = MediaQuery.of(context).size.width > 862;


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
        actions: [
          ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/login'), 
          child: Text("Login/Cadastro"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
      
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E7D32), Color(0xFF388E3C)], // Tons de verde
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: isLargeScreen
                ? Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Logo.png',
                            width: 300,
                            height: 300,
                          ),
                          const SizedBox(width: 40),
                          TextoEBotao(context),
                        ],
                      ),
                          imagens(context, isLargeScreen),
                          Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Como Funciona',
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '1. Descarte Consciente: Leve seus materiais recicláveis (como papel, plástico, vidro e metal) aos nossos postos de coleta parceiros.',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2. Acúmulo de Pontos: Ao depositar seus itens recicláveis, eles serão pesados e convertidos em pontos na sua conta.',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '3. Resgate seus Prêmios: Com os pontos acumulados, você pode escolher entre uma variedade de recompensas incríveis, desde brindes como canecas e ecobags até descontos especiais em produtos e serviços de nossos parceiros.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                  )

                  ],
                )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Logo.png',
                        width: 180,
                        height: 180,
                      ),
                      const SizedBox(height: 30),
                    TextoEBotao(context),
                    const SizedBox(height: 30),
                    imagens(context, isLargeScreen),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Como Funciona',
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '1. Descarte Consciente: Leve seus materiais recicláveis (como papel, plástico, vidro e metal) aos nossos postos de coleta parceiros.',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2. Acúmulo de Pontos: Ao depositar seus itens recicláveis, eles serão pesados e convertidos em pontos na sua conta.',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '3. Resgate seus Prêmios: Com os pontos acumulados, você pode escolher entre uma variedade de recompensas incríveis, desde brindes como canecas e ecobags até descontos especiais em produtos e serviços de nossos parceiros.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                  )
                ],
                  ),
          ),
        ),
      ),
    )
    );
  }
}

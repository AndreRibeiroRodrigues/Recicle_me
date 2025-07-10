import 'package:flutter/material.dart';
import 'package:recicle_me/components/AppbarSimple.dart';
import 'package:recicle_me/components/DrawerSimple.dart';
import 'package:recicle_me/components/GraficoEvolucao.dart';
import 'package:recicle_me/components/GraficoPizzaTiposDeLixo.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: getAppBarSimple(context, 'Dashboard'),
      drawer: getDrawerSimple(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo ao Dashboard!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
           Row(
            mainAxisAlignment: MainAxisAlignment.center
            ,
             children: [
               Container(
                  width: 500,
                  height: 300,
                 child: GraficoEvolucao()
               ),
               Container(
                  width: 500,
                  height: 300,
                 child: GraficoPizzaTiposDeLixo()
               ),
             ],
           ),
             ],
           ),
        ),
      
    );
  }
}
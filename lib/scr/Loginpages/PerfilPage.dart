import 'package:flutter/material.dart';

class Perfilpage extends StatefulWidget {
  const Perfilpage({super.key});

  @override
  State<Perfilpage> createState() => _PerfilpageState();
}

class _PerfilpageState extends State<Perfilpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff114C10),
        title: Text('Perfil'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Action for settings
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Perfil do Usuário',
          style: TextStyle(fontSize: 24, color: Color(0xff114C10)),
        ),
      ),
    );
  }
}
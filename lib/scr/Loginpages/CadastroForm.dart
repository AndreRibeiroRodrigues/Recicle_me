import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recicle_me/components/decorations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroForm extends StatelessWidget {
  const CadastroForm({super.key});

  @override
  Widget build(BuildContext context) {
    final CadastroForm = GlobalKey<FormState>();
    // Controladores para os campos de texto
    final nomeController = TextEditingController();
    final emailController = TextEditingController();
    final emailConfController = TextEditingController();
    final senhaController = TextEditingController();
    final senhaConfController = TextEditingController();
    // Retorna um Container com o formulário de cadastro
    return Container(
      color: Color.fromARGB(255, 2, 119, 14),
      width: 600,
      height: 600,
      //Cadastro
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: CadastroForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cadastro',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: nomeController,
                decoration: getAuthenticationDecoration("nome")),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: getAuthenticationDecoration('E-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um e-mail';
                  }
                  // Regex para validar o formato do e-mail
                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailConfController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme seu e-mail';
                  }
                  if (value != emailController.text) {
                    return 'Os e-mails não coincidem';
                  }
                  return null;
                },
                decoration: getAuthenticationDecoration("Confirmar E-mail"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: senhaController,
                decoration: getAuthenticationDecoration('Senha'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma senha';
                  }
                  if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: senhaConfController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, confirme sua senha';
                  }
                  if (value != senhaController.text) {
                    return 'As senhas não coincidem';
                  }
                  return null;
                },
                decoration: getAuthenticationDecoration("Confirmar senha"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: senhaController.text,
                    )
                        .then((value) async {
                          await FirebaseFirestore.instance
                    .collection('usuarios')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .set({
                      'nome': nomeController.text,
                      'criadoEm':
                          FieldValue.serverTimestamp(), // Inicializa com 0 pontos
                    });
                      print("Usuário cadastrado com sucesso");
                    }).catchError((error) {
                      print("Erro ao cadastrar usuário: $error");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Erro ao cadastrar usuário: $error'),
                        ),
                      );
                    }); 
                    print(nomeController.text);
                    // Exibe uma mensagem de sucesso
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Cadastro realizado com sucesso!'),
                      ),  
                    );
                    await Future.delayed(Duration(seconds: 2));
                    // Limpa os campos após o cadastro
                    nomeController.clear();
                    emailController.clear();
                    emailConfController.clear();
                    senhaController.clear();
                    senhaConfController.clear();
                  
                },
                child: Text('Criar Conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroForm extends StatelessWidget {
  final VoidCallback onSwitch;

  const CadastroForm({super.key, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nomeController = TextEditingController();
    final emailController = TextEditingController();
    final emailConfController = TextEditingController();
    final senhaController = TextEditingController();
    final senhaConfController = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            'Cadastro',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: nomeController,
            decoration: _getInputDecoration("Nome"),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: emailController,
            decoration: _getInputDecoration("E-mail"),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Informe um e-mail';
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) return 'E-mail inválido';
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: emailConfController,
            decoration: _getInputDecoration("Confirmar E-mail"),
            validator: (value) {
              if (value != emailController.text)
                return 'Os e-mails não coincidem';
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: senhaController,
            obscureText: true,
            decoration: _getInputDecoration("Senha"),
            validator: (value) {
              if (value == null || value.length < 6) return 'Senha muito curta';
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: senhaConfController,
            obscureText: true,
            decoration: _getInputDecoration("Confirmar Senha"),
            validator: (value) {
              if (value != senhaController.text)
                return 'As senhas não coincidem';
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: senhaController.text,
                  );

                  await FirebaseFirestore.instance
                      .collection('usuarios')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .set({
                        'nome': nomeController.text,
                        'criadoEm': FieldValue.serverTimestamp(),
                      });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cadastro realizado com sucesso!'),
                    ),
                  );

                  onSwitch(); // volta para tela de login
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro ao cadastrar: $e')),
                  );
                  print('Erro ao cadastrar: $e');
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.green[900],
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Criar Conta',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: onSwitch,
            child: const Text(
              'Já tem conta? Fazer login',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _getInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}

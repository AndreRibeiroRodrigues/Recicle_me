import 'package:flutter/material.dart';
import 'package:recicle_me/components/decorations.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback onSwitch;

  const LoginForm({super.key, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final senhaController = TextEditingController();

    return Column(
      children: [
        const Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: emailController,
          decoration: getAuthenticationDecoration('E-mail'),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: senhaController,
          obscureText: true,
          decoration: getAuthenticationDecoration('Senha'),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/RewardPage');
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
            'Entrar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: onSwitch,
          child: const Text(
            'Não tem uma conta? Cadastre-se',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}

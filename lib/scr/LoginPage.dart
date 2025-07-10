import 'package:flutter/material.dart';
import 'package:recicle_me/forms/CadastroForm.dart';
import 'package:recicle_me/forms/LoginForm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;

  void toggleForm() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C9328),
      appBar: AppBar(
        title: const Text('Acesse ou cadastre-se'),
        backgroundColor: const Color(0xff1C9328),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xff0B751F),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: SingleChildScrollView(
            child: isLogin
                ? LoginForm(onSwitch: toggleForm)
                : CadastroForm(onSwitch: toggleForm),
          ),
        ),
      ),
    );
  }
}
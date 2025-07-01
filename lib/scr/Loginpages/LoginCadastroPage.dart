import 'package:flutter/material.dart';
import 'package:recicle_me/scr/Loginpages/CadastroForm.dart';
import 'package:recicle_me/scr/Loginpages/LoginForm.dart';
class LoginCadastro extends StatelessWidget {
  const LoginCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Loge ou cadastre-se para ter acesso a pagina de usuario',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xff1C9328),
      ),
      backgroundColor: Color(0xff1C9328),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Login
            LoginForm(),
            //Cadastro
            CadastroForm(),
          ],
        ),
      ),
    );
  }
}

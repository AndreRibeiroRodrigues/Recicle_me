import 'package:flutter/material.dart';
import 'package:recicle_me/components/decorations.dart';
import 'package:recicle_me/scr/Loginpages/rewardPage.dart';

class LoginCadastro extends StatelessWidget {
  const LoginCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginForm = GlobalKey<FormState>();
    final CadastroForm = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Login e Cadastro',
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
            Container(
              color: Color.fromARGB(255, 2, 119, 14),
              width: 600,
              height: 600,
              //Login
              child: Padding(
                padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 0),
                child: Form(
                  key: LoginForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: getAuthenticationDecoration("E-mail"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: getAuthenticationDecoration("Senha"),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Rewardpage(),
                            ),
                          );
                        },
                        child: Text('Entrar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Cadastro
            Container(
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
                        decoration: getAuthenticationDecoration("nome"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: getAuthenticationDecoration('E-mail'),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: getAuthenticationDecoration("Confirmar E-mail"),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: getAuthenticationDecoration('Senha'),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: getAuthenticationDecoration("Confirmar senha"),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(onPressed: () {}, child: Text('Entrar')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

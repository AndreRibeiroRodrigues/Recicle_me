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
      backgroundColor: Color(0xff1C9328),

      body: Center(
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Color.fromARGB(255, 2, 119, 14),
              width: 600,
              height: 600,
              //Login
              child: Form(
                key: LoginForm,
                child: Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(10, 0, 10, 0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: getAuthenticationDecoration("E-mail")
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha'
                        ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Rewardpage())
                        );
                      }, 
                      child: Text('Entrar'),
                      ),
                  ],
                ),)
              ),
            ),
            Container(
              color: Color.fromARGB(255, 2, 119, 14),
              width: 600,
              height: 600,
              //Cadastro
              child: Form(
                key: CadastroForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email'
                        ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha'
                        ),
                    ),
                    ElevatedButton(
                      onPressed: () {}, 
                      child: Text('Entrar'),
                      ),
                  ],
                ),
              ),
            ),
          ],  
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recicle_me/components/decorations.dart';
import 'package:recicle_me/scr/Loginpages/rewardPage.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginForm = GlobalKey<FormState>();
   
    final emailController = TextEditingController();
    final senhaController = TextEditingController();
    return Container(
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
                        controller: emailController,
                        decoration: getAuthenticationDecoration("E-mail"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira um e-mail';
                          }
                          // Regex para validar o formato do e-mail
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Por favor, insira um e-mail válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: senhaController,
                        decoration: getAuthenticationDecoration("Senha"),
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
                      ElevatedButton(
                        onPressed: () {
                          if (LoginForm.currentState!.validate()) {
                            // Aqui você pode adicionar a lógica de autenticação
                            // Exemplo: FirebaseAuth.instance.signInWithEmailAndPassword(...)
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: senhaController.text,
                            ).then((value) {
                              // Se o login for bem-sucedido, navegue para a página de recompensas
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login realizado com sucesso!')),
                            );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Rewardpage(),
                                ),
                              );
                            }).catchError((error) {
                              // Trate erros de autenticação aqui
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Erro ao fazer login: $error')),
                              );
                            });
                          }
                        },
                        child: Text('Entrar'),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}

import 'package:flutter/material.dart';
import 'package:recicle_me/scr/LoginPage.dart';
import 'package:recicle_me/scr/homePage.dart';
import 'package:recicle_me/scr/rewardPage.dart';
import 'package:recicle_me/scr/textFirebase.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      initialRoute: '/test',
      routes: {
        '/': (context) => Homepage(),
        '/login': (context) => LoginPage(),
        '/RewardPage': (context) => Rewardpage(),
        '/test': (context) => TestFirebase(),
      },
    ); 
  }
}
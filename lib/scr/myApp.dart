
import 'package:flutter/material.dart';
import 'package:recicle_me/scr/LoginPage.dart';
import 'package:recicle_me/scr/homePage.dart';
import 'package:recicle_me/scr/rewardPage.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/': (context) => Homepage(),
        '/login': (context) => LoginPage(),
        '/RewardPage': (context) => Rewardpage()
      },
    ); 
  }
}
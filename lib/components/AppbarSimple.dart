import 'package:flutter/material.dart';
import 'package:recicle_me/scr/Loginpages/PerfilPage.dart';

AppBar getAppBarSimple(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Color(0xff114C10),
    title: Text(
      title,
      style: TextStyle(
        color: Color(0xffffffff),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.person, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Perfilpage()),
          );
        },
      ),
    ],
  );
}

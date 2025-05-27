import 'package:flutter/material.dart';

Drawer getDrawerSimple(BuildContext context) {
  return Drawer(
    backgroundColor: Color(0xff1C9328),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Color(0xff114C10)),
          child: Text(
            'Menu',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home, color: Colors.white),
          title: Text('Página Inicial', style: TextStyle(color: Colors.white)),
          onTap: () {
            // Action for home
          },
        ),
        ListTile(
          leading: Icon(Icons.redeem, color: Colors.white),
          title: Text('Recompensas', style: TextStyle(color: Colors.white)),
          onTap: () {
            // Action for rewards
          },
        ),
        ListTile(
          leading: Icon(Icons.settings, color: Colors.white),
          title: Text('Configurações', style: TextStyle(color: Colors.white)),
          onTap: () {
            // Action for settings
          },
        ),
      ],
    ),
  );
}

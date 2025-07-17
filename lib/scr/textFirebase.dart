import 'package:flutter/material.dart';
import 'package:recicle_me/components/AppbarSimple.dart';

class TestFirebase extends StatelessWidget {
  const TestFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarSimple(context, 'test'),
      body:Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: ListView.builder(itemBuilder: itemBuilder),)
    );
  }
}
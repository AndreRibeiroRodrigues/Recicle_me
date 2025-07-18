import 'package:flutter/material.dart';
import 'package:recicle_me/classes/PontosDoc.dart';
import 'package:recicle_me/components/AppbarSimple.dart';

class TestFirebase extends StatelessWidget {
  const TestFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarSimple(context, 'test'),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: FutureBuilder<List<PontosDoc>>(
          future: BuscarRegistro(),
          builder: builder,
        ),
      ),
    );
  }
}

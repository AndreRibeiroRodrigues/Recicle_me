import 'package:flutter/material.dart';

Widget imagens(BuildContext context, bool isLargeScreen) {
  // final double screenWidth = MediaQuery.of(context).size.width;

  List<Widget> images = [
    Image.asset(
      'assets/images/PostoDeColetaSeletiva.jpg',
      width: 250,
      height: 150,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/th.jpg',
      width: 250,
      height: 150,
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/6543.jpg',
      width: 250,
      height: 150,
      fit: BoxFit.cover,
    ),
  ];

  if (isLargeScreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: images
            .map((img) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: img,
                ))
            .toList(),
      ),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: images
            .map((img) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: img,
                ))
            .toList(),
      ),
    );
  }
}

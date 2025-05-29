import 'package:flutter/material.dart';

InputDecoration getAuthenticationDecoration(String label) {
  return InputDecoration(
    label: Text(label),
    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: Colors.blue, width: 2),
    ),
  );
}

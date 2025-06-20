import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recicle_me/firebase_options.dart';
import 'package:recicle_me/scr/myApp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


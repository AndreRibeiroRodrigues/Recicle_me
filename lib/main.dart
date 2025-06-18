import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recicle_me/firebase_options.dart';
import 'package:recicle_me/scr/myApp.dart';

<<<<<<< HEAD
void main() {
  
=======
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
>>>>>>> e7f66e3 (Firebase Configurado_18061713)
  runApp(const MyApp());
}


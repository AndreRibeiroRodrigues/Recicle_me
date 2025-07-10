import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recicle_me/firebase_options.dart';
import 'package:recicle_me/scr/myApp.dart';
import 'package:intl/date_symbol_data_local.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(const MyApp());
}


import 'package:flutter/material.dart';
import 'package:projet_flutter/screens/Accueil.dart';
import 'package:projet_flutter/screens/exemple.dart';
import 'screens/LoginScreen.dart';
import 'screens/ScreenPrincipal.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenPrincipal();
  }
}

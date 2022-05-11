import 'package:flutter/material.dart';
import 'package:projet_flutter/screens/LoginScreen.dart';
import 'package:projet_flutter/screens/ScreenPrincipal.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoginScreen();
  }
}

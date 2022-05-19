import 'package:flutter/material.dart';
import 'package:projet_flutter/screens/EntryApp.dart';
import 'package:projet_flutter/screens/Login.dart';

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
    return Login();
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'CONSTANTS/color.dart';

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
    return Scaffold(
      body: Center(
        child: Text(
          "mandela",
          style: TextStyle(color: HexColor(COLOR_SUBTITLE_MESSAGE)),
        ),
      ),
    );
  }
}

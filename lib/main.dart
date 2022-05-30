import 'package:flutter/material.dart';
import 'package:projet_flutter/screens/DetailDoctor.dart';
import 'package:projet_flutter/screens/EntryApp.dart';
import 'package:projet_flutter/screens/Home.dart';
import 'package:projet_flutter/screens/ListDoctors.dart';
import 'package:projet_flutter/screens/Medication.dart';
import 'package:projet_flutter/screens/PrescriptionDetail.dart';

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
    return EntryApp();
  }
}

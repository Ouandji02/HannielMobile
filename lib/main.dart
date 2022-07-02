import 'package:flutter/material.dart';
import 'package:projet_flutter/screens/EntryApp.dart';
import 'package:projet_flutter/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      top: true,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  String userId = "";

  @override
  void initState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId")!;
  }

  @override
  Widget build(BuildContext context) {
    return userId == null ? EntryApp() : Home();
  }
}

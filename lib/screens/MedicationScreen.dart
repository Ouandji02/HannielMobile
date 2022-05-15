import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_flutter/widgets/BottomNavigation.dart';

import '../widgets/BottomNavigation.dart';

class MedicamentScreen extends StatefulWidget {
  const MedicamentScreen({Key? key}) : super(key: key);

  @override
  _MedicamentScreenState createState() => _MedicamentScreenState();
}

class _MedicamentScreenState extends State<MedicamentScreen> {
  int selectedIndex = 0;
  double heightScreen = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0XFF001B2E),
      appBar: AppBar(
        backgroundColor: Color(0XFF001B2E),
        title: Text("Medication List",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

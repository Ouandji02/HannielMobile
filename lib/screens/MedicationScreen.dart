import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/widgets/BottomNavigation.dart';
import 'package:projet_flutter/widgets/MedicationWidget.dart';

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
      backgroundColor: HexColor('1c2d38'),
      appBar: AppBar(
        toolbarHeight: height / 9,
        backgroundColor: HexColor('1c2d38'),
        title: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text("Medication List",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(
                fontSize: 12.0,
                height: .10,
              ),
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                fillColor: Colors.white.withOpacity(0.1),
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.w300),
                hintText: 'Search medication...',
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            MedicamentWidget(),
            MedicamentWidget(),
            MedicamentWidget(),
            MedicamentWidget(),
            MedicamentWidget(),
            MedicamentWidget(),
            MedicamentWidget(),
            MedicamentWidget(),
            MedicamentWidget(),
            MedicamentWidget()
          ],
        ),
      ),
    );
  }
}

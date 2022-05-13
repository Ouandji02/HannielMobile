import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projet_flutter/widgets/BottomNavigation.dart';
import 'package:projet_flutter/widgets/MedicamentWidget.dart';

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
        backgroundColor: const Color(0xFFF0F2F8),
        appBar: AppBar(
            centerTitle: true,
            toolbarHeight: height / 6,
            elevation: 0,
            backgroundColor: const Color(0xff008ED6),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            title: const SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.white,
                  hintText: 'Search medicament...',
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
            )),
        bottomNavigationBar: BottomNavigation(selectedIndex),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: const [
                MedicamentWidget(),
                MedicamentWidget(),
                MedicamentWidget(),
                MedicamentWidget(),
                MedicamentWidget(),
                MedicamentWidget(),
                MedicamentWidget(),
              ],
            )));
  }
}

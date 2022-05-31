import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/DetailDoctor.dart';
import 'package:projet_flutter/screens/Messaging.dart';
import 'package:projet_flutter/screens/pages/Dashboard.dart';
import 'package:projet_flutter/screens/pages/ListVisit.dart';
import 'package:projet_flutter/screens/pages/Medication.dart';
import 'package:projet_flutter/widgets/CustomBottomNavigation.dart';
import 'package:projet_flutter/widgets/Drawer.dart';

import 'Notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  int index = 0;

  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    final pages = [Dashboard(screen), ListVisit(), Medication1(screen)];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "MediApp",
            style: TextStyle(color: HexColor(COLOR_PRIMARY)),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()));
              },
              child: Icon(
                Icons.notifications_none_outlined,
                color: HexColor(COLOR_PRIMARY),
              ),
            )
          ],
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.reorder_outlined,
                color: HexColor(COLOR_PRIMARY),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )),
      drawer: DrawerLayout("user", context),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: HexColor(COLOR_PRIMARY).withOpacity(.8),
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          elevation: 1,
          selectedIndex: index,
          onDestinationSelected: (index) {
            setState(() {
              this.index = index;
            });
          },
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: index == 0 ? Colors.white : Colors.black,
                ),
                label: 'home'),
            NavigationDestination(
                icon: Icon(Icons.person,
                    color: index == 1 ? Colors.white : Colors.black),
                label: 'profil'),
            NavigationDestination(
                icon: Icon(Icons.message_rounded,
                    color: index == 2 ? Colors.white : Colors.black),
                label: 'message'),
            NavigationDestination(
                icon: Icon(Icons.medication_outlined), label: 'medicament'),
          ],
        ),
      ),
      body: pages[index],
    );
  }
}

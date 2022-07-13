import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/function/getCoordonates.dart';
import 'package:projet_flutter/function/getUserStorage.dart';
import 'package:projet_flutter/screens/pages/Dashboard.dart';
import 'package:projet_flutter/screens/pages/Medication.dart';
import 'package:projet_flutter/screens/pages/Messages.dart';
import 'package:projet_flutter/screens/pages/ProfilAndList.dart';
import 'package:projet_flutter/widgets/Drawer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API_SERVICES/userApi.dart';
import '../classes/Coordonate.dart';
import '../classes/UserClass.dart';
import '../provider/DataClass.dart';
import 'notification/Notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() {
    return _Home();
  }
}

class _Home extends State<Home> {

  @override
  void initState() {
    super.initState();
    var c =getCoordonate();
    print('sfffffffff $c');
    final userModel = Provider.of<DataClass>(context, listen: false);
    userModel.getUserData();
    userModel.getCoordonate();
  }

  @override
  int index = 0;

  Widget build(BuildContext context) {
    final pages = [Dashboard1(), ProfilAndList(), Medication()];
    final userModel = Provider.of<DataClass>(context, listen: false);
    userModel.getUserData();
    userModel.getCoordonate();
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                "Teemes",
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
          drawer: DrawerLayout(),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor: HexColor(COLOR_PRIMARY).withOpacity(.8),
              labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 14),
              ),
            ),
            child: NavigationBar(
              backgroundColor: Colors.white,
              //elevation: 1,
              selectedIndex: index,
              onDestinationSelected: (index) {
                setState(() {
                  this.index = index;
                });
              },
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
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
                    icon: Icon(Icons.medication_outlined,
                        color: index == 2 ? Colors.white : Colors.black),
                    label: 'medicament'),
              ],
            ),
          ),
          body: pages[index],
        ),
        onWillPop: () => exit(0));
  }
}

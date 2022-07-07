import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/campagne/ListCampagne.dart';
import 'package:projet_flutter/screens/doctor/ListDoctors.dart';
import 'package:projet_flutter/screens/hopitaux/ListHospitals.dart';
import 'package:projet_flutter/screens/pharmacy/Pharmacy.dart';
import 'package:projet_flutter/screens/settings/Settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../classes/UserClass.dart';
import '../function/getUserStorage.dart';
import '../screens/Home.dart';
import '../screens/Login.dart';
import '../screens/profil/Profil.dart';

class DrawerLayout extends StatefulWidget {
  @override
  _DrawerLayout createState() {
    // TODO: implement createState
    return _DrawerLayout();
  }
}

class _DrawerLayout extends State<DrawerLayout> {
  var user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = getUserStorage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Material(
        color: HexColor(COLOR_PRIMARY),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            FutureBuilder(
              future: getUserStorage(),
              builder: (context,snapshot) {
                print('affichekkkkkkkkkkkkkkkkkkkkkkkkk ${snapshot.data}');
                if (snapshot.hasData) {
                  return userAccountHeader(
                      snapshot.data!, snapshot.data!);
                } else {
                  return userAccountHeader("John Doe", "xxxxx@gmail.com");
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            MenuList(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => selectItem(context, 0)),
            const SizedBox(
              height: 5,
            ),
            MenuList(
                text: 'Profile',
                icon: Icons.person,
                onClicked: () => selectItem(context, 1)),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.white,
            ),
            MenuList(
                text: 'Hopitaux',
                icon: Icons.local_hospital,
                onClicked: () => selectItem(context, 2)),
            const SizedBox(
              height: 5,
            ),
            MenuList(
                text: 'Pharmacies',
                icon: Icons.local_pharmacy,
                onClicked: () => selectItem(context, 3)),
            const SizedBox(
              height: 5,
            ),
            MenuList(
                text: 'Specialistes',
                icon: Icons.person_sharp,
                onClicked: () => selectItem(context, 4)),
            const SizedBox(
              height: 5,
            ),
            /* MenuList(
              text: 'Bookmarks',
              icon: Icons.bookmark,
              onClicked: () => selectItem(context, 5)),
          const SizedBox(
            height: 5,
          ), */
            const Divider(
              color: Colors.white,
            ),
             MenuList(
              text: 'campagne',
              icon: Icons.notifications,
              onClicked: () => selectItem(context, 6)),
          const SizedBox(
            height: 5,
          ),
            MenuList(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectItem(context, 7)),
            const SizedBox(
              height: 5,
            ),
            MenuList(
                text: 'Logout',
                icon: Icons.logout,
                onClicked: () => selectItem(context, 8))
          ],
        ),
      ),
    );
  }
}

Widget userAccountHeader(name, email) => Container(
      color: HexColor(COLOR_PRIMARY),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/undraw_doctors_hwty.png'),
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            email,
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );

Widget MenuList(
    {required String text, required IconData icon, VoidCallback? onClicked}) {
  const color = Colors.white;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: const TextStyle(color: color),
    ),
    onTap: onClicked,
  );
}

selectItem(BuildContext context, index) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  switch (index) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
      break;
    case 1:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfilUser(),
        ),
      );
      break;
    case 2:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Hospital(),
        ),
      );
      break;
    case 3:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Pharmacy(),
        ),
      );
      break;
    case 4:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ListDoctors(),
        ),
      );
      break;
    case 6:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Campagne(),
        ),
      );
      break;
    case 7:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Settings(title: "Settings")),
      );
      break;
    case 8:
      prefs.remove("userId");
      prefs.clear();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
      break;
  }
}

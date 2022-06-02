import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/ListDoctors.dart';
import 'package:projet_flutter/screens/pages/Medication.dart';
import 'package:projet_flutter/screens/Settings.dart';

import '../screens/Home.dart';
import '../screens/Profil.dart';

Widget DrawerLayout(user, context) {
  return Drawer(
      child: Material(
    color: HexColor(COLOR_PRIMARY),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        user != null
            ? userAccountHeader(user, user)
            : userAccountHeader('name', 'email@gmail.com'),
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
        /* MenuList(
              text: 'Notification',
              icon: Icons.notifications,
              onClicked: () => selectItem(context, 6)),
          const SizedBox(
            height: 5,
          ), */
        MenuList(
            text: 'Settings',
            icon: Icons.settings,
            onClicked: () => selectItem(context, 7)),
        const SizedBox(
          height: 5,
        ),
        user == null
            ? MenuList(
                text: 'Login',
                icon: Icons.login,
                onClicked: () => selectItem(context, 8))
            : MenuList(
                text: 'Logout',
                icon: Icons.logout,
                onClicked: () => selectItem(context, 9)),
      ],
    ),
  ));
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
          builder: (context) => Profil(),
        ),
      );
      break;
    /*case 2:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Pharmacy(),
        ),
      );
      break;
    */case 3:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Medication(),
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
      case 7:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Settings(title: "Settings")
        ),
      );
      break;
    /*case 8:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
      break;*/
  }
}

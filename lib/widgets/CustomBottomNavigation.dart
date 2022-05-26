import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/Messaging.dart';

import '../CONSTANTS/color.dart';

CustomBottomNavigation(BuildContext context) =>
    CurvedNavigationBar(backgroundColor: HexColor(COLOR_PRIMARY), items: [
      TextButton(
          onPressed: null,
          child: Icon(
            Icons.home,
            color: HexColor(COLOR_PRIMARY),
            size: 20,
          )),
      TextButton(
          onPressed: null,
          child: Icon(Icons.person_rounded,
              color: HexColor(COLOR_PRIMARY), size: 20)),
      TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Messaging()));
          },
          child: Icon(Icons.message_rounded,
              color: HexColor(COLOR_PRIMARY), size: 20)),
      TextButton(
          onPressed: null,
          child: Icon(Icons.medication_rounded,
              color: HexColor(COLOR_PRIMARY), size: 20))
    ]);

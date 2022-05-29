import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/Messaging.dart';

import '../CONSTANTS/color.dart';

CustomBottomNavigation(BuildContext context, int index) => CurvedNavigationBar(
        backgroundColor: HexColor(COLOR_PRIMARY),
        index: index,
        items: [
          TextButton(
              onPressed: ()=>index = 0,
              child: Icon(
                Icons.home,
                color: HexColor(COLOR_PRIMARY),
                size: 20,
              )),
          TextButton(
              onPressed: ()=>index = 1,
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
              onPressed: ()=>index = 2,
              child: Icon(Icons.medication_rounded,
                  color: HexColor(COLOR_PRIMARY), size: 20))
        ]);

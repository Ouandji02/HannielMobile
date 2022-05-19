import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';

CustomBottomNavigation() {
  BottomNavigationBar(
    elevation: 0,
    selectedItemColor: HexColor(COLOR_PRIMARY),
    unselectedItemColor: HexColor(COLOR_UNSELECTED_ICON),
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded,
              color: HexColor(COLOR_PRIMARY), size: 20),
          label: ""),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded,
              color: HexColor(COLOR_PRIMARY), size: 20),
          label: ""),
      BottomNavigationBarItem(
          icon:
              Icon(Icons.add_rounded, color: HexColor(COLOR_PRIMARY), size: 20),
          label: ""),
      BottomNavigationBarItem(
          icon: Icon(Icons.message_rounded,
              color: HexColor(COLOR_PRIMARY), size: 20),
          label: ""),
      BottomNavigationBarItem(
          icon: Icon(Icons.medication_rounded,
              color: HexColor(COLOR_PRIMARY), size: 20),
          label: ""),
    ],
  );
}

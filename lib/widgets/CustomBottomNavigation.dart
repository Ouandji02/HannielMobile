import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';

CustomBottomNavigation() {
  return BottomNavigationBar(
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

CustomBottomNavigation1() => CurvedNavigationBar(
  backgroundColor: HexColor(COLOR_PRIMARY),
    items: [
      Icon(Icons.home, color: HexColor(COLOR_PRIMARY), size: 30),
      Icon(Icons.person_rounded, color: HexColor(COLOR_PRIMARY), size: 30),
      Icon(Icons.message_rounded, color: HexColor(COLOR_PRIMARY), size: 30),
      Icon(Icons.medication_rounded, color: HexColor(COLOR_PRIMARY), size: 30),
    ]);

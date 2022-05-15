import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';

BottomNavigation(selectedIndex) {
  return BottomNavigationBar(
    backgroundColor: HexColor(PRIMARY_COLOR),
    type: BottomNavigationBarType.fixed,
    currentIndex: selectedIndex,
    selectedItemColor: const Color(0xff5fbeff),
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'pharmacy'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'message'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'calendar'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'profile'),
    ],
  );
}

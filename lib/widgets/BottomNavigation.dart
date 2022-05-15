import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

BottomNavigation(selectedIndex) {
  return BottomNavigationBar(
    backgroundColor: HexColor('001B2E'),
    type: BottomNavigationBarType.fixed,
    currentIndex: selectedIndex,
    selectedItemColor: HexColor('5FBEFF'),
    items: const [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          label: 'home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.local_pharmacy, color: Colors.white),
          label: 'pharmacy'),
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white), label: 'message'),
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.white), label: 'calendar'),
      BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.white), label: 'profile'),
    ],
  );
}

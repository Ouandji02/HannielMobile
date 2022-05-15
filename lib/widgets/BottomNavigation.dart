import 'package:flutter/material.dart';

BottomNavigation(selectedIndex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: selectedIndex,
    selectedItemColor: const Color(0xff008ED6),
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'pharmacy'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'message'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'calendar'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'profile'),
    ],
  );
}

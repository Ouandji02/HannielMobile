import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';
import '../screens/Home.dart';

AppBarItem(title){
  return AppBar(
      title: Text(title,
          style: TextStyle(
              color: HexColor(COLOR_PRIMARY),
              fontSize: 18,
              fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: HexColor(COLOR_PRIMARY),
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()))),
      ));
}
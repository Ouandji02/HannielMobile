import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';

class Medication extends StatefulWidget {
  const Medication({Key? key}) : super(key: key);

  @override
  _Medication createState() {
    return _Medication();
  }
}

class _Medication extends State<Medication> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: HexColor(COLOR_PRIMARY),
              size: 30,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Medicaments",
            style: TextStyle(color: HexColor(COLOR_TITLE)),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Chip(
            label: Text("bb"),
          ),
        ));
  }
}

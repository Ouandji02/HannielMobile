import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  _PatientDetails createState() {
    return _PatientDetails();
  }
}
class _PatientDetails extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {

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
          "Prescription Detail",
          style: TextStyle(color: HexColor(COLOR_TITLE)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              null;
            },
            child: Icon(
              Icons.search,
              color: HexColor(COLOR_PRIMARY),
            ),
          )
        ],
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(color: Colors.white),
              )
            ],
          )
      ),
    );
  }
}

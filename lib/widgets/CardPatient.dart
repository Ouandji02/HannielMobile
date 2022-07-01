import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';

Widget CardPatient(size,percent){
  return Container(
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.only(
        top: size.height * .025, left: size.width * .1),
    decoration: BoxDecoration(color: HexColor(COLOR_CARD)),
    height: size.height * .20,
    width: size.width * percent,
    child: Stack(
      children: [
        Positioned(
            child: Icon(
              Icons.medical_services_outlined,
              size: size.height * .1,
            )),
        Positioned(
          child: Text(
            "Physical\nExamination",
            style: TextStyle(
                color: HexColor(COLOR_TITLE),
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          left: size.width * .25,
          top: size.height * .015,
        ),
        Positioned(
          child: Text(
            "14/02/2019",
            style: TextStyle(color: HexColor(COLOR_TITLE)),
          ),
          left: size.width * .25,
          top: size.height * .075,
        ),
        Positioned(
            child: InkWell(
              child: Row(
                children: [
                  Text(
                    "See  reports",
                    style: TextStyle(
                        color: HexColor(COLOR_PRIMARY),
                        fontSize: 16),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: HexColor(COLOR_PRIMARY),
                  ),
                ],
              ),
            ),
            left: size.width * .25,
            bottom: size.height * .01)
      ],
    ),
  );
}
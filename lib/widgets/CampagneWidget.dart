import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget CampagneWidget(context) {
  final size = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(right: 30, top: 10),
    height: size.height * .18,
    width: size.width * .7,
    decoration: BoxDecoration(
        color: HexColor('0061A4'),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(.2),
              offset: Offset(0, -3),
              blurRadius: 20,
              spreadRadius: 3)
        ]),
    child: Stack(
      children: [
        Text(
          'Campagne de vaccination gratuite contre la rougeole',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            alignment: AlignmentDirectional.centerStart,
            child: ElevatedButton.icon(
              onPressed: () {
                print('object');
              },
              label: Text(
                'En svoir plus',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black12,
                elevation: 0,
              ),
              icon: Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.blueAccent,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: -10,
          child: Image(
            image: AssetImage('assets/images/undraw_doctors_hwty.png'),
            height: size.height * .11,
          ),
        )
      ],
    ),
  );
}

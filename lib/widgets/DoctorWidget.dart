import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/DoctorDetailScreen.dart';

Widget DoctorWidget(context) {
  final size = MediaQuery.of(context).size;
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DoctorDetailScreen()));
    },
    child: Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(.2),
                blurRadius: 20,
                offset: Offset(0, -2),
                spreadRadius: 3)
          ],
          color: HexColor(PRIMARY_COLOR)),
      width: size.width * .9,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
              image:  DecorationImage(
                  image: NetworkImage('https://thumbs.dreamstime.com/b/portrait-black-male-doctor-stethoscope-white-background-smiling-176051856.jpg'),
                  fit: BoxFit.cover),
            ),
            width: size.width * .2,
            height: size.height * .12,
          ),
          Container(
            height: size.height * .1,
            width: size.width * .45,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dr. Simo Larissa ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Health surgeon',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Service: 4 etoiles',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

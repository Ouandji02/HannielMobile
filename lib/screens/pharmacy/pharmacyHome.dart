import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/classes/PharmacyModel.dart';

import '../../CONSTANTS/color.dart';
import 'DetailPharmacy.dart';

Widget pharmacyHome(context, data, index) {
  final size = MediaQuery.of(context).size;
  return InkWell(
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPharmacy(
              nom: data[index].nom,
              long: data[index].longitude,
              lat: data[index].latitude,
              image: data[index].logo,
              desc: data[index].description,
              phone: data[index].phone,
              pharmacyUid: data[index].id,
            ))),
      child: Container(
        margin: EdgeInsets.only(right: 30, top: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(.2),
                blurRadius: 20,
                offset: Offset(0, -2),
                spreadRadius: 3)
          ],),
        width: size.width * .7,
        child: Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    //width: 150,
                    child: Image(image: NetworkImage(data[index].logo),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data[index].nom,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: HexColor(COLOR_TITLE),
                        fontSize: size.width / 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data[index].phone,
                    style: TextStyle(
                        color: HexColor(COLOR_TITLE),
                        fontSize: size.width / 23),
                  ),
                ],
              ),
            )),)
  );
}
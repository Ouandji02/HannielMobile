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
                    nom: data[index].nom.toString(),
                    long: data[index].longitude.toString(),
                    lat: data[index].latitude.toString(),
                    image: data[index].logo.toString(),
                    desc: data[index].description.toString(),
                    phone: data[index].phone.toString(),
                    pharmacyUid: data[index].id.toString(),
                  ))),
      child: Container(
        margin: EdgeInsets.only(right: 30, top: 10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(.01),
                blurRadius: 3,
                offset: Offset(0, -1),
                spreadRadius: 3)
          ],
        ),
        width: size.width * .7,
        child: Card(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data[index].logo),fit: BoxFit.fill)),
                    width: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data[index].nom.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: HexColor(COLOR_TITLE),
                        fontSize: size.width / 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child:Text(
                      data[index].distance.toString(),
                      style: TextStyle(
                          color: HexColor(COLOR_TITLE),
                          fontSize: size.width / 23),
                    ) ,
                  )
                  ,
                ],
              ),
            )),
      ));
}

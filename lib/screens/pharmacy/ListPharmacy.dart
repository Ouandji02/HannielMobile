import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/pharmacy/DetailPharmacy.dart';

Widget pharmacyWidget(context, snapshot, index) {
  final size = MediaQuery.of(context).size;
  return Container(
      margin: EdgeInsets.only(right: 10, top: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(.1),
                blurRadius: 2,
                offset: Offset(0, -1),
                spreadRadius: 1)
          ],
          color: Colors.white),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image:
                    DecorationImage(image: NetworkImage(snapshot[index].logo))),
            width: size.width * .3,
            height: size.height * .19,
          ),
          Container(
              width: size.width * .6,
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      snapshot[index].nom,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: HexColor(COLOR_TITLE)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      snapshot[index].email,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'phone: ${snapshot[index].phone}',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextButton.icon(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: HexColor(COLOR_PRIMARY)))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailHospital(
                                    nom: snapshot[index].nom,
                                    image: snapshot[index].logo,
                                    desc: snapshot[index].description),
                              ),
                            );
                          },
                          label: Text(
                            "Detail",
                            style: TextStyle(color: HexColor(COLOR_PRIMARY)),
                          ),
                          icon: Icon(
                            Icons.arrow_left,
                            color: HexColor(COLOR_PRIMARY),
                          ),
                        )),
                  )
                ],
              ))
        ],
      ));
}

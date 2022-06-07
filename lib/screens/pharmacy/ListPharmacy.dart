import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/pages/Medication.dart';

Widget pharmacyWidget(context) {
  final size = MediaQuery.of(context).size;
  return Container(
      margin: EdgeInsets.only(right: 30, top: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(.1),
                blurRadius: 20,
                offset: Offset(0, -1),
                spreadRadius: 3)
          ],
          color: Colors.white),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2016/08/29/14/25/medications-1628372__340.jpg"))),
            width: size.width * .3,
            height: size.height * .16,
          ),
          Container(
              width: size.width * .45,
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pharmacie du District ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gerant: Dr BAPEMBE',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Service: 4 etoiles',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ),
                  Container(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Medication(),
                            ),
                          );
                        },
                        label: Text(
                          'Voir les medicaments',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              HexColor(COLOR_PRIMARY)),
                          minimumSize: MaterialStateProperty.all(
                              Size(size.width * .3, 30)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        icon: Icon(
                          Icons.medication_outlined,
                          color: Colors.white,
                        ),
                      ),
                      alignment: AlignmentDirectional.centerStart)
                ],
              ))
        ],
      ));
}

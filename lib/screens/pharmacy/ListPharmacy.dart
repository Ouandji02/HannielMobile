import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/pages/Medication.dart';

import '../../API_SERVICES/pharmacyApi.dart';

Widget pharmacyWidget(context, snapshot,index) {
  final size = MediaQuery.of(context).size;
  return Container(
      margin: EdgeInsets.only(right: 10, top: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
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
                image: DecorationImage(image: NetworkImage(snapshot[index].logo))),
            width: size.width * .3,
            height: size.height * .22,
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
                      child: ElevatedButton.icon(
                        onPressed: () {
                          PharmacyApi.getPharmacy();
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

import 'package:flutter/material.dart';

Widget pharmacyWidget(context) {
  final size = MediaQuery.of(context).size;
  return Container(
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
          ],
          color: const Color(0xff008ED6)),
      width: size.width * .7,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.red),
            width: size.width * .2,
            height: size.height * .16,
          ),
          Container(
              height: size.height * .17,
              width: size.width * .45,
              padding: EdgeInsets.only(left: 10, top: 5),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pharmacie du District ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gerant: Dr BAPEMBE',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Service: 4 etoiles',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    ),
                  ),
                  Container(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print('object');
                        },
                        label: Text(
                          'Voir sur la carte',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black12,
                            elevation: 0),
                        icon: Icon(
                          Icons.location_on_outlined,
                          color: Colors.blueAccent,
                        ),
                      ),
                      alignment: AlignmentDirectional.centerStart)
                ],
              ))
        ],
      ));
}

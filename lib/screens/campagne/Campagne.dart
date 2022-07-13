import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/campagne/DetailCampagne.dart';
import 'package:projet_flutter/screens/pharmacy/DetailPharmacy.dart';

Widget campagneWidget(context, snapshot, index) {
  final size = MediaQuery.of(context).size;
  return Container(
    height: size.height * .16,
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(
        top: size.height * .025, left: size.width * .025),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
      boxShadow: [
        BoxShadow(
            color: Colors.black12.withOpacity(.1),
            blurRadius: 5,
            offset: Offset(0, -1),
            spreadRadius: 1)
      ],
    ),
    width: size.width * .7,
    child: Stack(
      children: [
        Positioned(
          child: Text(
            snapshot[index].nom,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          top: size.height * .01,
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(snapshot[index].image),
                fit: BoxFit.cover,
              ),
            ),
            height: size.height * .05,
            width: size.width * .12,
          ),
          bottom: 10,
          right: 10,
        ),
        Positioned(
            child: TextButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Colors.white),
                  side: MaterialStateProperty.all(
                      BorderSide(color: HexColor(COLOR_PRIMARY)))
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailCampagne(
                        nom: snapshot[index].nom,
                        image: snapshot[index].image,
                        desc: snapshot[index].description,
                        date_fin: snapshot[index].date_fin,
                        date_deb: snapshot[index].date_deb,
                        resp: snapshot[index].responsable,
                      ),
                    )
                );
              },
              icon: Icon(
                Icons.remove_red_eye_rounded,
                color:HexColor(COLOR_PRIMARY),
              ),
              label: Text(
                "En savoir plus",
                style: TextStyle(color: HexColor(COLOR_PRIMARY)),
              ),
            ),bottom: 10),
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../CONSTANTS/color.dart';
import '../../widgets/CardPatient.dart';
import '../profil/Profil.dart';

class ListCampagne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(
                      top: size.height * .025, left: size.width * .1),
                  decoration: BoxDecoration(color: HexColor(COLOR_CARD)),
                  height: size.height * .20,
                  width: size.width * 1,
                  child: Stack(
                    children: [
                      Positioned(
                          child: Icon(
                            Icons.add_box_outlined,
                            size: size.height * .1,
                          )),
                      Positioned(
                        child: Text(
                          "Consultation des yeux",
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
                          "Hopital du district",
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
                                  "See  more",
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
                );;
              },
              itemCount: 4,
            ),
          )),
    );
  }
}

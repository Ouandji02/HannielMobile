import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/Profil.dart';
import 'package:projet_flutter/widgets/CardPatient.dart';

import '../../CONSTANTS/color.dart';
import '../../widgets/Drawer.dart';
import '../Notifications.dart';

class ListVisit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.only(left: 10),
              width: size.width,
              child: Row(
                children: [
                  Container(
                    height: size.height * .2,
                    width: size.width * .15,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Text(
                            "FEB 11",
                            style: TextStyle(
                                color: HexColor(
                                  COLOR_TITLE,
                                ),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        Positioned(
                          child: Text(
                            "Tue 17:00",
                            style: TextStyle(color: Colors.grey),
                          ),
                          top: 20,
                        )
                      ],
                    ),
                  ),
                  CardPatient(size, 0.7)
                ],
              ),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}

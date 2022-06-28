import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/prescription/PrescriptionDetail.dart';

import '../../CONSTANTS/color.dart';
import '../../widgets/CardPatient.dart';

class ListPrescription extends StatelessWidget {
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
                  width: size.width,
                  child: Stack(
                    children: [
                      Positioned(
                          child: Icon(
                        Icons.medical_services_outlined,
                        size: size.height * .1,
                            color: Colors.white,
                      )),
                      Positioned(
                        child: Text(
                          "Pharyngitis recipe",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        left: size.width * .25,
                        top: size.height * .015,
                      ),
                      Positioned(
                        child: Text(
                          "Given at 14/02/2019",
                          style: TextStyle(color: Colors.white),
                        ),
                        left: size.width * .25,
                        top: size.height * .075,
                      ),
                      Positioned(
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PrescriptionDetail())),
                            child: Row(
                              children: [
                                Text(
                                  "See  reports",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          left: size.width * .25,
                          bottom: size.height * .01)
                    ],
                  ),
                );
              },
              itemCount: 4,
            ),
          )),
    );
  }
}

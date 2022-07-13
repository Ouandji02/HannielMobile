 import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:projet_flutter/screens/doctor/ListDoctors.dart';
import 'package:projet_flutter/screens/notification/MedicationScreen.dart';

import '../../CONSTANTS/color.dart';

class DetailCampagne extends StatelessWidget {
  late String? nom;
  late String? image;
  late String? desc;
  late String? date_deb;
  late String? date_fin;
  late String? resp;

  DetailCampagne({
    required this.nom,
    required this.image,
    required this.desc,
    required this.date_deb,
    required this.date_fin,
    required this.resp,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: size.height),
          padding: EdgeInsets.only(top: 0),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: size.height * .35,
                width: size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(this.image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 5,
                        left: 5,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: HexColor(COLOR_PRIMARY),
                              size: size.height * .04,
                            )))
                  ],
                ),
              ),
              Container(
                height: size.height * .5,
                padding: EdgeInsets.only(
                    left: size.width * .05, right: size.width * .05),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * .1,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Stack(
                        children: [
                          Positioned(
                              top: (size.height * .13) / 3 - 20,
                              child: Text(
                                "Du " + this.date_deb! + " au " + this.date_fin!,
                                style: TextStyle(color: Colors.green),
                              )),
                          Positioned(
                            top: (size.height * .13) / 3,
                            child: Text(
                              this.nom!,
                              style: TextStyle(
                                color: HexColor(COLOR_TITLE),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                              top: (size.height * .13) / 3 + 30,
                              child: Text(
                                this.resp!,
                                style: TextStyle(color: Colors.black26),
                              )),
                        ],
                      ),
                    ),
                    Divider(),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontSize: size.width * .08,
                            color: HexColor(COLOR_TITLE),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        this.desc!,
                        style: TextStyle(
                          fontSize: size.width * .048,
                          fontWeight: FontWeight.w300,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

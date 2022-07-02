import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/doctor/ListDoctors.dart';
import 'package:projet_flutter/screens/notification/MedicationScreen.dart';

import '../../CONSTANTS/color.dart';

class DetailHospital extends StatelessWidget {
  late String? nom;
  late String? image;
  late String? desc;

  DetailHospital({
    required this.nom,
    required this.image,
    required this.desc,
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
                padding: EdgeInsets.only(
                    left: size.width * .05, right: size.width * .05),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * .1,
                      child: Stack(
                        children: [
                          Positioned(
                              top: (size.height * .13) / 3 - 20,
                              child: Text(
                                "ouvert de 08h:00 - 18h:00",
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
                              top: (size.height * .13) / 3 + 20,
                              child: Text(
                                'responsable ',
                                style: TextStyle(color: Colors.black26),
                              )),
                          Positioned(
                            top: (size.height * .13) / 3,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(left: size.width * .06),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "About",
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
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Card(
                            elevation: 5,
                            child: CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.phone,
                                    color: HexColor(COLOR_PRIMARY),
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Card(
                            elevation: 5,
                            child: CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.message_rounded,
                                    color: HexColor(COLOR_PRIMARY),
                                  )),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListDoctors())),
                          child: Container(
                            child: Chip(
                              labelPadding: EdgeInsets.only(
                                top: 2,
                                bottom: 2,
                              ),
                              backgroundColor: HexColor(COLOR_PRIMARY),
                              elevation: 5.0,
                              shadowColor: Colors.grey[60],
                              label: Text(
                                "Voir les medecins",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
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

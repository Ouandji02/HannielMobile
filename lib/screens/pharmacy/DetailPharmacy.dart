import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/function/launchCall.dart';
import 'package:projet_flutter/function/launchWhatsapp.dart';
import 'package:projet_flutter/screens/notification/MedicationScreen.dart';
import 'package:provider/provider.dart';

import '../../CONSTANTS/color.dart';
import '../../function/geolocalisation.dart';
import '../../provider/DataClass.dart';

class DetailPharmacy extends StatelessWidget {
  late String? nom;
  late String? image;
  late String? desc;
  late String? pharmacyUid;
  late String? lat;
  late String? long;
  late String? phone;
  late String? email;

  DetailPharmacy(
      {required this.email,
      required this.nom,
      required this.image,
      required this.desc,
      required this.pharmacyUid,
      required this.lat,
      required this.long,
      required this.phone,});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    final coordonate = Provider.of<DataClass>(context);
    print("skjjjjjjjjjjjjjjjjjj $pharmacyUid");
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
                                this.email!,
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
                        "A propos",
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
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Card(
                            elevation: 5,
                            child: CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: IconButton(
                                  onPressed: () => launchCall(this.phone!),
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
                                  onPressed: () => launchWhatsApp(this.email!),
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
                                  builder: (context) =>
                                      MedicationScreen(id: this.pharmacyUid!))),
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
                                "Voir les medicaments",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * .04),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: AlignmentDirectional.centerStart,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          geolocalisation(this.lat, this.long, coordonate.lat,
                              coordonate.long);
                        },
                        label: Text(
                          'Voir la carte ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                HexColor(COLOR_PRIMARY)),
                            minimumSize:
                                MaterialStateProperty.all(Size(size.width, 50)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        icon: Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                      ),
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

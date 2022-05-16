import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/MedicationScreen.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/BottomNavigation.dart';
import 'package:projet_flutter/widgets/CampaignWidget.dart';
import 'package:projet_flutter/widgets/SicknessWidget.dart';

import '../CONSTANTS/color.dart';
import '../widgets/DoctorWidget.dart';
import '../widgets/PharmacyWidget.dart';

class Accueil extends StatefulWidget {
  @override
  _Accueil createState() => _Accueil();
}

class _Accueil extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarPrincipal('thierry', context),
      drawer: DrawerLayout('thierry', context),
      body: Container(
        constraints:
        BoxConstraints(minHeight: size.height, minWidth: size.width),
        color: HexColor(PRIMARY_COLOR).withOpacity(.93),
        child: Column(
          children: [
            Container(
              width: size.width * .9,
              margin: EdgeInsets.only(top: 25),
              child: TextField(
                style: TextStyle(
                  fontSize: 12.0,
                  height: .002,
                ),
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  fillColor: Colors.white.withOpacity(.1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  labelText: 'Search doctor or medication',
                ),
              ),
            ),
            Container(
                width: size.width * .9,
                margin: EdgeInsets.only(top: 20, bottom: 5),
                child: Stack(
                  children: [
                    Positioned(
                      child: Text(
                        'Medecinal Campaign',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 5,
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    )
                  ],
                )),
            Container(
              height: size.height * .20,
              width: size.width * .9,
              child: ListView.builder(
                itemBuilder: (context, snapshot) {
                  return CampaignWidget(context);
                },
                scrollDirection: Axis.horizontal,
                itemCount: 6,
              ),
            ),
            Container(
              width: size.width * .9,
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Stack(
                children: [
                  Positioned(
                    child: Text(
                      'Medecinal Campaign',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 5,
                    child: Text(
                      'See all',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * .045,
              width: size.width * .9,
              margin: EdgeInsets.only(top: 10,bottom: 20),
              child: ListView.builder(
                itemBuilder: (context, snapshot) {
                  return Card(
                    color: HexColor(PRIMARY_COLOR),
                    margin: EdgeInsets.only(right: 10),
                    shadowColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        )),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      constraints: BoxConstraints(minWidth: 80),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 16,
                              )),
                          Text('Fievre',style: TextStyle(
                              color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 6,
              ),
            ),
            Container(
              height: size.height * .332,
              width: size.width * .9,
              child: ListView.builder(
                itemBuilder: (context, snapshot) {
                  return DoctorWidget(context);
                },
                scrollDirection: Axis.vertical,
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(1),
    );
  }
}

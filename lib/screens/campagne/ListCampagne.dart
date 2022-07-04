import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/API_SERVICES/hospitalApi.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/classes/CampaignClass.dart';
import 'package:projet_flutter/classes/PharmacyModel.dart';
import 'package:projet_flutter/function/Search.dart';
import 'package:projet_flutter/screens/campagne/DetailCampagne.dart';
import 'package:projet_flutter/screens/pharmacy/ListPharmacy.dart';
import 'package:projet_flutter/widgets/AppBar.dart';

import '../../API_SERVICES/pharmacyApi.dart';
import '../../classes/CampaignClass.dart';
import 'Campagne.dart';

class Campagne extends StatefulWidget {
  @override
  _Campagne createState() {
    // TODO: implement createState
    return _Campagne();
  }
}

class _Campagne extends State<Campagne> {
  String? search;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarItem("Campagne"),
      body: Container(
        color: Colors.white,
        constraints: BoxConstraints(
          minHeight: size.height,
        ),
        padding: EdgeInsets.only(top: 10, left: 10),
        child: Column(
          children: [
            Container(
              width: size.width * .9,
              margin: EdgeInsets.only(top: 25),
              child: TextField(
                  style: TextStyle(
                      fontSize: 16.0, height: .2, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    fillColor: Colors.black.withOpacity(.1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    labelText: 'Search campagne',
                  ),
                  onChanged: (text) => {
                    if (text != null)
                      {
                        setState(() => search = text),
                      }
                  }),
            ),
            Expanded(
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
                            "Consultation des yeux",
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
                            "Hopital de District",
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
                                          DetailCampagne(nom: "Consultation des yeux", image: "", desc: "azertyytrezazerttrezazertreza", date_deb: "27 juin 2022", date_fin: "27 juillet 2022", resp: "Doctor SIMO"))),
                              child: Row(
                                children: [
                                  Text(
                                    "Details",
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
            )
          ],
        ),
      ),
    );
  }
}

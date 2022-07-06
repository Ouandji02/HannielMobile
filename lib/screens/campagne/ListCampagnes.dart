import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/classes/CampaignClass.dart';
import 'package:projet_flutter/screens/campagne/DetailCampagne.dart';
import 'package:projet_flutter/screens/doctor/DetailDoctor.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/Drawer.dart';
import '../../CONSTANTS/color.dart';
import '../../classes/DoctorClass.dart';
import '../Home.dart';

class ListCampagnes extends StatelessWidget {
  @override
  final campagne = [
    CampaignModel(
      nom: "Campagne de consultation \n gratuite contre la rougeole",
      image: "",
      description: "azertyuiopazertyuiopazertyuiopazertyuiopazertyuiop",
      date_deb: "27 Juin 2022",
      date_fin: "27 Juillet 2022",
      hospitalId: "1",
      hour: "15H - 16H",
      id: "1",
      responsabe: "Docteur SIMO",),
    CampaignModel(
      nom: "Consultation des yeux",
      image: "",
      description: "azertyuiopazertyuiopazertyuiopazertyuiopazertyuiop",
      date_deb: "27 Juin 2022",
      date_fin: "27 Juillet 2022",
      hospitalId: "1",
      hour: "15H - 16H",
      id: "1",
      responsabe: "Docteur SIMO",),
    CampaignModel(
      nom: "Consultation des yeux",
      image: "",
      description: "azertyuiopazertyuiopazertyuiopazertyuiopazertyuiop",
      date_deb: "27 Juin 2022",
      date_fin: "27 Juillet 2022",
      hospitalId: "1",
      hour: "15H - 16H",
      id: "1",
      responsabe: "Docteur SIMO",),
    CampaignModel(
      nom: "Consultation des yeux",
      image: "",
      description: "azertyuiopazertyuiopazertyuiopazertyuiopazertyuiop",
      date_deb: "27 Juin 2022",
      date_fin: "27 Juillet 2022",
      hospitalId: "1",
      hour: "15H - 16H",
      id: "1",
      responsabe: "Docteur SIMO",),];
  Widget build(BuildContext context) {
    // TODO: implement build
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarItem("Campagnes"),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Expanded(
                child: Container(
                    height: 170,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: campagne.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Card(
                              elevation: 5,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      foregroundImage:
                                      AssetImage(campagne[index].image),
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      campagne[index].nom,
                                      style: TextStyle(
                                          color: HexColor(COLOR_TITLE),
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      campagne[index].description,
                                      style: TextStyle(
                                          color: HexColor(COLOR_SUBTITLE_MESSAGE)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      campagne[index].responsabe,
                                      style: TextStyle(
                                          color: HexColor(COLOR_SUBTITLE_MESSAGE)),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      },
                    ))
            )
          ],
        ),
      ),
    );
  }
}

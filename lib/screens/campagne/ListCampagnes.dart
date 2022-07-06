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
      image: "assets/images/undraw_doctors_hwty.png",
      description: "azertyuiopazertyuiopazertyuiopazertyuiopazertyuiop",
      date_deb: "27 Juin 2022",
      date_fin: "27 Juillet 2022",
      hospitalId: "1",
      hour: "15H - 16H",
      id: "1",
      responsabe: "Docteur SIMO",),
    CampaignModel(
      nom: "Consultation des yeux",
      image: "assets/images/undraw_doctors_hwty.png",
      description: "azertyuiopazertyuiopazertyuiopazertyuiopazertyuiop",
      date_deb: "27 Juin 2022",
      date_fin: "27 Juillet 2022",
      hospitalId: "1",
      hour: "15H - 16H",
      id: "1",
      responsabe: "Docteur SIMO",),
    CampaignModel(
      nom: "Consultation des yeux",
      image: "assets/images/undraw_doctors_hwty.png",
      description: "azertyuiopazertyuiopazertyuiopazertyuiopazertyuiop",
      date_deb: "27 Juin 2022",
      date_fin: "27 Juillet 2022",
      hospitalId: "1",
      hour: "15H - 16H",
      id: "1",
      responsabe: "Docteur SIMO",),
    CampaignModel(
      nom: "Consultation des yeux",
      image: "assets/images/undraw_doctors_hwty.png",
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
    Size size = MediaQuery.of(context).size;
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
                        return Container(
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.only(
                              top: size.height * .025, left: size.width * .025),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12.withOpacity(.1),
                                  blurRadius: 5,
                                  offset: Offset(0, -1),
                                  spreadRadius: 1)
                            ],
                          ),
                          height: size.height * .2,
                          width: size.width * .7,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Text(
                                  campagne[index].nom,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                top: size.height * .01,
                              ),Positioned(
                                child: ImageIcon(AssetImage(campagne[index].image),size: 90,),
                                top: 50,
                                left: 150,
                              ),
                              Positioned(
                                  child: TextButton.icon(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(
                                            HexColor(COLOR_MESSAGE_WHITE)),
                                        side: MaterialStateProperty.all(
                                            BorderSide(color: Colors.white))
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailCampagne(
                                              nom: campagne[index].nom,
                                              image: campagne[index].image,
                                              desc: campagne[index].description,
                                              date_fin: campagne[index].date_fin,
                                              date_deb: campagne[index].date_deb,
                                              resp: campagne[index].responsabe,
                                            ),
                                          )
                                      );
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      "En savoir plus",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),top: 100),
                            ],
                          ),
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

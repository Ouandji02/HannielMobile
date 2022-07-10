import 'dart:js';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/classes/DoctorClass.dart';
import 'package:projet_flutter/provider/DataClass.dart';
import 'package:provider/provider.dart';

import '../../CONSTANTS/color.dart';
import '../doctor/DetailDoctor.dart';

class Dashboard1 extends StatefulWidget {
  @override
  _Dashboard createState() {
    // TODO: implement createState
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard1> {
  final doctors = [
    Doctor(
        nom: "simo",
        prenom: "Larissa",
        photo: "assets/images/doctor.png",
        dateNaissance: "dateNaissance",
        email: "simo@gmail.com",
        tel: "699665914",
        poids: 60,
        grpe_sanguin: "A+",
        taille: 160,
        description:
            "Docteur simo est une terapeute avec 5 ans d'experience.Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum sunt maxime blanditiis possimus tenetur, voluptate tempora ad iusto assumenda laudantium.",
        grade: "A",
        experience: 5,
        specialite: "dentiste"),
    Doctor(
        nom: "simo1",
        prenom: "Larissa",
        photo: "assets/images/doctor.png",
        dateNaissance: "dateNaissance",
        email: "simo@gmail.com",
        tel: "699665914",
        poids: 60,
        grpe_sanguin: "A+",
        taille: 160,
        description:
            "Docteur simo est une terapeute avec 5 ans d'experience.Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum sunt maxime blanditiis possimus tenetur, voluptate tempora ad iusto assumenda laudantium.",
        grade: "A",
        experience: 5,
        specialite: "specialite"),
    Doctor(
        nom: "simo2",
        prenom: "Larissa",
        photo: "assets/images/doctor.png",
        dateNaissance: "dateNaissance",
        email: "simo@gmail.com",
        tel: "699665914",
        poids: 60,
        grpe_sanguin: "A+",
        taille: 160,
        description:
            "Docteur simo est une terapeute avec 5 ans d'experience.Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum sunt maxime blanditiis possimus tenetur, voluptate tempora ad iusto assumenda laudantium.",
        grade: "A",
        experience: 5,
        specialite: "specialite"),
    Doctor(
        nom: "simo3",
        prenom: "Larissa",
        photo: "assets/images/doctor.png",
        dateNaissance: "dateNaissance",
        email: "simo@gmail.com",
        tel: "699665914",
        poids: 60,
        grpe_sanguin: "A+",
        taille: 160,
        description: "description",
        grade: "A",
        experience: 5,
        specialite: "specialite"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screen = MediaQuery.of(context).size;
    final user = Provider.of<DataClass>(context);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(20),
        height: screen.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(image: AssetImage("assets/images/hello.png")),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "salut ${user.user?.nom ?? ""}",
                      style:
                          TextStyle(color: HexColor(COLOR_TITLE), fontSize: 15),
                    ),
                    Text(
                      "Comment tu vas aujourd'hui?",
                      style: TextStyle(
                          color: HexColor(COLOR_SUBTITLE_MESSAGE),
                          fontSize: 15),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Prochain rendez vous",
                style: TextStyle(
                    color: HexColor(COLOR_TITLE),
                    fontWeight: FontWeight.w400,
                    fontSize: 22)),
            SizedBox(
              height: 20,
            ),
            Card(
                elevation: 1,
                color: HexColor(COLOR_PRIMARY),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Demain",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("20 Mai 2021, 10:00",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          ),
                          CircleAvatar(
                            child: Icon(
                              Icons.map,
                              color: HexColor(COLOR_PRIMARY),
                            ),
                            backgroundColor: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.white),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            foregroundImage:
                                AssetImage("assets/images/doctor.png"),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Larissa babes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("Hopital district, dentiste",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Text("Doctors",
                style: TextStyle(
                    color: HexColor(COLOR_TITLE),
                    fontWeight: FontWeight.w400,
                    fontSize: 22)),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDoctor(
                                    prenom: doctors[index].prenom,
                                    desc: doctors[index].description,
                                    nom: doctors[index].nom,
                                    image: doctors[index].photo,
                                    specialite: doctors[index].specialite,
                                  ))),
                      child: Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  foregroundImage:
                                      AssetImage(doctors[index].photo),
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  doctors[index].nom + doctors[index].prenom,
                                  style: TextStyle(
                                      color: HexColor(COLOR_TITLE),
                                      fontSize: screen.width / 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  doctors[index].prenom,
                                  style: TextStyle(
                                      color: HexColor(COLOR_SUBTITLE_MESSAGE)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  doctors[index].specialite,
                                  style: TextStyle(
                                      color: HexColor(COLOR_SUBTITLE_MESSAGE)),
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

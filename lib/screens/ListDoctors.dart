import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/screens/DetailDoctor.dart';
import 'package:projet_flutter/widgets/AppBar.dart';

import '../CONSTANTS/color.dart';
import '../classes/DoctorClass.dart';
import 'Home.dart';

class ListDoctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final doctors = [
      Doctor(
          nom: "simo",
          prenom: "Larissa",
          photo: "assets/images/firstDoctor.png",
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
          photo: "assets/images/firstDoctor.png",
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
      Doctor(
          nom: "simo4",
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
    return Scaffold(
      appBar: AppBarItem("Doctor"),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.centerStart,
              child: Text("Choisir un docteur",
                  style: TextStyle(
                      color: HexColor(COLOR_TITLE),
                      fontSize: 21,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
                margin: EdgeInsets.only(top: heigth * .04),
                alignment: AlignmentDirectional.centerStart,
                height: heigth * .05,
                child: ListView.builder(
                  itemBuilder: (context, snapshot) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Chip(
                        labelPadding: EdgeInsets.all(2.0),
                        deleteIcon: Icon(Icons.error),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.white70,
                          child: Text('F'.toUpperCase()),
                        ),
                        label: Text(
                          "FEMALE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: heigth * .02),
                        ),
                        backgroundColor: Colors.blue,
                        elevation: 1.0,
                        shadowColor: Colors.grey[60],
                        padding: EdgeInsets.all(8.0),
                      ),
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                )),
            Container(
              margin: EdgeInsets.only(top: heigth * .03),
              height: heigth * .70,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: heigth * .02),
                        child: ListTile(
                          title: Text(doctors[index].nom,
                              style: TextStyle(
                                color: HexColor(COLOR_TITLE),
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Container(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                Text('docteur familiale' +
                                    doctors[index].specialite),
                                Text(
                                  'Commence a partir 5000frs',
                                  style: TextStyle(
                                    color: HexColor(COLOR_TITLE),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          trailing: Container(
                            margin: EdgeInsets.only(right: 30),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: HexColor(COLOR_PRIMARY),
                                ),
                                Text(
                                  "4.5",
                                  style:
                                      TextStyle(color: HexColor(COLOR_PRIMARY)),
                                )
                              ],
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(doctors[index].photo),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailDoctor(
                                        desc: doctors[index].description,
                                        nom: doctors[index].nom,
                                        image: doctors[index].photo,
                                        specialite: doctors[index].specialite,
                                        prenom: doctors[index].prenom,
                                      ))),
                        ),
                      ),
                      Divider(
                        color: HexColor(COLOR_SUBTITLE),
                      )
                    ],
                  );
                },
                itemCount: doctors.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

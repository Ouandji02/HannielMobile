import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/screens/doctor/DetailDoctor.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/Drawer.dart';
import '../../CONSTANTS/color.dart';
import '../../classes/DoctorClass.dart';
import '../Home.dart';

class ListDoctors extends StatelessWidget {
  @override
  final doctors = [];
  Widget build(BuildContext context) {
    // TODO: implement build
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarItem("Doctor"),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              height: heigth * .1,
                margin: EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                  itemBuilder: (context, snapshot) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Chip(
                        labelPadding: EdgeInsets.all(2.0),
                        deleteIcon: Icon(Icons.error),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.white70,
                        ),
                        label: Text(
                          "FEMALE",
                          style: TextStyle(
                              color: HexColor(COLOR_PRIMARY),
                              fontWeight: FontWeight.bold,
                              fontSize: heigth * .02),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 1.0,
                        padding: EdgeInsets.all(8.0),
                      ),
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                )),
            Expanded(
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

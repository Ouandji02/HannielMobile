import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/screens/DetailDoctor.dart';
import 'package:projet_flutter/widgets/AppBar.dart';

import '../CONSTANTS/color.dart';
import 'Home.dart';

class ListDoctors extends StatelessWidget {
  @override
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
              height: heigth * .75,
              child: ListView.builder(itemBuilder: (context, snapshot) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: heigth * .02),
                      child: ListTile(
                        title: Text("Simo Larissa",
                            style: TextStyle(
                              color: HexColor(COLOR_TITLE),
                              fontWeight: FontWeight.bold,
                            )),
                        subtitle: Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: Column(
                            children: [
                              Text('docteur familiale therapeutre'),
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
                          backgroundImage:
                              AssetImage("assets/images/firstDoctor.png"),
                        ),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailDoctor())),
                      ),
                    ),
                    Divider(
                      color: HexColor(COLOR_SUBTITLE),
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/DetailDoctor.dart';
import 'package:projet_flutter/screens/Messaging.dart';
import 'package:projet_flutter/widgets/CustomBottomNavigation.dart';
import 'package:projet_flutter/widgets/Drawer.dart';

import 'Notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "MediApp",
            style: TextStyle(color: HexColor(COLOR_PRIMARY)),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()));
              },
              child: Icon(
                Icons.notifications_none_outlined,
                color: HexColor(COLOR_PRIMARY),
              ),
            )
          ],
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.reorder_outlined,
                color: HexColor(COLOR_PRIMARY),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )),
      drawer: DrawerLayout("user", context),
      bottomNavigationBar: CustomBottomNavigation(context),
      body: SingleChildScrollView(
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
                        "Bonjour Larissa,",
                        style: TextStyle(
                            color: HexColor(COLOR_TITLE), fontSize: 15),
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
                    itemCount: 100,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailDoctor())),
                        child: Card(
                            elevation: 5,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    foregroundImage:
                                        AssetImage("assets/images/doctor.png"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Larissa Babes",
                                    style: TextStyle(
                                        color: HexColor(COLOR_TITLE),
                                        fontSize: screen.width / 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Hopital de District",
                                    style: TextStyle(
                                        color:
                                            HexColor(COLOR_SUBTITLE_MESSAGE)),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Dentiste",
                                    style: TextStyle(
                                        color:
                                            HexColor(COLOR_SUBTITLE_MESSAGE)),
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
      ),
    );
  }
}

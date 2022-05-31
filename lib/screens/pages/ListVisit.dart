import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/Profil.dart';

import '../../CONSTANTS/color.dart';
import '../../widgets/Drawer.dart';
import '../Notifications.dart';

class ListVisit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              child: ListTile(
                trailing: CircleAvatar(
                  child: IconButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profil())),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Text(
                  "Simo larissa\n237699665914",
                  style: TextStyle(color: HexColor(COLOR_TITLE)),
                ),
                subtitle: Text("simolarissa@gmail.com"),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/firstDoctor.png"),
                ),
              ),
            ),
            Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: size.width * .02,
                        bottom: size.width * .02,
                        left: size.width * .06,
                        right: size.width * .06),
                    child: Text(
                      "Visit",
                      style: TextStyle(color: HexColor(COLOR_PRIMARY)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: size.width * .02,
                        bottom: size.width * .02,
                        left: size.width * .06,
                        right: size.width * .06),
                    child: Text(
                      "Examination",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: size.width * .02,
                        bottom: size.width * .02,
                        left: size.width * .06,
                        right: size.width * .06),
                    child: Text(
                      "Test",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: size.width * .02,
                        bottom: size.width * .02,
                        left: size.width * .06,
                        right: size.width * .06),
                    child: Text(
                      "Prescription",
                      style: TextStyle(color: Colors.black38),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(
                      top: size.height * .025, left: size.width * .1),
                  decoration: BoxDecoration(color: HexColor(COLOR_CARD)),
                  height: size.height * .25,
                  child: Stack(
                    children: [
                      Positioned(
                          child: Icon(
                        Icons.medical_services_outlined,
                        size: size.height * .1,
                      )),
                      Positioned(
                        child: Text(
                          "Physical\nExamination",
                          style: TextStyle(
                              color: HexColor(COLOR_TITLE),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        left: size.width * .25,
                        top: size.height * .015,
                      ),
                      Positioned(
                        child: Text(
                          "14/02/2019",
                          style: TextStyle(color: HexColor(COLOR_TITLE)),
                        ),
                        left: size.width * .25,
                        top: size.height * .075,
                      ),
                      Positioned(
                          child: InkWell(
                            child: Row(
                              children: [
                                Text(
                                  "See  reports",
                                  style: TextStyle(
                                      color: HexColor(COLOR_PRIMARY),
                                      fontSize: 16),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: HexColor(COLOR_PRIMARY),
                                ),
                              ],
                            ),
                          ),
                          left: size.width * .25,
                          bottom: size.height * .05)
                    ],
                  ),
                );
              },
              itemCount: 4,
            ))
          ],
        ),
      ),
    );
  }
}

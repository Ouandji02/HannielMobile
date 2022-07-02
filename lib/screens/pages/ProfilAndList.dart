import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/profil/Profil.dart';
import 'package:projet_flutter/screens/pages/ListExamination.dart';
import 'package:projet_flutter/screens/pages/ListPresscription.dart';
import 'package:projet_flutter/screens/pages/ListText.dart';
import 'package:projet_flutter/screens/pages/ListVisit.dart';
import 'package:projet_flutter/widgets/CardPatient.dart';

import '../../CONSTANTS/color.dart';
import '../../widgets/Drawer.dart';
import '../notification/Notifications.dart';

class ProfilAndList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    trailing: CircleAvatar(
                      backgroundColor: HexColor(COLOR_PRIMARY),
                      child: IconButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ProfilUser())),
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
                      backgroundImage:
                          AssetImage("assets/images/firstDoctor.png"),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  child: TabBar(
                      labelColor: HexColor(COLOR_PRIMARY),
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: "visit",
                        ),
                        Tab(
                          text: "Examination",
                        ),
                        Tab(
                          text: "Test",
                        ),
                        Tab(
                          text: "Prescription",
                        ),
                      ]),
                ),
                Divider(),
                Expanded(
                    child: TabBarView(children: [
                  ListVisit(),
                  ListExamination(),
                  ListText(),
                  ListPrescription()
                ]))
              ],
            ),
          ),
        ));
  }
}

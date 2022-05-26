import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _Notifications createState() {
    return _Notifications();
  }
}

class _Notifications extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: HexColor(COLOR_PRIMARY),
              size: 30,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Notifications",
            style: TextStyle(color: HexColor(COLOR_TITLE)),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: screen.height,
          padding: EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemCount: 16,
              itemBuilder: (context, i) {
                return Column(children: [
                  ListTile(
                    leading: Image(
                      image: i % 2 == 0
                          ? AssetImage("assets/images/loud-speak.png")
                          : AssetImage("assets/images/planning.png"),
                    ),
                    title: Text(
                      i % 2 == 0
                          ? "Rendez vous proche"
                          : "Rendez-vous Confirmé",
                      style:
                          TextStyle(color: HexColor(COLOR_TITLE), fontSize: 15),
                    ),
                    subtitle: Text(
                        i % 2 == 0
                            ? "N'oubliez pas votre prochain rendez vous avec docteur Larissa"
                            : "Docteur Larissa a confirmé votre rendez-vous",
                        style: TextStyle(
                            color: HexColor(
                              COLOR_TITLE,
                            ),
                            fontSize: 12)),
                    trailing: Text(
                      "2h",
                      style: TextStyle(color: HexColor(COLOR_SUBTITLE)),
                    ),
                  ),
                  Divider(
                    color: HexColor(COLOR_SUBTITLE),
                  )
                ]);
              }),
        ));
  }
}

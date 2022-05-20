import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';
import 'Notifications.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key? key}) : super(key: key);

  @override
  _Messaging createState() {
    return _Messaging();
  }
}

class _Messaging extends State<Messaging> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () {},
          child: Icon(
            Icons.dehaze,
            color: HexColor(COLOR_PRIMARY),
            size: screen.width / 12,
          ),
        ),
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
      ),
      body: Container(
        height: screen.height,
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: screen.width / 18),
              width: screen.width / 1.1,
              height: 50,
              alignment: Alignment.center,
              child: TextField(
                cursorColor: HexColor(COLOR_PRIMARY),
                cursorHeight: 30,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("f5f5f5"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: "Rechercher Message",
                    hintStyle: TextStyle(color: HexColor("bcbcbc")),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: HexColor(COLOR_SUBTITLE),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: screen.height - 170,
              padding: EdgeInsets.only(top: 20),
              child: ListView.builder(
                  itemCount: 16,
                  itemBuilder: (context, i) {
                    return Column(children: [
                      ListTile(
                          leading: CircleAvatar(
                            foregroundImage:
                                AssetImage("assets/images/doctor.png"),
                          ),
                          title: Text(
                            i % 2 == 0 ? "Larissa babes" : "Manick Bolando",
                            style: TextStyle(
                                color: HexColor("27355a"),
                                fontSize: screen.width / 22,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                              i % 2 == 0
                                  ? "Hey hey whats up b?"
                                  : "You : Babes my chair",
                              style: TextStyle(
                                  color: HexColor(
                                    COLOR_SUBTITLE_MESSAGE,
                                  ),
                                  fontSize: screen.width / 25)),
                          trailing: Column(
                            children: [
                              Text(
                                "12:03",
                                style:
                                    TextStyle(color: HexColor(COLOR_SECONDARY)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: HexColor(COLOR_PRIMARY),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                padding: EdgeInsets.all(3),
                                child: Text(
                                  "12",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              )
                            ],
                          )),
                    ]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

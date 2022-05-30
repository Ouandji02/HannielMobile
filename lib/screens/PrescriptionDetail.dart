import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';

class PrescriptionDetail extends StatefulWidget {
  const PrescriptionDetail({Key? key}) : super(key: key);

  @override
  _PrescriptionDetail createState() {
    return _PrescriptionDetail();
  }
}
class _PrescriptionDetail extends State<PrescriptionDetail> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery
        .of(context)
        .size;

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
            "Prescription Detail",
            style: TextStyle(color: HexColor(COLOR_TITLE)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                null;
              },
              child: Icon(
                Icons.search,
                color: HexColor(COLOR_PRIMARY),
              ),
            )
          ],
        ),
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(itemBuilder: (context, snapshot){
                    return Card(
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: HexColor(COLOR_CARD),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        height: 170,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        padding: EdgeInsets.only(left: 30),
                       child: Stack(
                         children: [
                           Positioned(child: Icon(Icons.add_business, size: 50,), top: 20,),
                           Positioned(child: Text("Amoxicillin 500mg \nTablets", style: TextStyle(fontSize: 15, color: HexColor(COLOR_TITLE), fontWeight: FontWeight.bold),), top: 20, left: 70,),
                           Positioned(child: Text("Pain Reliver", style: TextStyle(fontSize: 12,  color: HexColor(COLOR_TITLE)),), top: 60, left: 70),
                           Positioned(child: Text("Days of Treat", style: TextStyle(color: HexColor(COLOR_SUBTITLE_MESSAGE), fontSize: 12, fontWeight: FontWeight.bold),), top: 110, left: 70),
                           Positioned(child: Text("7 Days", style: TextStyle(color: HexColor(COLOR_TITLE), fontSize: 12, fontWeight: FontWeight.bold),), top: 130, left: 70),
                           Positioned(child: Text("Pill per Day", style: TextStyle(color: HexColor(COLOR_SUBTITLE_MESSAGE), fontSize: 12, fontWeight: FontWeight.bold),), top: 110, left: 170),
                           Positioned(child: Text("1 Pill", style: TextStyle(color: HexColor(COLOR_TITLE), fontSize: 12, fontWeight: FontWeight.bold),), top: 130, left: 170),
                         ],
                       ),
                      ),
                    );
                  }, itemCount: 4)
              )
            ],
          )
      ),
        );
  }
}

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
                  margin: EdgeInsets.only(left: 30, right: 30),
                  height: screen.height * .75,
                  child: ListView.builder(itemBuilder: (context, snapshot){
                    return Card(
                      elevation: 0,
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        decoration: BoxDecoration(color: HexColor(COLOR_PRIMARY)),
                        height: 200,
                        child: Row(
                          children: [

                          ],
                        ),
                      ),
                    );
                  }, itemCount: 10)
              )
            ],
          ),
      ),
    );
    throw UnimplementedError();
  }
}
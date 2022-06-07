import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/classes/PharmacyModel.dart';
import 'package:projet_flutter/screens/pharmacy/ListPharmacy.dart';
import 'package:projet_flutter/widgets/AppBar.dart';

class Pharmacy extends StatefulWidget{
  @override
  _Pharmacy createState() {
    // TODO: implement createState
    return _Pharmacy();
  }

}

class _Pharmacy extends State<Pharmacy>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarItem("Pharmacy"),
      body: Container(
        constraints: BoxConstraints(
          minHeight: size.height,
        ),
        padding: EdgeInsets.only(top: 10,left: 10),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              alignment: AlignmentDirectional.centerStart,
              margin: EdgeInsets.only(bottom: 10),
              child: Text("Liste des pharmacies",style: TextStyle(
                color: HexColor(COLOR_TITLE),
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),),
            ),
            Expanded(child: ListView.builder(itemBuilder: (context,s){
              return pharmacyWidget(context);
            },itemCount: 6,))
          ],
        ),
      ),
    );
  }

}
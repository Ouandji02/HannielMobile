import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/classes/PharmacyModel.dart';
import 'package:projet_flutter/screens/pharmacy/ListPharmacy.dart';
import 'package:projet_flutter/widgets/AppBar.dart';

import '../../API_SERVICES/pharmacyApi.dart';

class Pharmacy extends StatefulWidget {
  @override
  _Pharmacy createState() {
    // TODO: implement createState
    return _Pharmacy();
  }
}

class _Pharmacy extends State<Pharmacy> {
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
        padding: EdgeInsets.only(top: 10, left: 10),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: PharmacyApi.getPharmacy(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<PharmacyModel>?> snapshot) {
                      if (snapshot.hasData) {
                        print(
                            "mbvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvb");
                        return ListView.builder(itemBuilder: (context,index){
                         return pharmacyWidget(context, snapshot.data,index);
                        },itemCount: snapshot.data?.length,);
                      } else {
                        print(snapshot.data);
                        return Center(
                          child: CircularProgressIndicator(
                            color: HexColor(COLOR_PRIMARY),
                          ),
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }
}

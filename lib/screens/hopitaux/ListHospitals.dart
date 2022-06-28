import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/classes/PharmacyModel.dart';
import 'package:projet_flutter/function/Search.dart';
import 'package:projet_flutter/screens/pharmacy/ListPharmacy.dart';
import 'package:projet_flutter/widgets/AppBar.dart';

import '../../API_SERVICES/pharmacyApi.dart';
import '../../classes/HospitalModel.dart';
import 'Hospital.dart';

class Hospital extends StatefulWidget {
  @override
  _Hospital createState() {
    // TODO: implement createState
    return _Hospital();
  }
}

class _Hospital extends State<Hospital> {
  late List<PharmacyModel> foundHospital;
  String? search;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarItem("Hospital"),
      body: Container(
        color: Colors.white,
        constraints: BoxConstraints(
          minHeight: size.height,
        ),
        padding: EdgeInsets.only(top: 10, left: 10),
        child: Column(
          children: [
            Container(
              width: size.width * .9,
              margin: EdgeInsets.only(top: 25),
              child: TextField(
                  style: TextStyle(
                      fontSize: 16.0, height: .2, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    fillColor: Colors.black.withOpacity(.1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    labelText: 'Search hospitals',
                  ),
                  onChanged: (text) => {
                        if (text != null) {setState(() => search = text)}
                      }),
            ),
            Expanded(
              child: FutureBuilder(
                future: PharmacyApi.getPharmacy(search),
                builder: (BuildContext context,
                    AsyncSnapshot<List<PharmacyModel>?> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return hospitalWidget(context, snapshot.data, index);
                      },
                      itemCount: snapshot.data?.length,
                    );
                  } else {
                    print(snapshot.data);
                    return Center(
                      child: CircularProgressIndicator(
                        color: HexColor(COLOR_PRIMARY),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

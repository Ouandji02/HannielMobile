import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/classes/PharmacyModel.dart';
import 'package:projet_flutter/screens/pharmacy/ListPharmacy.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/ErrorPage.dart';

import '../../API_SERVICES/pharmacyApi.dart';

class Pharmacy extends StatefulWidget {
  @override
  _Pharmacy createState() {
    // TODO: implement createState
    return _Pharmacy();
  }
}

class _Pharmacy extends State<Pharmacy> {
  String? search;
  List<PharmacyModel>? foundPharmacy;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarItem("Pharmacy"),
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
                    hintText: 'Rechercher une pharmacie',
                  ),
                  onChanged: (text) => {
                        if (text != null) {setState(() => search = text)}
                      }),
            ),
            Expanded(
              child: FutureBuilder(
                future: PharmacyApi.getPharmacy(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<PharmacyModel>?> snapshot) {
                  if (snapshot.hasError) {
                    return page404Error(context, Pharmacy());
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return search != null
                              ? (filter(snapshot.data, search)?.length == 0)
                                  ? Container(
                                      height: size.height * .6,
                                      child: Center(
                                        child: Text(
                                          "Aucun resultats",
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 20),
                                        ),
                                      ),
                                    )
                                  : pharmacyWidget(context,
                                      filter(snapshot.data, search), index)
                              : pharmacyWidget(context, snapshot.data, index);
                        },
                        itemCount: search != null
                            ? (filter(snapshot.data, search)?.length == 0
                                ? (filter(snapshot.data, search)?.length)! + 1
                                : filter(snapshot.data, search)?.length)
                            : snapshot.data!.length);
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

List<PharmacyModel>? filter(List<PharmacyModel>? snapshot, search) {
  return snapshot
      ?.where((element) => (element.nom)!.contains(search!.toLowerCase()))
      .toList();
}

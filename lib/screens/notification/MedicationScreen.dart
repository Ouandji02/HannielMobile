import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/ErrorPage.dart';

import '../../API_SERVICES/medicamentApi.dart';
import '../../CONSTANTS/color.dart';
import '../../classes/MedicationClass.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({Key? key}) : super(key: key);

  @override
  _Medication createState() {
    return _Medication();
  }
}

class _Medication extends State<MedicationScreen> {
  String? search;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarItem('Medicaments'),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                width: screen.width * .9,
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
                    labelText: 'Rechercher un medicament',
                  ),
                  onChanged: (text) {
                    setState(() => search = text);
                  },
                ),
              ),
              Container(
                height: screen.height * .1,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: EdgeInsets.all(10),
                          child: Chip(
                            backgroundColor: HexColor(COLOR_SECONDARY),
                            avatar: Image(
                              image: i % 2 == 0
                                  ? AssetImage(
                                      "assets/images/icons8-syrup-28.png")
                                  : AssetImage(
                                      "assets/images/icons8-pills-28.png"),
                            ),
                            label: Text(
                              "Sirop",
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                    }),
              ),
              Expanded(
                child: FutureBuilder(
                  future: MedicamentApi.getMedication(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<MedicationModel>?> snapshot) {
                    print("khhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${snapshot.hasError}");
                    if (snapshot.hasError) {
                      return page404Error(context, MedicationScreen());
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, i) {
                            return MedicationWidget(snapshot.data, i);
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                            color: HexColor(COLOR_PRIMARY)),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<MedicationModel>? filter(List<MedicationModel>? snapshot, search) {
  return snapshot
      ?.where((element) => (element.nom)!.contains(search!.toLowerCase()))
      .toList();
}

Widget MedicationWidget(snapshot, i) {
  return Container(
    margin: EdgeInsets.only(right: 10, left: 10),
    child: Card(
      color: HexColor(COLOR_CARD),
      elevation: 0,
      child: ListTile(
        leading: i % 2 == 0
            ? Image(image: AssetImage("assets/images/icons8-syrup-28.png"))
            : Image(image: AssetImage("assets/images/icons8-pills-28.png")),
        contentPadding: EdgeInsets.all(10),
        title: Text(
          snapshot[i].nom,
          overflow: TextOverflow.fade,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Phamarciee ${snapshot[i].pharmacyUid}",
              style: TextStyle(color: Colors.white.withOpacity(.6)),
            ),
            Text(
              "3km environ",
              style:
                  TextStyle(color: Colors.white.withOpacity(.6), fontSize: 12),
            )
          ],
        ),
        trailing: true
            ? CircularProgressIndicator(
                color: HexColor(COLOR_PRIMARY),
                strokeWidth: 1,
              )
            : InkWell(
                onTap: () {
                  null;
                },
                child: Icon(
                  Icons.arrow_right_rounded,
                  size: 30,
                  color: HexColor(COLOR_SECONDARY),
                ),
              ),
      ),
    ),
  );
}

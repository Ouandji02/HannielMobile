import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/provider/MedicamentProvider.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/ErrorPage.dart';
import 'package:provider/provider.dart';
import '../../API_SERVICES/medicamentApi.dart';
import '../../CONSTANTS/color.dart';
import '../../classes/MedicationClass.dart';

class MedicationScreen extends StatefulWidget {
  String id;

  MedicationScreen({required this.id});

  @override
  _Medication createState() {
    return _Medication(id: id);
  }
}

class _Medication extends State<MedicationScreen> {
  String id;

  _Medication({required this.id});

  String? search;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    final medication = Provider.of<MedicamentProvider>(context);
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
              Expanded(
                  child: FutureBuilder(
                future: MedicamentApi.getMedicationById(id),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.length == 0) {
                      return Center(
                        child: Text("Pharmacie Vide"),
                      );
                    }
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return search != null
                              ? (filter(snapshot.data, search)?.length == 0)
                              ? Container(
                            height: screen.height * .6,
                            child: const Center(
                              child: Text(
                                "Aucun resultat",
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 20),
                              ),
                            ),
                          )
                              : MedicationWidget(
                              filter(snapshot.data, search), index)
                              : MedicationWidget(snapshot.data, index);
                        },
                        itemCount: search != null
                            ? (filter(snapshot.data, search)?.length == 0
                            ? (filter(snapshot.data, search)?.length)! + 1
                            : filter(snapshot.data, search)?.length)
                            : snapshot.data!.length);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: HexColor(COLOR_PRIMARY),
                      ),
                    );
                  }
                },
              )),
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
              "dose ${snapshot[i].dose}",
              style: TextStyle(color: Colors.white.withOpacity(.6)),
            ),
            Text(
              "prix: ${snapshot[i].prix}",
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

List<MedicationModel?>? filterWithId(List<MedicationModel?>? snapshot, id) {
  return snapshot
      ?.where((element) => (element?.pharmacyUid)!.contains(id!.toLowerCase()))
      .toList();
}

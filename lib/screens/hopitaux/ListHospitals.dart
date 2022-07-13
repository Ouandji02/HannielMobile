import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/API_SERVICES/hospitalApi.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/classes/PharmacyModel.dart';
import 'package:projet_flutter/provider/HospitalProvider.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/ErrorPage.dart';
import 'package:provider/provider.dart';
import '../../classes/HospitalModel.dart';
import '../../provider/DataClass.dart';
import '../../provider/DoctorProvider.dart';
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
    final doctorModel = Provider.of<DoctorProvider>(context, listen: false);
    doctorModel.getDoctor();
    final coordonate = Provider.of<DataClass>(context);
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
              margin: EdgeInsets.only(top: 25,bottom: 25),
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
                    hintText: 'Rechercher un hopital',
                  ),
                  onChanged: (text) => {
                        if (text != null)
                          {
                            setState(() => search = text),
                          }
                      }),
            ),
            Expanded(
              child: FutureBuilder(
                future: HospitalApi.getHospital(coordonate.lat!,coordonate.long!),
                builder: (BuildContext context,
                    AsyncSnapshot<List<HospitalModel>?> snapshot) {

                  if (snapshot.hasError) {
                    return page404Error(context, Hospital());
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          snapshot.data!.sort((a,b)=> (a.distance!).compareTo(b.distance!));
                          return search != null
                              ? (filter(snapshot.data, search)?.length == 0)
                                  ? Container(
                                      height: size.height * .6,
                                      child: const Center(
                                        child: Text(
                                          "Aucun resultat",
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 20),
                                        ),
                                      ),
                                    )
                                  : hospitalWidget(context,
                                      filter(snapshot.data, search), index)
                              : hospitalWidget(context, snapshot.data, index);
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<HospitalModel>? filter(List<HospitalModel>? snapshot, search) {
  return snapshot
      ?.where((element) => (element.nom)!.contains(search!.toLowerCase()))
      .toList();
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/classes/DoctorClass.dart';
import 'package:projet_flutter/provider/DataClass.dart';
import 'package:projet_flutter/screens/Home.dart';
import 'package:projet_flutter/screens/pharmacy/DetailPharmacy.dart';
import 'package:projet_flutter/screens/pharmacy/pharmacyHome.dart';
import 'package:provider/provider.dart';

import '../../API_SERVICES/DoctorApi.dart';
import '../../API_SERVICES/pharmacyApi.dart';
import '../../CONSTANTS/color.dart';
import '../../classes/PharmacyModel.dart';
import '../../function/getCoordonates.dart';
import '../../widgets/ErrorPage.dart';
import '../doctor/DetailDoctor.dart';
import '../pharmacy/ListPharmacy.dart';
import '../pharmacy/Pharmacy.dart';

class Dashboard1 extends StatefulWidget {
  @override
  _Dashboard createState() {
    // TODO: implement createState
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screen = MediaQuery.of(context).size;
    final coordonate = Provider.of<DataClass>(context);
    final user = Provider.of<DataClass>(context);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(maxHeight: screen.height),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(image: AssetImage("assets/images/hello.png")),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Salut ${user.user?.nom ?? ""}",
                      style:
                          TextStyle(color: HexColor(COLOR_TITLE), fontSize: 15),
                    ),
                    Text(
                      "Comment tu vas aujourd'hui?",
                      style: TextStyle(
                          color: HexColor(COLOR_SUBTITLE_MESSAGE),
                          fontSize: 15),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Pharmacies",
                style: TextStyle(
                    color: HexColor(COLOR_TITLE),
                    fontWeight: FontWeight.w400,
                    fontSize: 22)),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              builder:
                  (context, AsyncSnapshot<Map<String, double?>?> snapshot1) {
                print('snapshot.data ${snapshot1.data!["latitude"]}');
                if (snapshot1.hasError) {
                  return errorNoHasData(context, Home());
                }
                if (snapshot1.hasData) {
                  return Container(
                    height: 265,
                    child: FutureBuilder(
                      future: PharmacyApi.getPharmacy(
                          snapshot1.data!["latitude"],
                          snapshot1.data!["longitude"]),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<PharmacyModel>?> snapshot) {
                        if (snapshot.hasError) {
                          return page404Error(context, Home());
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                snapshot.data!.sort((a, b) =>
                                    (a.distance!).compareTo(b.distance!));
                                return pharmacyHome(
                                    context, snapshot.data, index);
                              },
                              itemCount: snapshot.data!.length);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: HexColor(COLOR_PRIMARY),
                            ),
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              future: getCoordonate(),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Docteurs",
                style: TextStyle(
                    color: HexColor(COLOR_TITLE),
                    fontWeight: FontWeight.w400,
                    fontSize: 22)),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: DoctorApi.getDoctor(),
                builder: (context, AsyncSnapshot<List<Doctor>?> snapshot) {
                  if (snapshot.hasError) {
                    return page404Error(context, Home());
                  }
                  if (snapshot.hasData) {
                    return Container(
                        height: 170,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailDoctor(
                                            desc: snapshot
                                                .data![index].description,
                                            nom: snapshot.data![index].nom,
                                            image: snapshot.data![index].photo,
                                            dateDeb:
                                                snapshot.data![index].dateBegin,
                                            phone: snapshot.data![index].tel,
                                            specialite:
                                                snapshot.data![index].grade,
                                            email: snapshot.data![index].email,
                                          ))),
                              child: Card(
                                  elevation: 3,
                                  child: Container(
                                    width: 150,
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          foregroundImage: NetworkImage(
                                              snapshot.data![index].photo),
                                          radius: 30,
                                          backgroundColor: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            snapshot.data![index].nom
                                                .toString(),
                                            style: TextStyle(
                                                color: HexColor(COLOR_TITLE),
                                                fontSize: screen.width / 23),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            snapshot.data![index].grade
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: screen.width / 23),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: HexColor(COLOR_PRIMARY),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

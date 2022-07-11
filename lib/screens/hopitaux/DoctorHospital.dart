import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/API_SERVICES/hospitalApi.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/provider/DoctorProvider.dart';
import 'package:projet_flutter/screens/doctor/DetailDoctor.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/Drawer.dart';
import 'package:projet_flutter/widgets/ErrorPage.dart';
import 'package:provider/provider.dart';
import '../../API_SERVICES/DoctorApi.dart';
import '../../CONSTANTS/chips.dart';
import '../../CONSTANTS/color.dart';
import '../../classes/DoctorClass.dart';
import '../Home.dart';
import '../doctor/DoctorWidget.dart';

class ListDoctorsHospital extends StatefulWidget {
  @override
  _ListDoctors createState() {
    // TODO: implement createState
    return _ListDoctors();
  }
}

class _ListDoctors extends State<ListDoctorsHospital> {
  @override
  final doctors = [];
  bool cat = false;
  String? search;
  int? indexColor;
  String? id;

  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final doctor = Provider.of<DoctorProvider>(context);
    List<Doctor>? doctors = filterWithId(doctor.doctor, id);
    return Scaffold(
      appBar: AppBarItem("Doctor"),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              width: width * .9,
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
                    hintText: 'Rechercher un medecin',
                  ),
                  onChanged: (text) => {if (text != null) {}}),
            ),
            Container(
                height: heigth * .1,
                margin: EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(
                            () => {search = CHIPS[index], indexColor = index});
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Chip(
                          labelPadding: EdgeInsets.all(2.0),
                          deleteIcon: Icon(Icons.error),
                          avatar: const CircleAvatar(
                            backgroundColor: Colors.white70,
                          ),
                          label: Text(
                            CHIPS[index],
                            style: TextStyle(
                                color: index != indexColor
                                    ? HexColor(COLOR_PRIMARY)
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: heigth * .02),
                          ),
                          backgroundColor: index == indexColor
                              ? HexColor(COLOR_PRIMARY)
                              : Colors.white,
                          elevation: 1.0,
                          padding: EdgeInsets.all(8.0),
                        ),
                      ),
                    );
                  },
                  itemCount: CHIPS.length,
                  scrollDirection: Axis.horizontal,
                )),
            Expanded(
                child: doctors!.length == 0
                    ? Container(
                        height: heigth * .6,
                        child: const Center(
                          child: Text(
                            "Aucun resultat",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 20),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return DoctorWidget(doctors: doctors, index: index);
                        },
                        itemCount: doctors!.length)),
          ],
        ),
      ),
    );
  }
}

List<Doctor>? filter(List<Doctor>? snapshot, search, bool type) {
  if (type) {
    return snapshot
        ?.where(
            (element) => (element.specialite)!.contains(search!.toLowerCase()))
        .toList();
  }
  return snapshot
      ?.where((element) =>
          (element.nom)!.contains(search!.toLowerCase()) ||
          (element.specialite)!.contains(search!.toLowerCase()))
      .toList();
}

List<Doctor>? filterWithId(List<Doctor>? snapshot, id) {
  return snapshot
      ?.where((element) => (element.nom)!.contains(id!.toLowerCase()))
      .toList();
}

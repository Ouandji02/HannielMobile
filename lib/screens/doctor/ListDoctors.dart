import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/API_SERVICES/hospitalApi.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/screens/doctor/DetailDoctor.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/Drawer.dart';
import 'package:projet_flutter/widgets/ErrorPage.dart';
import '../../API_SERVICES/DoctorApi.dart';
import '../../CONSTANTS/color.dart';
import '../../classes/DoctorClass.dart';
import '../Home.dart';
import 'DoctorWidget.dart';

class ListDoctors extends StatelessWidget {
  @override
  final doctors = [];

  Widget build(BuildContext context) {
    // TODO: implement build
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  itemBuilder: (context, snapshot) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Chip(
                        labelPadding: EdgeInsets.all(2.0),
                        deleteIcon: Icon(Icons.error),
                        avatar: CircleAvatar(
                          backgroundColor: Colors.white70,
                        ),
                        label: Text(
                          "FEMALE",
                          style: TextStyle(
                              color: HexColor(COLOR_PRIMARY),
                              fontWeight: FontWeight.bold,
                              fontSize: heigth * .02),
                        ),
                        backgroundColor: Colors.white,
                        elevation: 1.0,
                        padding: EdgeInsets.all(8.0),
                      ),
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                )),
            Expanded(
                child: FutureBuilder(
              future: DoctorApi.getDoctor(),
              builder: (context, AsyncSnapshot<List<Doctor>?> snapshot) {
                if (snapshot.hasError)
                  return page404Error(context, ListDoctors());
                if (snapshot.hasData)
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return DoctorWidget(doctors: snapshot.data, index: index);
                    },
                    itemCount: snapshot.data!.length,
                  );
                else
                  return Center(
                    child: CircularProgressIndicator(
                      color: HexColor(COLOR_PRIMARY),
                    ),
                  );
              },
            )),
          ],
        ),
      ),
    );
  }
}

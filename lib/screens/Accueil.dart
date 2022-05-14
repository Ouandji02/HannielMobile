import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projet_flutter/screens/MedicamentScreen.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/BottomNavigation.dart';
import 'package:projet_flutter/widgets/CampagneWidget.dart';
import 'package:projet_flutter/widgets/MaladieWidget.dart';

import '../widgets/PharmacieWidget.dart';

class Accueil extends StatefulWidget {
  @override
  _Accueil createState() => _Accueil();
}

class _Accueil extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String nom = 'thierry';
    final user = 'thierry';
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBarPrincipal(nom,context),
      drawer: DrawerLayout(user, context),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: width * .9,
                  height: heigth * .08,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            offset: Offset(0, -3),
                            blurRadius: 7,
                            spreadRadius: 3)
                      ]),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black38,
                      ),
                      hintText: "Effectuer une recherche",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: heigth * .08,
              child: ListView.builder(
                itemBuilder: (context, snapshot) {
                  return MaladieWidget();
                },
                scrollDirection: Axis.horizontal,
                itemCount: 6,
              ),
            ),
            Container(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(30),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Medicaments',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: heigth * .20,
                    child: ListView.builder(
                      itemBuilder: (context, snapshot) {
                        return pharmacyWidget(context);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Campagnes medecinales',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: heigth * .20,
                    child: ListView.builder(
                      itemBuilder: (context, snapshot) {
                        return CampagneWidget(context);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pharmacies',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: heigth * .20,
                    child: ListView.builder(
                      itemBuilder: (context, snapshot) {
                        return pharmacyWidget(context);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(1),
    );
  }
}

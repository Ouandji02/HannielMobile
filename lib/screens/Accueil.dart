import 'package:flutter/material.dart';
import 'package:projet_flutter/widgets/AppBar.dart';

import '../widgets/PharmacieWidget.dart';

class Accueil extends StatefulWidget{
  @override
  _Accueil createState() => _Accueil();

}

class _Accueil extends State<Accueil>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String nom = 'thierry';
    final user = 'thierry';
    return Scaffold(
      appBar: AppBarPrincipal(nom: nom),
      drawer: DrawerLayout(user, context),
      body: Container(
        child: Column(
          children: [
            pharmacyWidget(context),
          ],
        ),
      ),
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/pages/Medication.dart';
import 'package:projet_flutter/widgets/CustomBottomNavigation.dart';

import '../CONSTANTS/color.dart';
import 'Notifications.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key? key}) : super(key: key);

  @override
  _Messaging createState() {
    return _Messaging();
  }
}

class _Messaging extends State<Messaging> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () {},
          child: Icon(
            Icons.dehaze,
            color: HexColor(COLOR_PRIMARY),
            size: screen.width / 12,
          ),
        ),
        title: Text(
          "MediApp",
          style: TextStyle(color: HexColor(COLOR_PRIMARY)),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Notifications()));
            },
            child: Icon(
              Icons.notifications_none_outlined,
              color: HexColor(COLOR_PRIMARY),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(context,1),
      body: Medication1(screen),
    );
  }
}

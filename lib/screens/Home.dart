import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/DetailDoctor.dart';
import 'package:projet_flutter/screens/Messaging.dart';
import 'package:projet_flutter/screens/pages/Dashboard.dart';
import 'package:projet_flutter/screens/pages/Medication.dart';
import 'package:projet_flutter/widgets/CustomBottomNavigation.dart';
import 'package:projet_flutter/widgets/Drawer.dart';

import 'Notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    int index = 0;
    change(int a){
      setState(() {
        index = a;
      });
    }
    print(index);
    final pages = [
      Dashboard(screen),
      Medication1(screen)
    ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.reorder_outlined,
                color: HexColor(COLOR_PRIMARY),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )),
      drawer: DrawerLayout("user", context),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: HexColor(COLOR_PRIMARY),
          index: index,
          items: [
            TextButton(
                onPressed: ()=>setState(() {
                  index = 0;
                }),
                child: Icon(
                  Icons.home,
                  color: HexColor(COLOR_PRIMARY),
                  size: 20,
                )),
            TextButton(
                onPressed: ()=>setState(() {
                  index = 1;
                }),
                child: Icon(Icons.person_rounded,
                    color: HexColor(COLOR_PRIMARY), size: 20)),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Messaging()));
                },
                child: Icon(Icons.message_rounded,
                    color: HexColor(COLOR_PRIMARY), size: 20)),
            TextButton(
                onPressed: ()=>change(2),
                child: Icon(Icons.medication_rounded,
                    color: HexColor(COLOR_PRIMARY), size: 20))
          ]),
      body: pages[index]
    );
  }
}

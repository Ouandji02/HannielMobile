import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class EntryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;

    /*Future.delayed(const Duration(seconds: 0), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString("userId") != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ));
      }
    });*/
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/firstDoctor.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  HexColor(COLOR_PRIMARY).withOpacity(.85), BlendMode.darken),
            ),
          ),
          child: Container(
            height: size.height,
            width: size.width,
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                      bottom: size.height * .4,
                      left: 30,
                      child: Text(
                        'MedApp',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * .07,
                            fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                      bottom: size.height * .25,
                      left: 30,
                      child: Container(
                        width: size.width * .8,
                        child: Text(
                          'Sick is easy, \nbut health is hard',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: size.width * .09),
                        ),
                      )),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: HexColor(COLOR_PRIMARY).withOpacity(.8),
                            boxShadow: [
                              BoxShadow(
                                  color: HexColor(COLOR_PRIMARY),
                                  offset: Offset(0, -20),
                                  blurRadius: 20,
                                  spreadRadius: 3)
                            ]),
                        height: size.height * .18,
                        width: size.width,
                      )),
                  Positioned(
                    bottom: size.height * .15,
                    left: 30,
                    child: Container(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                color: HexColor(COLOR_PRIMARY),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.white.withOpacity(.9)),
                              minimumSize: MaterialStateProperty.all(
                                  Size(size.width * .7, 50)),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  HexColor(COLOR_SECONDARY)),
                              elevation: MaterialStateProperty.all(30),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10))))),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/LoginScreen.dart';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ScreenPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/photos/hospital-doctor-with-digital-tablet-talks-to-male-patient-picture-id504477658?b=1&k=20&m=504477658&s=170667a&w=0&h=L4QmnCGmI3UW4wZLtGu73AEzYGQ38P-BQtWn_qxRZyM='),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      HexColor('001B2E').withOpacity(.85), BlendMode.darken))),
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
                        'Hanniel Apps',
                        style: TextStyle(
                            color: HexColor('5FBEFF'),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                      bottom: size.height * .25,
                      left: 30,
                      child: Container(
                        width: size.width * .8,
                        child: Text(
                          'Sick is easy, but health is hard',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * .1),
                        ),
                      )),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: HexColor('000D15').withOpacity(.8),
                            boxShadow: [
                              BoxShadow(
                                  color: HexColor('000D15'),
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(size.width * .7, 50)),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  HexColor('0061A4')),
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

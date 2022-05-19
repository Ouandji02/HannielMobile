import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: size.height * .55,
              width: size.width,
              color: HexColor(COLOR_PRIMARY),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 50,
                      right: size.height * .5 - size.height/2,
                      child: Column(
                    children: [
                      Icon(Icons.rocket_launch,size: size.height * .2,color: Colors.white,),
                      Text('Welcome to MedApp', style: TextStyle(color: Colors.white,fontSize: 35),)
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

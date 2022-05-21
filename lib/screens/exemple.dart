import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';

class EntryApp extends StatelessWidget {
  const EntryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration:BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/accueil.png'),
                  fit: BoxFit.cover
              )
          ),
          child: Stack(
            children: [
              /*Positioned(
              top: size.height * .35,
                right: size.width * .35,
                child: Row(
              children: [
                Container(
                  child: Icon(
                      Icons.add,
                      color: Colors.red,
                    size: 30,
                    ),
                  margin: EdgeInsets.only(right: 10),
                )
                ,
                Text('Med',style: TextStyle(color: Colors.white,fontSize: 30),),
                Text('APP',style: TextStyle(color: Colors.white.withOpacity(.3),fontSize: 30))
              ],
            )),*/
              Positioned(
                  bottom: size.height * .35,
                  right: size.width * .32,
                  child: Container(
                      width: size.width * .4,
                      child:const LinearProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      )
                  ) )
            ],
          ),
        )
    );
  }
}

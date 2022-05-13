import 'package:flutter/material.dart';
import 'package:projet_flutter/screens/LoginScreen.dart';

class ScreenPrincipal extends StatelessWidget {
  const ScreenPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        toolbarHeight: height * .6,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/undraw_doctors_hwty.png'))),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child:const Center(
              child: Text(
                'HANNIEL',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w900,
                    fontSize: 35),
              ),
            ) ,
          )
          ,
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5, right: 5),
            child: const Text(
              "Ne vous deplacez plus pour chercher une pharmacie, nous la cherchons a votre place",
              style: TextStyle(color: Colors.black45, fontSize: 18),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Center(
              child: Container(
                width: width * .6,
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 1
                    ),
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                    },
                    color: Colors.blueAccent,
                    child: const Text(
                      "SUIVANT",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

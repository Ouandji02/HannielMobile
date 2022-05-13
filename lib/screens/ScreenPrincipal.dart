import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0xff008ED6),
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
          const Center(
            child: Text(
              'Hanniel',
              style: TextStyle(
                  color: Color(0xff008ED6),
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5, right: 5),
            child: const Text(
              "Ne vous deplacez plus pour chercher une pharmacie, nous la cherchons a votre place",
              style: TextStyle(color: Colors.black45, fontSize: 16),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 5),
                    onPressed: () {},
                    color: const Color(0xff008ED6),
                    child: const Text(
                      "SUIVANT",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
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

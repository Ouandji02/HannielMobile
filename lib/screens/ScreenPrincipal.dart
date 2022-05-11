import 'package:flutter/material.dart';

class ScreenPrincipal extends StatelessWidget {
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        toolbarHeight: height * .6,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/undraw_doctors_hwty.png'))),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text(
                'Hanniel',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 5, right: 5),
              child: Text(
                "Ne vous deplacez plus pour chercher une pharmacie, nous la cherchons a votre place",
                style: TextStyle(color: Colors.black45, fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Container(
                  child: Container(
                    width: width * .6,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        child: FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          onPressed: () {},
                          color: Colors.blueAccent,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

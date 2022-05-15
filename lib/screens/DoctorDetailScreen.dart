import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class DoctorDetailScreen extends StatefulWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: HexColor('1c2d38'),
      appBar: AppBar(
        elevation: 0,
        title: Text("Detail Larissa Bolando"),
        leading: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: HexColor('001B2E'),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: HexColor('1c2d38'),
      ),
      bottomNavigationBar: Card(
        elevation: 10,
        child: Text("ici sera le bouton "),
      ),
      body: Container(
        margin: EdgeInsets.all(width / 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                      shadowColor: HexColor('5FBEFF'),
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://thumbs.dreamstime.com/b/portrait-black-male-doctor-stethoscope-white-background-smiling-176051856.jpg",
                          width: 100,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      )),
                  SizedBox(
                    width: width / 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr Larissa Bolando",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Dentiste",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Card(
                              color: HexColor('001B2E'),
                              elevation: 10,
                              shadowColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                              )),
                          Column(
                            children: [
                              Text(
                                " 4.5/5",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Card(
                              color: HexColor('001B2E'),
                              elevation: 10,
                              shadowColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.local_hospital,
                                color: Colors.blueAccent,
                              )),
                          Column(
                            children: [
                              Text(
                                "Hopital de district",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Card(
                color: HexColor('001B2E'),
                elevation: 30,
                child: Container(
                    width: width,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Biography",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Coordonnates",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.email,
                                color: Colors.white.withOpacity(0.5)),
                            Text(
                              "Yannicksimo616@gmail.com",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone,
                                color: Colors.white.withOpacity(0.5)),
                            Text(
                              "+237 697987609",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Avis",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Column(
                          children: [
                            Text(
                              "Dr Blande simo est d'un professionnalisme hors du commun,",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontWeight: FontWeight.w400),
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.8),
                              height: 20,
                            ),
                            Text(
                              "Dr Blande simo est d'un professionnalisme hors du commun,",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontWeight: FontWeight.w400),
                            ),
                            Divider(
                              color: Colors.white.withOpacity(0.8),
                              height: 20,
                            ),
                            Text(
                              "Dr Blande simo est d'un professionnalisme hors du commun,",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../CONSTANTS/color.dart';

class DetailDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: size.height),
          padding: EdgeInsets.only(top: 0),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: size.height * .35,
                width: size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/firstDoctor.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 5,
                        left: 5,
                        child: IconButton(
                            onPressed: ()=>Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: size.height * .04,
                            )))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * .05, right: size.width * .05),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * .1,
                      child: Stack(
                        children: [
                          Positioned(
                              top: (size.height * .13) / 3 - 20,
                              child: Text(
                                "Disponible maintenant",
                                style: TextStyle(color: Colors.green),
                              )),
                          Positioned(
                            top: (size.height * .13) / 3,
                            child: Text(
                              "Simo Larissa",
                              style: TextStyle(
                                color: HexColor(COLOR_TITLE),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                              top: (size.height * .13) / 3 + 20,
                              child: Text(
                                'Docteur familial therapeute',
                                style: TextStyle(color: Colors.black26),
                              )),
                          Positioned(
                            top: (size.height * .13) / 3,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(left: size.width * .06),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            child: CircularPercentIndicator(
                              animation: true,
                              animationDuration: 2500,
                              radius: size.width * .133,
                              lineWidth: 10.0,
                              percent: .85,
                              center: new Text("85%"),
                              progressColor: HexColor(COLOR_PRIMARY),
                              footer: Text("Good Reviews",
                                  style: TextStyle(
                                    fontSize: size.width * .048,
                                    color: Colors.black26,
                                  )),
                            ),
                            margin: EdgeInsets.only(right: 5),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: CircularPercentIndicator(
                              animation: true,
                              animationDuration: 2500,
                              radius: size.width * .133,
                              lineWidth: 10.0,
                              percent: .95,
                              center: new Text("95%"),
                              progressColor: HexColor(COLOR_PRIMARY),
                              footer: Text("Total Score",
                                  style: TextStyle(
                                    fontSize: size.width * .048,
                                    color: Colors.black26,
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            child: CircularPercentIndicator(
                              animation: true,
                              animationDuration: 2500,
                              radius: size.width * .133,
                              lineWidth: 10.0,
                              percent: .90,
                              center: new Text("90%"),
                              progressColor: HexColor(COLOR_PRIMARY),
                              footer: Text(
                                "Satisfaction",
                                style: TextStyle(
                                  fontSize: size.width * .048,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "About",
                        style: TextStyle(
                            fontSize: size.width * .08,
                            color: HexColor(COLOR_TITLE),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Docteur simo est une terapeute avec 5 ans d'experience.Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum sunt maxime blanditiis possimus tenetur, voluptate tempora ad iusto assumenda laudantium.",
                        style: TextStyle(
                          fontSize: size.width * .048,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Card(
                            elevation: 5,
                            child: CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.phone,
                                    color: HexColor(COLOR_PRIMARY),
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Card(
                            elevation: 5,
                            child: CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.message_rounded,
                                    color: HexColor(COLOR_PRIMARY),
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          child: Chip(
                            labelPadding: EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                            ),
                            backgroundColor: HexColor(COLOR_PRIMARY),
                            elevation: 5.0,
                            shadowColor: Colors.grey[60],
                            label: Text(
                              "BOOK AND APPOINTMENT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * .04),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

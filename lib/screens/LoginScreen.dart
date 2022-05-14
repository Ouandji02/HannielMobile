import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media.istockphoto.com/photos/hospital-doctor-with-digital-tablet-talks-to-male-patient-picture-id504477658?b=1&k=20&m=504477658&s=170667a&w=0&h=L4QmnCGmI3UW4wZLtGu73AEzYGQ38P-BQtWn_qxRZyM='),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          HexColor(PRIMARY_COLOR).withOpacity(.7),
                          BlendMode.darken))),
              child: Container(
                height: size.height * .5,
                width: size.width,
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: size.height * .1,
                          left: 30,
                          child: Text(
                            'Hanniel Apps',
                            style: TextStyle(
                                color: HexColor('5FBEFF'),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          bottom: size.height * .16,
                          left: 30,
                          child: Container(
                            width: size.width * .8,
                            child: Text(
                              'Care your health, care your life',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .11),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(color: HexColor(PRIMARY_COLOR)),
                height: (size.height * .5) + 5,
                width: size.width,
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                          top: 20,
                          left: 30,
                          child: Text(
                            'Log in',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          top: 60,
                          left: 30,
                          child: Container(
                              width: size.width * .8,
                              child: Column(
                                children: [
                                  Container(
                                    child: TextField(
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        height: .10,
                                      ),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white.withOpacity(.1),
                                        filled: true,
                                        border: InputBorder.none,
                                        labelText: 'Email Address',
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                    EdgeInsets.only(top: 30, bottom: 30),
                                    child: TextField(
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        height: .10,
                                      ),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        fillColor: Colors.white.withOpacity(.1),
                                        filled: true,
                                        border: InputBorder.none,
                                        labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                        labelText: 'Password',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Get Started',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        style: ButtonStyle(
                                            minimumSize:
                                            MaterialStateProperty.all(
                                                Size(size.width * .8, 50)),
                                            shadowColor: MaterialStateProperty
                                                .all<Color>(HexColor('0061A4')),
                                            elevation:
                                            MaterialStateProperty.all(30),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10))))),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      alignment:
                                      AlignmentDirectional.centerStart,
                                      child: Text(
                                        'Forgot Password ?',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
                              ))),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );;
  }
}

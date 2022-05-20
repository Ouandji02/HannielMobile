import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/screens/Login.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: size.height * .35,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/image1.png'),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        top: 15,
                        left: 5,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            )))
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * .08,
                          right: 20,
                          left: 20,
                          bottom: 10),
                      child: Text('Create an account to get started',
                          style: TextStyle(
                              color: HexColor(COLOR_TITLE),
                              fontSize: 25,
                              fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * .08,
                          right: 20,
                          left: 20,
                          bottom: 30),
                      width: size.width * .8,
                      child: Column(
                        children: [
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    'First name',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: 'Simo',
                                        hintStyle: STYLE_INPUT))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    'Last name',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: 'Larissa',
                                        hintStyle: STYLE_INPUT))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    'Gender',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          width: size.width * .4,
                                          child: Row(
                                            children: [
                                              Text(
                                                'Male',
                                                style: STYLE_INPUT,
                                              ),
                                              Radio(
                                                  value: true,
                                                  groupValue: true,
                                                  fillColor:
                                                      MaterialStateProperty.all(
                                                          HexColor(
                                                              COLOR_PRIMARY)),
                                                  onChanged: null),
                                            ],
                                          )),
                                      Container(
                                          width: size.width * .4,
                                          child: Row(
                                            children: [
                                              Text(
                                                'Feminin',
                                                style: STYLE_INPUT,
                                              ),
                                              Radio(
                                                  value: true,
                                                  groupValue: 'male',
                                                  onChanged: null),
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    'Email',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: 'thierry@gmail.com',
                                        hintStyle: STYLE_INPUT))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    'Password',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                TextField(
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.remove_red_eye),
                                        hintText: '********',
                                        hintStyle: STYLE_INPUT))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    'Confirm Password',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                TextField(
                                    obscureText: true,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.remove_red_eye),
                                        hintText: '********',
                                        hintStyle: STYLE_INPUT))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                print('object');
                              },
                              label: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      HexColor(COLOR_PRIMARY)),
                                  minimumSize: MaterialStateProperty.all(
                                      Size(size.width * .8, 50)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)))),
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.blueAccent,
                                size: 0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.center,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Already a members?",
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: TextButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login())),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: size.height * .025),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

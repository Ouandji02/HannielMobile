import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/screens/Register.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                color: HexColor(COLOR_PRIMARY),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.rocket_launch,
                        size: size.height * .15,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                        bottom: 30,
                        child: Container(
                          width: size.width,
                          alignment: Alignment.center,
                          child: Text(
                            'Welcome to MedAPP',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w700),
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.height * .08, right: 20, left: 20, bottom: 10),
                child: Text('Login to your account to continue',
                    style: TextStyle(
                        color: HexColor(COLOR_TITLE),
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: size.height * .08, right: 20, left: 20, bottom: 30),
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
                      alignment: AlignmentDirectional.centerEnd,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(color: HexColor(COLOR_PRIMARY)),
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
                          'Login',
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
                                    borderRadius: BorderRadius.circular(5)))),
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.blueAccent,
                          size: 0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "you don't have account?",
                        style: STYLE_INPUT,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Register())),
                        child: Text('Register now'),
                      ),
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

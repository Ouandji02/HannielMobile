import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/screens/Register.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<Login> {
  @override
  bool _loading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscurePassword = true;

  signIn(String email, String password, BuildContext context) async {
    try {
      var response = await http.post(
        Uri.parse("https://hanniel-api.herokuapp.com/hanniel/patient/signIn"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{"email": email, "password": password}),
      );
      print(response.body + "         " + response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        var bodyResponse = json.decode(response.body).cast<String, dynamic>();
        print("ddddddddddddddddddddddddddddddddddddddd" +
            bodyResponse['message']);
        if (bodyResponse["message"]["id"] != null) {
          setState(() {
            _loading = false;
          });
          SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString('user', bodyResponse["message"]);
          if (prefs.getString('user') != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          }
          const snackbar = SnackBar(
            content: Text(
              'Connexion reussie',
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(seconds: 5),
            backgroundColor: Colors.greenAccent,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        } else {
          setState(() {
            _loading = false;
          });
          return Alert(
                  context: context,
                  type: AlertType.warning,
                  desc: "cet utilisateur n'existe pas")
              .show();
        }
      } else {
        setState(() {
          _loading = false;
        });
        const snackbar = SnackBar(
          content: Text(
            "Une erreur inconnu s'est produite",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
      const snackbar = SnackBar(
        content: Text(
          "Une erreur inconnu s'est produite",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  alertInfo() {
    setState(() {
      _loading = false;
    });
    Alert(
            context: context,
            type: AlertType.warning,
            title: 'Information',
            desc: "veuillez renseigner les champs")
        .show();
  }

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
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/signImage.png'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  HexColor(COLOR_PRIMARY).withOpacity(.7),
                                  BlendMode.darken))),
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
                                fontSize: 25,
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
                        fontSize: 20,
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
                              controller: email,
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
                              controller: password,
                              obscureText: obscurePassword,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () => setState(() {
                                            obscurePassword = !obscurePassword;
                                          }),
                                      icon: obscurePassword
                                          ? Icon(Icons.visibility_off_rounded)
                                          : Icon(Icons.remove_red_eye)),
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
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _loading = true;
                          });
                          email.text == '' || password.text == ''
                              ? alertInfo()
                              : signIn(email.text, password.text, context);
                        },
                        child: _loading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
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
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register())),
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

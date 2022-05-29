import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/CONSTANTS/color.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/screens/Login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _Register createState() {
    // TODO: implement createState
    return _Register();
  }
}

class _Register extends State<Register> {
  @override
  // dropValue permettant d;initialiser les valeurs du select
  String dropdownValue = "Male";

  // Controller pour les differents champs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // Variable permettant degere la spine
  bool _loading = false;

  //variable permettant de recuperer la date

  DateTime? datetime;

  //Declaration des variables permettant d'afficher les erreurs
  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';
  String phoneError = '';
  String firstnameError = '';
  String lastnameError = "";
  String genreError = "";
  String dateError = "";

// methode de connexion
  signUp(String email, String password, String confirm, String phone,
      String name, BuildContext context) async {
    if (password != confirm) {
      setState(() {
        _loading = false;
        confirmPasswordError = "la confirmation doit etre identique";
      });
    } else {
      Map body = {
        "name": name,
        "tel": phone,
        "email": email.trim(),
        "password": password,
        "confirm_password": confirm
      };
      var url1 = 'http://phrasebook.cameroonetranslate.com/api/register';
      var response = await http.post(
        Uri.parse(url1),
        body: body,
      );
      print(response.statusCode);
      if (response.statusCode == 201 || response.statusCode == 200) {
        var bodyResponse = json.decode(response.body).cast<String, dynamic>();
        print(bodyResponse['error']);
        if (bodyResponse['error'] == false) {
          setState(() {
            _loading = false;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
          const snackbar = SnackBar(
            content: Text(
              'votre compte a ete cree avec succes',
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
          print(bodyResponse['messages']);
          var message = bodyResponse['message'];
          setState(() {
            message['tel'] != null ? phoneError = message['tel'] : null;
            message['name'] != null ? firstnameError = message['name'] : null;
            message['email'] != null ? emailError = message['email'] : null;
            message['password'] != null
                ? passwordError = message['password']
                : null;
            message['confirm_password'] != null
                ? confirmPasswordError = message['confirm_password']
                : null;
          });
        }
      } else {
        setState(() {
          _loading = false;
        });
        final snackbar = SnackBar(
          content: const Text(
            "Une erreur unknow s'est produite",
            style: TextStyle(color: Colors.red),
          ),
          duration: const Duration(seconds: 5),
          backgroundColor: HexColor('#FFD700'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }
  }

  alertInfo() {
    setState(() {
      _loading = false;

      _emailController.text == ''
          ? emailError = 'veuillez remplir le champ'
          : '';
      _phoneController.text == ''
          ? phoneError = 'veuillez remplir le champ'
          : '';
      _firstnameController.text == ''
          ? firstnameError = 'veuillez remplir le champ'
          : '';
      _lastnameController.text == ''
          ? lastnameError = 'veuillez remplir le champ'
          : '';
      _passwordController.text == ''
          ? passwordError = 'veuillez remplir le champ'
          : '';
      _genreController.text == ""
          ? genreError = "veuillez preciser votre sexe"
          : "";
      _dateController.text == ""
          ? dateError = "Veuillez prciser votre annee de naissance"
          : "";
      _passwordConfirmController.text == ''
          ? confirmPasswordError = 'veuillez remplir le champ'
          : '';
    });
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
                                fontSize: size.height * .045,
                                fontWeight: FontWeight.w700),
                          ),
                        ))
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
                              fontSize: size.height * .035,
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
                                  controller: _firstnameController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hintText: 'Simo', hintStyle: STYLE_INPUT),
                                ),
                                Text(
                                  firstnameError,
                                  style: TextStyle(color: Colors.red),
                                )
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
                                  controller: _lastnameController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hintText: 'Larissa',
                                      hintStyle: STYLE_INPUT),
                                ),
                                Text(
                                  lastnameError,
                                  style: TextStyle(color: Colors.red),
                                )
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
                                    child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>['Male', 'Female']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  isExpanded: true,
                                )),
                                Text(
                                  genreError,
                                  style: TextStyle(color: Colors.red),
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
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hintText: 'thierry@gmail.com',
                                      hintStyle: STYLE_INPUT),
                                ),
                                Text(
                                  emailError,
                                  style: TextStyle(color: Colors.red),
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
                                    'Date de naissance',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                TextField(
                                  onTap: () async {
                                    DateTime? newDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(2022),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2023));

                                    if (newDate != null)
                                      setState(() {
                                        datetime = newDate;
                                      });
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      hintText:
                                          "${datetime?.day}--${datetime?.month}--${datetime?.year}",
                                      hintStyle: STYLE_INPUT),
                                ),
                                Text(
                                  emailError,
                                  style: TextStyle(color: Colors.red),
                                )
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
                                  controller: _passwordController,
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.remove_red_eye),
                                      hintText: '********',
                                      hintStyle: STYLE_INPUT),
                                ),
                                Text(
                                  passwordError,
                                  style: TextStyle(color: Colors.red),
                                )
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
                                  controller: _passwordConfirmController,
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.remove_red_eye),
                                      hintText: '********',
                                      hintStyle: STYLE_INPUT),
                                ),
                                Text(
                                  confirmPasswordError,
                                  style: TextStyle(color: Colors.red),
                                )
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

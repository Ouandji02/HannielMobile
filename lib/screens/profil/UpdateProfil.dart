import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/screens/profil/Profil.dart';
import 'package:http/http.dart' as http;
import 'package:projet_flutter/widgets/AppBar.dart';
import '../../CONSTANTS/CONFIG.dart';
import '../../CONSTANTS/color.dart';
import '../../CONSTANTS/style.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfil extends StatefulWidget {
  @override
  _UpdateProfil createState() {
    // TODO: implement createState
    return _UpdateProfil();
  }
}

class _UpdateProfil extends State<UpdateProfil> {
  @override
  String dropdownValue = "Male";
  String sanguin = "O+";
  XFile? _image;
  String image = '';

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
  final TextEditingController _poids = TextEditingController();
  final TextEditingController _taille = TextEditingController();

  // Variable permettant degere la spine
  bool _loading = false;

  //variable permettant de recuperer la date
  DateTime? datetime;

  //visbiite password
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  //Declaration des variables permettant d'afficher les erreurs
  String emailError = '';
  String phoneError = '';
  String firstnameError = '';
  String lastnameError = "";
  String dateError = "";
  String poidsError = "";
  String tailleError = "";

  Future getImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    print(_image?.path);
    print(_image?.name);
  }

// methode de connexion
  Future signUp(
      String email,
      String poids,
      String taille,
      String firstname,
      BuildContext context,
      String lastname,
      String datetime,
      String sexe,
      String phone,
      String sanguin,
      XFile _image) async {
    print(
        "jhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");

    try {
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJWTlhTbHJCS1NlTmQxdlhxVEY1M0FiSHJPQVYyIiwiaWF0IjoxNjU0MjAxMzQxfQ.w-YcokPb426pO31iJ-eHh--1lm6bouAdzG3lEEbO9i0";

      var url = Uri.http(APIURL, UPDATEUSERURL);
      var requestMethod = "POST";
      var request = http.MultipartRequest(requestMethod, url);
      request.fields["name"] = firstname;
      request.fields["surname"] = lastname;
      request.fields["date"] = datetime;
      request.fields["sexe"] = sexe;
      request.fields["email"] = email;
      request.fields["phone"] = phone;
      request.fields["poids"] = poids;
      request.fields["taille"] = taille;
      request.fields["sanguin"] = sanguin;
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        "image",
        _image.path,
      );
      request.headers['Authorization'] = "Bearer $token";
      request.files.add(multipartFile);
      var response = await request.send();
      print(
          "cccccccccccccccccccccccc ${response.statusCode} ${response.request}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("fghffffffffffffffffffffffffffffffffffffffffffffffffffffffffff");
        setState(() {
          _loading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profil(),
          ),
        );
        const snackbar = SnackBar(
          content: Text(
            'Mis a jour reussie',
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.greenAccent,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        setState(() {
          _loading = false;
        });
      } else {
        setState(() {
          _loading = false;
        });
        final snackbar = SnackBar(
          content: const Text(
            "Une erreur inconnu s'est produite",
            style: TextStyle(color: Colors.red),
          ),
          duration: const Duration(seconds: 5),
          backgroundColor: HexColor('#FFD700'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    } catch (Exception) {
      print(Exception);
      setState(() {
        _loading = false;
      });
      final snackbar = SnackBar(
        content: const Text(
          "Une erreur inconnu s'est produite",
          style: TextStyle(color: Colors.red),
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: HexColor('#FFD700'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  alertInfo() {
    setState(
      () {
        _loading = false;

        _emailController.text == ''
            ? emailError = 'veuillez remplir le champ'
            : '';
        _phoneController.text == ''
            ? phoneError = 'veuillez remplir le champ'
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
        _dateController.text == ""
            ? dateError = "Veuillez prciser votre annee de naissance"
            : "";
        _poids.text == "" ? poidsError = "Veuillez precisez votre poids" : "";
        _taille.text == ""
            ? tailleError = "veuillez preciser votre taille"
            : "";
      },
    );
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarItem("Edit profil"),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: size.height * .08,
                            right: 20,
                            left: 20,
                            bottom: 10),
                        alignment: AlignmentDirectional.center,
                        child: Column(
                          children: [
                            InkWell(
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(100),
                                      image: _image != null
                                          ? DecorationImage(
                                              image:
                                                  FileImage(File(_image!.path)),
                                              fit: BoxFit.cover)
                                          : DecorationImage(
                                              image: AssetImage(
                                                "assets/images/firstDoctor.png",
                                              ),
                                              fit: BoxFit.cover)),
                                ),
                                onTap: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: _image != null
                                                  ? DecorationImage(
                                                      image: FileImage(
                                                          File(_image!.path)))
                                                  : DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/firstDoctor.png")),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 10,
                                                    offset: Offset(2, -2),
                                                    spreadRadius: 3),
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 10,
                                                    offset: Offset(-2, 2),
                                                    spreadRadius: 3)
                                              ]),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .6,
                                        ),
                                      );
                                    })),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: TextButton(
                                onPressed: getImage,
                                child: Text(
                                  'Change avatar',
                                  style:
                                      TextStyle(fontSize: size.height * .025),
                                ),
                              ),
                            )
                          ],
                        )),
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
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
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
                                    'number',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                TextField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: '699665914',
                                      hintStyle: STYLE_INPUT),
                                ),
                                Text(
                                  phoneError,
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
                                  keyboardType: TextInputType.datetime,
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
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    'Taille',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                TextField(
                                  controller: _taille,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: '1.60', hintStyle: STYLE_INPUT),
                                ),
                                Text(
                                  tailleError,
                                  style: TextStyle(color: Colors.red),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    'Poids',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                TextField(
                                  controller: _poids,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: '45Kg', hintStyle: STYLE_INPUT),
                                ),
                                Text(
                                  poidsError,
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
                                    'Groupe de sanguin',
                                    style: STYLE_INPUT,
                                  ),
                                ),
                                Container(
                                  child: DropdownButton<String>(
                                    value: sanguin,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        sanguin = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'O+',
                                      'O-',
                                      'A+',
                                      'A-',
                                      'B+',
                                      'B-',
                                      'AB-',
                                      'AB+'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    isExpanded: true,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: AlignmentDirectional.centerStart,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _loading = true;
                                  phoneError = "";
                                  firstnameError = "";
                                  lastnameError = "";
                                  firstnameError = "";
                                  emailError = "";
                                  dateError = "";
                                  tailleError = "";
                                });
                                _emailController.text == '' ||
                                        _lastnameController == '' ||
                                        _firstnameController == '' ||
                                        _phoneController == '' ||
                                        datetime == null ||
                                        _poids.text == "" ||
                                        _taille.text == "" ||
                                        _image == null
                                    ? alertInfo()
                                    : signUp(
                                        _emailController.text,
                                        _poids.text,
                                        _taille.text,
                                        _firstnameController.text,
                                        context,
                                        _lastnameController.text,
                                        datetime.toString(),
                                        dropdownValue,
                                        _phoneController.text,
                                        sanguin,
                                        _image!);
                                // ignore: unnecessary_const
                              },
                              child: _loading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    )
                                  : Text(
                                      'update',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    HexColor(COLOR_PRIMARY)),
                                minimumSize: MaterialStateProperty.all(
                                    Size(size.width * .9, 40)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
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

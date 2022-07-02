import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projet_flutter/classes/UserClass.dart';
import 'package:projet_flutter/screens/profil/UpdateProfil.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../API_SERVICES/userApi.dart';

class ProfilUser extends StatefulWidget {
  @override
  Profil createState() {
    // TODO: implement createState
    return Profil();
  }
}

class Profil extends State<ProfilUser> {
  var user = null;

  void getUserStorage() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("user") != null) {
      var userP = jsonDecode(prefs.getString("user")!);
      print("fbgbgbgbbbb${userP["message"]}");
      setState(() {
        user = userP["message"];
      });
      print('fddddddddddddddsddjdd');
      print(user);
    }
  }

  @override
  void initState() {
    super.initState();
    print("ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    this.getUserStorage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarItem("profil"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => UpdateProfil())),
        child: Icon(Icons.edit),
      ),
     body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    title: Text(user["name"] != null ? user["name"] : null),
                    subtitle: Text("Nom"),
                    trailing: CircleAvatar(
                      backgroundImage:
                      AssetImage(user["photo"] != null ? user["photo"] : null),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text(
                      "Contact number",
                      style: TextStyle(color: Colors.black45, fontSize: 14),
                    ),
                    trailing: Text(user["phone"] != null ? user["phone"] : "null"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("Email",
                        style: TextStyle(color: Colors.black45, fontSize: 14)),
                    trailing: Text(user["email"] != null ? user["email"] : "null"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("Gender",
                        style: TextStyle(color: Colors.black45, fontSize: 14)),
                    trailing: Text(user["sexe"] != null ? user["sexe"] : "null"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("Date of birth",
                        style: TextStyle(color: Colors.black45, fontSize: 14)),
                    trailing: Text(user["dateNaissance"] != null ? user["dateNaissance"] : null),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("Blood group",
                        style: TextStyle(color: Colors.black45, fontSize: 14)),
                    trailing: Text("null"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("height",
                        style: TextStyle(color: Colors.black45, fontSize: 14)),
                    trailing: Text(""),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("weight",
                        style: TextStyle(color: Colors.black45, fontSize: 14)),
                    trailing: Text( "null"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("Location",
                        style: TextStyle(color: Colors.black45, fontSize: 14)),
                    trailing: Text(""),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

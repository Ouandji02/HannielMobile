import 'package:flutter/material.dart';
import 'package:projet_flutter/screens/profil/UpdateProfil.dart';
import 'package:projet_flutter/widgets/AppBar.dart';

class Profil extends StatelessWidget {
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
                    title: Text("simo Larissa"),
                    subtitle: Text("Nom"),
                    trailing: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/firstDoctor.png"),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text(
                      "Contact number",
                      style: TextStyle(color: Colors.black45,fontSize: 14),
                    ),
                    trailing: Text("699665914"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title:
                        Text("Email", style: TextStyle(color: Colors.black45,fontSize: 14)),
                    trailing: Text("simolarissa@gmail.com"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title:
                        Text("Gender", style: TextStyle(color: Colors.black45,fontSize: 14)),
                    trailing: Text("Female"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("Date of birth",
                        style: TextStyle(color: Colors.black45,fontSize: 14)),
                    trailing: Text("yyyy mm dd"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("Blood group",
                        style: TextStyle(color: Colors.black45,fontSize: 14)),
                    trailing: Text("o+"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title:
                        Text("height", style: TextStyle(color: Colors.black45,fontSize: 14)),
                    trailing: Text("1.6"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title:
                        Text("weight", style: TextStyle(color: Colors.black45,fontSize: 14)),
                    trailing: Text("55kg"),
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text("Location",
                        style: TextStyle(color: Colors.black45,fontSize: 14)),
                    trailing: Text("add location"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

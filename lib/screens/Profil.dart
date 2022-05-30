import 'package:flutter/material.dart';
import 'package:projet_flutter/widgets/AppBar.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarItem("profil"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  child: ListTile(
                    title: Text("Nom"),
                    subtitle: Text("simo Larissa"),
                    trailing: CircleAvatar(
                      child: Text("S"),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    subtitle: Text("Contact number"),
                    trailing: Text("699665914"),
                  ),
                ),
                Container(
                  child: ListTile(
                    subtitle: Text("Email"),
                    trailing: Text("simolarissa@gmail.com"),
                  ),
                ),
                Container(
                  child: ListTile(
                    subtitle: Text("Gender"),
                    trailing: Text("Female"),
                  ),
                ),
                Container(
                  child: ListTile(
                    subtitle: Text("Date of birth"),
                    trailing: Text("yyyy mm dd"),
                  ),
                ),
                Container(
                  child: ListTile(
                    subtitle: Text("Blood group"),
                    trailing: Text("o+"),
                  ),
                ),
                Container(
                  child: ListTile(
                    subtitle: Text("height"),
                    trailing: Text("1.6"),
                  ),
                ),
                Container(
                  child: ListTile(
                    subtitle: Text("weight"),
                    trailing: Text("55kg"),
                  ),
                ),
                Container(
                  child: ListTile(
                    subtitle: Text("Location"),
                    trailing: Text("add location"),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

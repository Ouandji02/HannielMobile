import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../CONSTANTS/color.dart';
import '../CONSTANTS/style.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  _PatientDetails createState() {
    return _PatientDetails();
  }
}
class _PatientDetails extends State<PatientDetails> {
  @override
  String dropdownValue = "Male";
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: HexColor(COLOR_PRIMARY),
            size: 30,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Patient Details",
          style: TextStyle(color: HexColor(COLOR_TITLE)),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(color: Colors.white),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text("Simo Larissa", style: TextStyle(color: HexColor(COLOR_TITLE), fontWeight: FontWeight.bold,),),
                    subtitle: Text("Family Doctor, Cardiologist", style: TextStyle(color: HexColor(COLOR_SUBTITLE), fontSize: 12),),
                    ),
                  ),
                ),
              Container(
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    title: const Text("Purpose of visit", style: TextStyle(fontSize: 12),),
                    subtitle: Text("Consultation", style: TextStyle(color: HexColor(COLOR_TITLE), fontWeight: FontWeight.bold, fontSize: 15),),
                  ),
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                    top: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text("Date and time", style: TextStyle(fontSize: 12),),
                    subtitle: Text("Tomorrow, 8:30 AM", style: TextStyle(color: HexColor(COLOR_TITLE), fontWeight: FontWeight.bold, fontSize: 15),),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      child: Text("This appointment for:", style: TextStyle(fontWeight: FontWeight.bold, color: HexColor(COLOR_TITLE)),),
                    ),
                    Container(
                      child: Card(
                        elevation: 0,
                        child: Container(
                          alignment: AlignmentDirectional.centerStart,
                          child:Container(
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
                          ),
                        ),
                      ),
                      ),
                  ],
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
              )
            ],
          )
      ),
    );
  }
}

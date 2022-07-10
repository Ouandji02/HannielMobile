import 'package:flutter/material.dart';
import 'package:projet_flutter/provider/DataClass.dart';
import 'package:projet_flutter/screens/EntryApp.dart';
import 'package:projet_flutter/screens/campagne/ListCampagnes.dart';
import 'package:projet_flutter/screens/doctor/ListDoctors.dart';
import 'package:projet_flutter/screens/pages/ListExamination.dart';
import 'package:projet_flutter/screens/pages/ListPresscription.dart';
import 'package:projet_flutter/screens/pages/ListVisit.dart';
import 'package:projet_flutter/screens/prescription/PrescriptionDetail.dart';
import 'package:projet_flutter/widgets/CardPatient.dart';
import 'package:projet_flutter/screens/Home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  String userId = "";

  @override
  void initState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId")!;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataClass(),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            top: true,
            child: SafeArea(child: EntryApp()),
          ),
        );
      },
    );
  }
}

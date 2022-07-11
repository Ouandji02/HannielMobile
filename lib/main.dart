import 'package:flutter/material.dart';
import 'package:projet_flutter/provider/CampaignProvider.dart';
import 'package:projet_flutter/provider/DataClass.dart';
import 'package:projet_flutter/provider/DoctorProvider.dart';
import 'package:projet_flutter/provider/HospitalProvider.dart';
import 'package:projet_flutter/provider/MedicamentProvider.dart';
import 'package:projet_flutter/provider/PharmacyProvider.dart';
import 'package:projet_flutter/screens/Home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataClass(),
        ),
        ChangeNotifierProvider(create: (context) => CampaignProvider()),
        ChangeNotifierProvider(create: (context) => DoctorProvider()),
        ChangeNotifierProvider(create: (context) => HospitalProvider()),
        ChangeNotifierProvider(create: (context) => MedicamentProvider()),
        ChangeNotifierProvider(create: (context) => PharmacyProvider())
      ],
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            top: true,
            child: SafeArea(child:Home()),
          ),
        );
      },
    );
  }
}

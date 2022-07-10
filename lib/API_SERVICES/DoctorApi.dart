import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projet_flutter/CONSTANTS/CONFIG.dart';
import 'package:projet_flutter/classes/HospitalModel.dart';

import '../classes/DoctorClass.dart';

class DoctorApi {
  static var client = http.Client();

  static Future<List<Doctor>?> getDoctor() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJWTlhTbHJCS1NlTmQxdlhxVEY1M0FiSHJPQVYyIiwiaWF0IjoxNjU0MjAxMzQxfQ.w-YcokPb426pO31iJ-eHh--1lm6bouAdzG3lEEbO9i0";

    var response = await client.get(Uri.parse(DOCTORURL), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    });
    print("sdffffffffffffffffffffffffffffffffffffffffffffffffffffffffs");
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data["message"]);
      return doctorFromJson(data["message"]);

    } else {
      return null;
    }
  }

}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projet_flutter/CONSTANTS/CONFIG.dart';
import 'package:projet_flutter/classes/HospitalModel.dart';
import 'package:projet_flutter/function/getCoordonates.dart';

import '../classes/Coordonate.dart';

class HospitalApi {
  static var client = http.Client();

  static Future<List<HospitalModel>?> getHospital(lat,long) async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJWTlhTbHJCS1NlTmQxdlhxVEY1M0FiSHJPQVYyIiwiaWF0IjoxNjU0MjAxMzQxfQ.w-YcokPb426pO31iJ-eHh--1lm6bouAdzG3lEEbO9i0";

    var response = await client.get(Uri.parse(HOSPITALURL), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    });

    if (response.statusCode == 200) {

      var data = jsonDecode(response.body);
       return HospitalFromJson(data["message"],lat,long);

    } else {
      return null;
    }
  }

}

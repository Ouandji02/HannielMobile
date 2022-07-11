import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projet_flutter/CONSTANTS/CONFIG.dart';
import 'package:projet_flutter/classes/PharmacyModel.dart';

class PharmacyApi {
  static var client = http.Client();

  static  List? listPharmacy;

  static Future<List<PharmacyModel>?> getPharmacy(lat,long) async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJWTlhTbHJCS1NlTmQxdlhxVEY1M0FiSHJPQVYyIiwiaWF0IjoxNjU0MjAxMzQxfQ.w-YcokPb426pO31iJ-eHh--1lm6bouAdzG3lEEbO9i0";

    var response = await client.get(Uri.parse(PHARMACYURL), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      try{
        var data = jsonDecode(response.body);
        return pharmacyFromJson(data["message"],lat,long);
      }catch(e){
        print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr $e");
      }
    } else {
      return null;
    }
  }
}

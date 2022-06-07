import 'package:projet_flutter/classes/UserClass.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_flutter/CONSTANTS/CONFIG.dart';

class userApi {
  static var client = http.Client();
  Future getUser() async {
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJWTlhTbHJCS1NlTmQxdlhxVEY1M0FiSHJPQVYyIiwiaWF0IjoxNjU0MjAxMzQxfQ.w-YcokPb426pO31iJ-eHh--1lm6bouAdzG3lEEbO9i0";

    var response = await client.get(Uri.parse(UPDATEUSERURL), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    });

    if (response.statusCode == 200 && response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data);
      return User.fromJson(data);
    } else {
      return null;
    }
  }
}

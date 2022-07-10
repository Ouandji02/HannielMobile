import 'package:projet_flutter/classes/UserClass.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_flutter/CONSTANTS/CONFIG.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  static var client = http.Client();
  static Future<User?> getOneUser(id,token) async {
   /* String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJWTlhTbHJCS1NlTmQxdlhxVEY1M0FiSHJPQVYyIiwiaWF0IjoxNjU0MjAxMzQxfQ.w-YcokPb426pO31iJ-eHh--1lm6bouAdzG3lEEbO9i0";
*/
    var response = await client.get(Uri.parse(GETUSERURL+id), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token"
    });
    print(GETUSERURL+id);
    print(token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("dsffffffffffffffffffffffffffffffffffffffffffsssssUSERAPI");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user", response.body.toString());
      var data = jsonDecode(response.body);
      print(data);
      return User.fromJson(data);
    } else {
      return null;
    }
  }
}

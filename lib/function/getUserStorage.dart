import 'dart:convert';

import 'package:projet_flutter/classes/UserClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User?> getUserStorage() async {
  print("sdffffffffffffffhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("user") != null) {
    var userP = jsonDecode(prefs.getString("user")!);
    print("fbgbgbgbbbb${userP["message"]}");
    return  User.fromJson(userP["message"]);
  }
  return null;
}
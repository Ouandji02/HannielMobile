import 'dart:convert';

import 'package:projet_flutter/classes/UserClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User?> getUserStorage() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("user") != null) {print("sdffffffffffffffhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    var userP = jsonDecode(prefs.getString("user")!);
    var intf = User.fromJson(userP["message"]);
    print("fbgbgbgbbbbkkkkkkkkkkkkkkkkkkkkkkkkkk");
    return  User.fromJson(userP["message"]);
  }
  return null;
}
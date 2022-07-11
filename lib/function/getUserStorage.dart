import 'dart:convert';

import 'package:projet_flutter/classes/UserClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User?> getUserStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("user") != null) {
    try{
      var userP = jsonDecode(prefs.getString("user")!);
      return User.fromJson(userP["message"]);
    }catch(e){
      print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrreree $e");
    }
    
  }
  return null;
}

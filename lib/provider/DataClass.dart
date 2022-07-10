import 'package:flutter/material.dart';
import 'package:projet_flutter/API_SERVICES/userApi.dart';
import 'package:projet_flutter/classes/UserClass.dart';
import 'package:projet_flutter/function/getUserStorage.dart';

class DataClass extends ChangeNotifier{
  User? user;
  getUserData() async{
    print("providerrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    user = (await getUserStorage())!;

    notifyListeners();
  }
}
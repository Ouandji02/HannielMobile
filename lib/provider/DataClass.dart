import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:projet_flutter/API_SERVICES/userApi.dart';
import 'package:projet_flutter/classes/UserClass.dart';
import 'package:projet_flutter/function/getUserStorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataClass extends ChangeNotifier{
  User? user;
  double? lat;
  double? long;

  getUserData() async{
    print("providerrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    user = (await getUserStorage())!;

    notifyListeners();
  }

  getCoordonate() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    lat = _locationData.latitude;
    long = _locationData.longitude;
    var t = {_locationData.longitude, _locationData.latitude};

  }
}
import 'dart:math';

import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../classes/Coordonate.dart';

Future<Coordonate?> getCoordonate() async {
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

  var t = {_locationData.longitude, _locationData.latitude};
  Coordonate? pos;
  pos?.latitude = _locationData.latitude;
  pos?.longitude = _locationData.longitude;
  return pos;
}

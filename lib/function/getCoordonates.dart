import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

void getCoordonate() async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  _locationData = await location.getLocation();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  if(_locationData != null ){
    await prefs.setDouble('longitude',  _locationData.longitude!);
    await prefs.setDouble('latitude', _locationData.latitude!);
  }

  print("coordinatesssssssssssssssssssssssssss ${_locationData.longitude}");

}

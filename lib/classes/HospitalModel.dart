import 'package:flutter/material.dart';
import 'package:projet_flutter/provider/DataClass.dart';
import 'package:provider/provider.dart';

import '../function/getDistanceBetweenTwoLocation.dart';

List<HospitalModel> HospitalFromJson(dynamic str,double lat,double long) =>
    List<HospitalModel>.from(
        (str).map((x) => HospitalModel.fromJson(x,lat,long)));

class HospitalModel {
  late String? nom;
  late String? longitude;
  late String? latitude;
  late String? logo;
  late String? description;
  late String? phone;
  late String? email;
  late String? id;
  late String? bd;
  late double? distance;
  HospitalModel(
      {this.nom,
      this.longitude,
      this.description,
      this.email,
      this.latitude,
      this.logo,
      this.phone,
      this.id,
      this.bd, this.distance});

  HospitalModel.fromJson(Map<String, dynamic> json,double lat,double long) {
    nom = json["name"].toLowerCase();
    longitude = json["longitude"].toLowerCase();
    latitude = json["latitude"].toLowerCase();
    logo = json["logo"];
    description = json["description"].toLowerCase();
    phone = json["phone"].toLowerCase();
    email = json["email"].toLowerCase();
    id = json["id"].toLowerCase();
    bd = json["bp"].toLowerCase();
    distance = calculateDistance(double.parse(json["latitude"]),double.parse(json["longitude"]),lat,long);
  }

}

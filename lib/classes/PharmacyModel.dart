import '../function/getDistanceBetweenTwoLocation.dart';

List<PharmacyModel> pharmacyFromJson(dynamic str, lat, long) =>
    List<PharmacyModel>.from(
        (str).map((x) => PharmacyModel.fromJson(x, lat, long)));

class PharmacyModel {
  late String? nom;
  late String? longitude;
  late String? latitude;
  late String? logo;
  late String? description;
  late String? phone;
  late String? email;
  late String? id;
  late double? distance;

  PharmacyModel(
      {this.nom,
      this.longitude,
      this.description,
      this.email,
      this.latitude,
      this.logo,
      this.phone,
      this.id,
      this.distance});

  PharmacyModel.fromJson(Map<String, dynamic> json, lat, long) {
    nom = json["name"].toLowerCase();
    longitude = json["longitude"];
    latitude = json["latitude"];
    logo = json["logo"];
    description = json["description"];
    phone = json["phone"];
    email = json["email"];
    id = json["id"];
    distance = calculateDistance(double.parse(json["latitude"]),
        double.parse(json["longitude"]), lat, long);
  }
}

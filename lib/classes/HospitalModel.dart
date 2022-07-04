List<HospitalModel> HospitalFromJson(dynamic str) =>
    List<HospitalModel>.from((str).map((x) => HospitalModel.fromJson(x)));

class HospitalModel {
  late String? nom;
  late String? longitude;
  late String? latitude;
  late String? logo;
  late String? description;
  late String? phone;
  late String? email;
  late String? id;

  HospitalModel(
      {this.nom,
      this.longitude,
      this.description,
      this.email,
      this.latitude,
      this.logo,
      this.phone,
      this.id});

  HospitalModel.fromJson(Map<String, dynamic> json) {
    nom = json["name"];
    longitude = json["longitude"];
    latitude = json["latitude"];
    logo = json["logo"];
    description = json["description"];
    phone = json["phone"];
    email = json["email"];
    id = json["id"];
  }
}

List<PharmacyModel> pharmacyFromJson(dynamic str) =>
    List<PharmacyModel>.from(str.map((x) => PharmacyModel.fromJson(x)));

class PharmacyModel {
  late String? nom;
  late double? long;
  late double? lat;
  late String? logo;
  late String? description;
  late String? tel;
  late String? email;

  PharmacyModel(
      {this.nom,
      this.long,
      this.description,
      this.email,
      this.lat,
      this.logo,
      this.tel});

  PharmacyModel.fromJson(Map<String, dynamic> json) {
    nom = json["name"];
    long = json["long"];
    lat = json["lat"];
    logo = json["logo"];
    description = json["description"];
    tel = json["tel"];
    email = json["email"];
  }
}

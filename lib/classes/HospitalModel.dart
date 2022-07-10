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
  late String? bd;

  HospitalModel(
      {this.nom,
      this.longitude,
      this.description,
      this.email,
      this.latitude,
      this.logo,
      this.phone,
      this.id,
      this.bd});

  HospitalModel.fromJson(Map<String, dynamic> json) {
    nom = json["name"].toLowerCase();
    longitude = json["longitude"].toLowerCase();
    latitude = json["latitude"].toLowerCase();
    logo = "null";
    description = json["description"].toLowerCase();
    phone = json["phone"].toLowerCase();
    email = json["email"].toLowerCase();
    id = json["id"].toLowerCase();
    bd = json["bp"].toLowerCase();
  }
}

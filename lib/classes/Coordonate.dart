class Coordonate {
  double? longitude;
  double? latitude;

  Coordonate({required longitude, required latitude});

  fromJson(Map<String, double?> json) {
    longitude = json["long"];
    latitude = json["lat"];
  }
}

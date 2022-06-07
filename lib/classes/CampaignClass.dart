List<CampaignModel> campaignFromJson(dynamic str) =>
    List<CampaignModel>.from((str).map((x) => CampaignModel.fromJson(x)));
class CampaignModel {
  late String nom;
  late String date_deb;
  late String date_fin;
  late String responsabe;
  late String image;
  late String hour;
  late String description;
  late String hospitalId;
  late String id;

  CampaignModel(
      {required this.nom,
      required this.date_deb,
      required this.date_fin,
      required this.responsabe,
      required this.description,
      required this.hour,
      required this.hospitalId,
      required this.id,
      required this.image});

  CampaignModel.fromJson(Map<String, dynamic> json) {
    nom = json["name"];
    hospitalId = json["hospitalId"];
    hour = json["hour"];
    image = json["image"];
    description = json["description"];
    responsabe = json["responsabe"];
    id = json["id"];
    date_deb = json["date_deb"];
    date_fin = json["date_fin"];
  }
}

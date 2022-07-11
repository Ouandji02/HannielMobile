List<CampaignModel> campaignFromJson(dynamic str) =>
    List<CampaignModel>.from((str).map((x) => CampaignModel.fromJson(x)));
class CampaignModel {
  late String nom;
  late String date_deb;
  late String date_fin;
  late String responsable;
  late String image;
  late String hour;
  late String description;
  late String hospitalId;
  late String id;

  CampaignModel(
      {required this.nom,
      required this.date_deb,
      required this.date_fin,
      required this.responsable,
      required this.description,
      required this.hour,
      required this.hospitalId,
      required this.id,
      required this.image});

  CampaignModel.fromJson(Map<String, dynamic> json) {
    nom = "Campagne de vaccination";
    hospitalId = json["hospitalId"].toString();
    hour = json["hour"].toString();
    image = "image";
    description = json["description"].toString();
    responsable = "responsabe";
    id = json["id"].toString();
    date_deb = json["dateBegin"].toString();
    date_fin = json["dateEnd"].toString();
  }
}

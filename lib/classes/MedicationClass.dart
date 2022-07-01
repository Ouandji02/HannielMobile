List<MedicationModel> medicationFromJson(dynamic str) =>
    List<MedicationModel>.from((str).map((x) => MedicationModel.fromJson(x)));
class MedicationModel {
  late String? nom;
  late String? dose;
  late String? laboratoire;
  late bool? statut;
  late int? prix;
  late String? pharmacyUid;
  late String? id;
  MedicationModel(
      { this.nom,
       this.dose,
       this.laboratoire,
       this.statut,
       this.prix,
       this.pharmacyUid,
       this.id});

  MedicationModel.fromJson(Map<String, dynamic> json) {
    nom = json["name"];
    dose = json["dose"];
    laboratoire = json["lab"];
    statut = json["statut"];
    prix = json["price"];
    pharmacyUid = json["pharmacyUid"];
    id = json["id"];
  }
}

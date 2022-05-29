class Campaign {
  String nom;
  String date_deb;
  String date_fin;
  String responsabe;
  String image = "";
  String titre;
  String description;

  Campaign(
      {required this.nom,
      required this.date_deb,
      required this.date_fin,
      required this.responsabe,
      required this.description,
      required this.titre});
}

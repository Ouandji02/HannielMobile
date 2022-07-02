class User {
  late String nom;
  late String prenom;
  late String photo;
  late String dateNaissance;
  late String email;
  late String tel;
  late int poids;
  late String grpe_sanguin;
  late int taille;
  late String sexe;

  User(
      {required this.nom,
      required this.prenom,
      required this.photo,
      required this.dateNaissance,
      required this.email,
      required this.tel,
      required this.poids,
      required this.grpe_sanguin,
      required this.taille,
      required this.sexe});

  User.fromJson(Map<String, dynamic> json) {
    nom = json["name"];
    prenom = json["prenom"];
    photo = json["photo"];
    dateNaissance = json["dateNaissance"];
    poids = json["poids"];
    tel = json["tel"];
    email = json["email"];
    grpe_sanguin = json["grpe_sanguin"];
    taille = json["taille"];
    sexe = json["sexe"];
  }
}

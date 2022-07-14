List<User> userFromJson(dynamic str) =>
    List<User>.from((str).map((x) => User.fromJson(x)));

class User {
  late String nom;
  late String prenom;
  late String photo;
  late String dateNaissance;
  late String email;
  late String tel;
  late String poids;
  late String grpe_sanguin;
  late String taille;
  late String sexe;
  late String? image;

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
      required this.sexe,
      required this.image});

  User.fromJson(Map<String, dynamic> json) {
    nom = json["name"]??'';
    prenom = json["surname"]??'';
    photo = json["image"]??'';
    dateNaissance = json["dateNaissance"]??'';
    poids = json["poids"]??'';
    tel = json["phone"]??'';
    email = json["email"]??'';
    grpe_sanguin = json["grpe_sanguin"]??'';
    taille = json["taille"];
    sexe = json["sexe"]??'';
    image = json["image"]??'';
  }
}

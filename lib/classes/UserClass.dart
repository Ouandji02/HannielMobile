class User {
  final String nom;
  final String prenom;
  final String photo;
  final String dateNaissance;
  final String email;
  final String tel;
  final int poids;
  final String grpe_sanguin;
  final int taille;

  User(
      {required this.nom,
      required this.prenom,
      required this.photo,
      required this.dateNaissance,
      required this.email,
      required this.tel,
      required this.poids,
      required this.grpe_sanguin,
      required this.taille});
}

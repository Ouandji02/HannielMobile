List<Doctor> doctorFromJson(dynamic str) =>
    List<Doctor>.from((str).map((x) => Doctor.fromJson(x)));
class Doctor{
  late String nom;
  late String prenom;
  late String photo;
  late String dateNaissance;
  late String email;
  late String tel;
  late int poids;
  late String grpe_sanguin;
  late int taille;
  late String description;
  late String grade;
  late String specialite;
  late double experience;
  Doctor({
    required this.nom,
    required this.prenom,
    required this.photo,
    required this.dateNaissance,
    required this.email,
    required this.tel,
    required this.poids,
    required this.grpe_sanguin,
    required this.taille,
    required this.description,
    required this.grade,
    required this.experience,
    required this.specialite
});
 Doctor.fromJson(Map<String, dynamic> json) {
    nom = json["name"].toLowerCase();
    prenom = json["prenom"].toLowerCase();
    dateNaissance = json["dateNaissance"].toLowerCase();
    photo = "null";
    description = json["description"].toLowerCase();
    tel = json["phone"].toLowerCase();
    email = json["email"].toLowerCase();
    poids = json["poids"].toLowerCase();
    grpe_sanguin = json["grpe_sanguin"].toLowerCase();
    taille = json["taille"].toLowerCase();
    grade = json["grade"].toLowerCase();
    specialite = json["specialite"].toLowerCase();
    experience = json["experience"].toLowerCase();


 }
}
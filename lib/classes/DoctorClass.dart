List<Doctor> doctorFromJson(dynamic str) =>
    List<Doctor>.from((str).map((x) => Doctor.fromJson(x)));
class Doctor{
  late String nom;
  late String photo;
  late String dateNaissance;
  late String email;
  late String tel;
  late String sexe;
  late String description;
  late String grade;
  late String dateBegin;
  late String hospitalId;
  late String id;
  Doctor({
    required this.nom,
    required this.photo,
    required this.dateNaissance,
    required this.email,
    required this.tel,
    required this.description,
    required this.grade,
    required this.id,
    required this.sexe,
    required this.dateBegin,
    required this.hospitalId
});
 Doctor.fromJson(Map<String, dynamic> json) {
    nom = json["name"];
    dateNaissance = json["dateNaiss"].toLowerCase();
    photo = json["logo"];
    description = json["description"].toLowerCase();
    tel = json["numero"].toString();
    email = json["email"].toLowerCase();
    grade = json["specialite"].toLowerCase();
    hospitalId = json["hospitalId"].toString();
    dateBegin = json["dateBegin"].toString();
    sexe = json["sexe"].toLowerCase();
    id= json["id"];
 }
}
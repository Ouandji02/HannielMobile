import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/classes/DoctorClass.dart';
import 'package:projet_flutter/provider/DataClass.dart';
import 'package:projet_flutter/screens/pharmacy/DetailPharmacy.dart';
import 'package:projet_flutter/screens/pharmacy/pharmacyHome.dart';
import 'package:provider/provider.dart';

import '../../API_SERVICES/pharmacyApi.dart';
import '../../CONSTANTS/color.dart';
import '../../classes/PharmacyModel.dart';
import '../../widgets/ErrorPage.dart';
import '../doctor/DetailDoctor.dart';
import '../pharmacy/ListPharmacy.dart';
import '../pharmacy/Pharmacy.dart';

class Dashboard1 extends StatefulWidget {
  @override
  _Dashboard createState() {
    // TODO: implement createState
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard1> {
  final doctors = [
    Doctor(
        nom: "simo",
        prenom: "Larissa",
        photo: "assets/images/doctor.png",
        dateNaissance: "dateNaissance",
        email: "simo@gmail.com",
        tel: "699665914",
        poids: 60,
        grpe_sanguin: "A+",
        taille: 160,
        description:
            "Docteur simo est une terapeute avec 5 ans d'experience.Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum sunt maxime blanditiis possimus tenetur, voluptate tempora ad iusto assumenda laudantium.",
        grade: "A",
        experience: 5,
        specialite: "dentiste"),
    Doctor(
        nom: "simo1",
        prenom: "Larissa",
        photo: "assets/images/doctor.png",
        dateNaissance: "dateNaissance",
        email: "simo@gmail.com",
        tel: "699665914",
        poids: 60,
        grpe_sanguin: "A+",
        taille: 160,
        description:
            "Docteur simo est une terapeute avec 5 ans d'experience.Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum sunt maxime blanditiis possimus tenetur, voluptate tempora ad iusto assumenda laudantium.",
        grade: "A",
        experience: 5,
        specialite: "specialite"),
    Doctor(
        nom: "simo2",
        prenom: "Larissa",
        photo: "assets/images/doctor.png",
        dateNaissance: "dateNaissance",
        email: "simo@gmail.com",
        tel: "699665914",
        poids: 60,
        grpe_sanguin: "A+",
        taille: 160,
        description:
            "Docteur simo est une terapeute avec 5 ans d'experience.Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum sunt maxime blanditiis possimus tenetur, voluptate tempora ad iusto assumenda laudantium.",
        grade: "A",
        experience: 5,
        specialite: "specialite"),
    Doctor(
        nom: "simo3",
        prenom: "Larissa",
        photo: "assets/images/doctor.png",
        dateNaissance: "dateNaissance",
        email: "simo@gmail.com",
        tel: "699665914",
        poids: 60,
        grpe_sanguin: "A+",
        taille: 160,
        description: "description",
        grade: "A",
        experience: 5,
        specialite: "specialite"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screen = MediaQuery.of(context).size;
    final coordonate = Provider.of<DataClass>(context);
    final user = Provider.of<DataClass>(context);
    print("sdffffffffff ${user.lat}");
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        padding: EdgeInsets.all(20),
        height: screen.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(image: AssetImage("assets/images/hello.png")),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "salut ${user.user?.nom ?? ""}",
                      style:
                          TextStyle(color: HexColor(COLOR_TITLE), fontSize: 15),
                    ),
                    Text(
                      "Comment tu vas aujourd'hui?",
                      style: TextStyle(
                          color: HexColor(COLOR_SUBTITLE_MESSAGE),
                          fontSize: 15),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Pharmacies",
                style: TextStyle(
                    color: HexColor(COLOR_TITLE),
                    fontWeight: FontWeight.w400,
                    fontSize: 22)),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 265,
              child: FutureBuilder(
                future: PharmacyApi.getPharmacy(coordonate.lat,coordonate.long),
                builder: (BuildContext context,
                    AsyncSnapshot<List<PharmacyModel>?> snapshot) {
                  if (snapshot.hasError) {
                    return page404Error(context, Pharmacy());
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          snapshot.data!.sort((a,b)=> (a.distance!).compareTo(b.distance!));
                          return pharmacyHome(context, snapshot.data, index);
                        },
                        itemCount: snapshot.data!.length);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: HexColor(COLOR_PRIMARY),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Docteurs",
                style: TextStyle(
                    color: HexColor(COLOR_TITLE),
                    fontWeight: FontWeight.w400,
                    fontSize: 22)),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDoctor(
                                    prenom: doctors[index].prenom,
                                    desc: doctors[index].description,
                                    nom: doctors[index].nom,
                                    image: doctors[index].photo,
                                    specialite: doctors[index].specialite,
                                  ))),
                      child: Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  foregroundImage:
                                      AssetImage(doctors[index].photo),
                                  backgroundColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  doctors[index].nom + doctors[index].prenom,
                                  style: TextStyle(
                                      color: HexColor(COLOR_TITLE),
                                      fontSize: screen.width / 20),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  doctors[index].prenom,
                                  style: TextStyle(
                                      color: HexColor(COLOR_SUBTITLE_MESSAGE)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  doctors[index].specialite,
                                  style: TextStyle(
                                      color: HexColor(COLOR_SUBTITLE_MESSAGE)),
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../CONSTANTS/color.dart';
import 'DetailDoctor.dart';

class DoctorWidget extends StatelessWidget {
  late var doctors;
  int? index;

  DoctorWidget({required this.doctors, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: size.height * .02),
            child: ListTile(
              title: Text(doctors[index].nom,
                  style: TextStyle(
                    color: HexColor(COLOR_TITLE),
                    fontWeight: FontWeight.bold,
                  )),
              subtitle: Container(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  children: [
                    Text('Specialite : ' + doctors[index].grade),
                  ],
                ),
              ),
              trailing: Container(
                margin: EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Icon(
                      Icons.star,
                      color: HexColor(COLOR_PRIMARY),
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(color: HexColor(COLOR_PRIMARY)),
                    )
                  ],
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(doctors[index].photo),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailDoctor(
                            desc: doctors[index].description,
                            nom: doctors[index].nom,
                            image: doctors[index].photo,
                            dateDeb: doctors[index].dateBegin,
                            phone: doctors[index].tel,
                            specialite: doctors[index].grade,
                            email: doctors[index].email,
                          ))),
            ),
          ),
        ],
      ),
    );
  }
}

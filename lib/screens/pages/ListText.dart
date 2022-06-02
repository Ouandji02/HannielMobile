import 'package:flutter/material.dart';
import '../../widgets/CardPatient.dart';

class ListText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) {
                return CardPatient(size, 1);
              },
              itemCount: 4,
            ),
          )),
    );
  }
}
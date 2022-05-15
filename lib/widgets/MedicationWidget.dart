import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class MedicamentWidget extends StatelessWidget {
  const MedicamentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 2,
      child: Container(
        width: width,
        padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: HexColor('001B2E'),
            border:
                Border(left: BorderSide(color: Colors.blueAccent, width: 6))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              "Efferalgan 200mg Sirop | 200 XAF",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("pharmacie Nectar",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w400)),
                Icon(Icons.arrow_right, color: Colors.white)
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text("3km",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

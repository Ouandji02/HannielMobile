import 'package:flutter/material.dart';

Widget pharmacyWidget(img, namePharmacy, nameHost, numberStar) {
  return Row(
    children: [
      const Image(
        image: NetworkImage('ddddd'),
      ),
      Column(
        children: [
          Text('Pharmacie $namePharmacy'),
          Text('Gerant:$nameHost'),
          Text('Service:$numberStar'),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FlatButton(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 5),
                  onPressed: () {},
                  color: const Color(0xff008ED6),
                  child: Row(
                    children: const [
                      Icon(Icons.location_city),
                      Text(
                        "VOIR LA CARTE",
                        style: TextStyle(
                          color: Color(0xff008ED6),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      )
    ],
  );
}

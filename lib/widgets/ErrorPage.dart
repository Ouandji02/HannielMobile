import 'package:flutter/material.dart';

Widget page404Error(context, Widget page) {
  return Container(
    padding: EdgeInsets.only(left: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text(
            'Oops,une erreur est survenue',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        Row(
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                    "Mais ne vous inquietez pas, ce n'est pas de\n votre faute")),
          ],
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (a, b, c) => page,
                      transitionDuration: Duration(seconds: 0)),
                );
              },
              child: Text('reessayer'),
            )
          ],
        )
      ],
    ),
  );
}

Widget errorNoHasData(context, Widget page) {
  return Container(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.do_not_disturb,
              size: 40,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            child: Text(
              'Pas de donnees encore disponibles',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => page));
                },
                child: Text(
                  'Reessayer',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ));
}

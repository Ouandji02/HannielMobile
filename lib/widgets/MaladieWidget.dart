import 'package:flutter/material.dart';

Widget MaladieWidget() {
  return Container(
    margin: EdgeInsets.only(top: 10, right: 10, bottom: 10),
    padding: EdgeInsets.all(5),
    width: 100,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: Colors.blueAccent, width: 1, style: BorderStyle.solid),
        boxShadow: []),
    child: Row(
      children: [Icon(Icons.format_color_fill), Text('Fievre')],
    ),
  );
}

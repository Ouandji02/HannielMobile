import 'package:flutter/material.dart';


class MedicamentWidget extends StatelessWidget {
  const MedicamentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
        child: SizedBox(
      height: 200,
      width: (width / 2) - 10,
      child: Column(
        children: const [
          Text("Ibuprofen"),
          Text("Pharmacy"),
          Text("price"),
          TextButton(onPressed: null, child: Text("Detail"))
        ],
      ),
    ));
  }
}

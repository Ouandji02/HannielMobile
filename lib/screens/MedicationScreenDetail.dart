import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MedicamentScreenDetail extends StatefulWidget {
  const MedicamentScreenDetail({Key? key}) : super(key: key);

  @override
  _MedicamentScreenDetailState createState() => _MedicamentScreenDetailState();
}

class _MedicamentScreenDetailState extends State<MedicamentScreenDetail> {
  int selectedIndex = 0;
  String dropdownValue = 'Mode de transport';

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff008ED6),
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        elevation: 0,
        toolbarHeight: heightScreen / 10,
        title: const Text(
          'Detail medicament',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: heightScreen - (heightScreen / 10),
        width: widthScreen,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: const BoxDecoration(
            color: Color(0xFFF0F2F8),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Ibuprofen",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text("Tablets",
                        style:
                            TextStyle(fontSize: 20, color: Color(0x2D000000))),
                    Text(
                      "200 XAF",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ]),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Tablets",
                          style: TextStyle(
                              fontSize: 20, color: Color(0x2D000000))),
                      Text(
                        "Ibuprofen",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Tablets",
                          style: TextStyle(
                              fontSize: 20, color: Color(0x2D000000))),
                      Text(
                        "Ibuprofen",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Tablets",
                          style: TextStyle(
                              fontSize: 20, color: Color(0x2D000000))),
                      Text(
                        "Ibuprofen",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Tablets",
                          style: TextStyle(
                              fontSize: 20, color: Color(0x2D000000))),
                      Text(
                        "Ibuprofen",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                "Pharmacy Nectar",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: const Color(0xff008ED6),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['Bicycle', 'cross', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

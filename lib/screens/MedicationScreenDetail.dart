import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
      backgroundColor: HexColor('0061A4'),
      appBar: AppBar(
        backgroundColor: HexColor('0061A4'),
        leading: const Icon(Icons.arrow_back),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Detail medicament',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: heightScreen,
        width: widthScreen,
        child: SingleChildScrollView(
          child: Container(
            height: heightScreen,
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Ibuprofen",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text("Tablets",
                          style: TextStyle(
                              fontSize: 15, color: Color(0x2D000000))),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "200 XAF",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      )
                    ]),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Dosage from",
                            style: TextStyle(
                                fontSize: 15, color: Color(0x2D000000))),
                        Text(
                          "Marsella",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Active subste",
                            style: TextStyle(
                                fontSize: 15, color: Color(0x2D000000))),
                        Text(
                          "Yesss",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Dosage",
                            style: TextStyle(
                                fontSize: 15, color: Color(0x2D000000))),
                        Text(
                          "0.2g",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Manufacturer",
                            style: TextStyle(
                                fontSize: 15, color: Color(0x2D000000))),
                        Text(
                          "Laborex",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: Column(
                  children: const [
                    Text(
                      "Pharmacy Nectar",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextButton(
                      onPressed: null,
                      child: Text("Itinénaire"),
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

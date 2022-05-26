import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../CONSTANTS/color.dart';

class Medication extends StatefulWidget {
  const Medication({Key? key}) : super(key: key);

  @override
  _Medication createState() {
    return _Medication();
  }
}

class _Medication extends State<Medication> {
  bool showSpinner = false;

  void _determinePosition() async {
    setState(() {
      showSpinner = true;
    });
    Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Uri url = Uri.parse(
        "https://www.google.com/maps/dir/?api=1&origin=${pos.latitude},${pos.longitude}&destination=5.4471192,10.0581761&travelmode=driving");
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      print("impossible de lancer l'url, vous devez intallez google Maps");
    } else {
      setState(() {
        showSpinner = false;
      });
    }
  }

  Future<void> _openNavigation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        null;
      } else {
        _determinePosition();
      }
    } else {
      _determinePosition();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              color: HexColor(COLOR_PRIMARY),
              size: 30,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Medicaments",
            style: TextStyle(color: HexColor(COLOR_TITLE)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                null;
              },
              child: Icon(
                Icons.search,
                color: HexColor(COLOR_PRIMARY),
              ),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, i) {
                        return Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Chip(
                              backgroundColor: HexColor(COLOR_SECONDARY),
                              avatar: Image(
                                image: i % 2 == 0
                                    ? AssetImage(
                                        "assets/images/icons8-syrup-28.png")
                                    : AssetImage(
                                        "assets/images/icons8-pills-28.png"),
                              ),
                              label: Text(
                                "Sirop",
                                style: TextStyle(color: Colors.white),
                              ),
                              padding: EdgeInsets.all(5),
                            ));
                      }),
                ),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 20,
                      itemBuilder: (context, i) {
                        return Container(
                            margin: EdgeInsets.only(right: 10, left: 10),
                            child: Card(
                              color: HexColor(COLOR_CARD),
                              elevation: 0,
                              child: ListTile(
                                  leading: i % 2 == 0
                                      ? Image(
                                          image: AssetImage(
                                              "assets/images/icons8-syrup-28.png"))
                                      : Image(
                                          image: AssetImage(
                                              "assets/images/icons8-pills-28.png")),
                                  contentPadding: EdgeInsets.all(10),
                                  title: Text(
                                    "Paracétamol 500mg | 200 XAF",
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: HexColor(COLOR_PRIMARY),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Phamarcie Menoua",
                                        style: TextStyle(
                                            color: HexColor(COLOR_PRIMARY)
                                                .withOpacity(.6)),
                                      ),
                                      Text(
                                        "3km environ",
                                        style: TextStyle(
                                            color: HexColor(COLOR_MESSAGE_SEND)
                                                .withOpacity(.6),
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  trailing: showSpinner
                                      ? CircularProgressIndicator(
                                          color: HexColor(COLOR_PRIMARY),
                                          strokeWidth: 1,
                                        )
                                      : InkWell(
                                          onTap: () {
                                            _openNavigation();
                                          },
                                          child: Icon(
                                            Icons.arrow_right_rounded,
                                            size: 30,
                                            color: HexColor(COLOR_SECONDARY),
                                          ),
                                        )),
                            ));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}

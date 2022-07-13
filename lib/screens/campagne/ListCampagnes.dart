import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:projet_flutter/API_SERVICES/campaignApi.dart';
import 'package:projet_flutter/CONSTANTS/style.dart';
import 'package:projet_flutter/classes/CampaignClass.dart';
import 'package:projet_flutter/provider/CampaignProvider.dart';
import 'package:projet_flutter/screens/campagne/DetailCampagne.dart';
import 'package:projet_flutter/screens/campagne/ListCampagne.dart';
import 'package:projet_flutter/screens/doctor/DetailDoctor.dart';
import 'package:projet_flutter/widgets/AppBar.dart';
import 'package:projet_flutter/widgets/Drawer.dart';
import 'package:provider/provider.dart';
import '../../CONSTANTS/color.dart';
import '../../classes/DoctorClass.dart';
import '../../provider/HospitalProvider.dart';
import '../../widgets/ErrorPage.dart';
import '../Home.dart';
import '../doctor/ListDoctors.dart';
import 'Campagne.dart';

class ListCampagnes extends StatefulWidget {
  @override
  _ListCampagnes createState() {
    // TODO: implement createState
    return _ListCampagnes();
  }
}

class _ListCampagnes extends State<ListCampagnes> {
  String? search;

  @override
  Widget build(BuildContext context) {
    final campaignModel = Provider.of<CampaignProvider>(context, listen: false);
    campaignModel.getCampaign();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarItem("Campagnes"),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Container(
              width: size.width * .9,
              margin: EdgeInsets.only(top: 25),
              child: TextField(
                  style: TextStyle(
                      fontSize: 16.0, height: .2, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    fillColor: Colors.black.withOpacity(.1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                    hintText: 'Rechercher campagne',
                  ),
                  onChanged: (text) => {
                        if (text != null) {setState(() => search = text)}
                      }),
            ),
            Expanded(
                child: Container(
                    height: 170,
                    child: FutureBuilder(
                      builder: (context,
                          AsyncSnapshot<List<CampaignModel?>?> snapshot) {
                        if (snapshot.hasError) {
                          return page404Error(context, ListCampagnes());
                        }
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemBuilder: (context, index) {
                                return search != null
                                    ? (filter(snapshot.data, search)?.length ==
                                            0)
                                        ? Container(
                                            height: size.height * .6,
                                            child: const Center(
                                              child: Text(
                                                "Aucun resultat",
                                                style: TextStyle(
                                                    color: Colors.black38,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          )
                                        : campagneWidget(
                                            context,
                                            filter(snapshot.data, search),
                                            index)
                                    : campagneWidget(
                                        context, snapshot.data, index);
                              },
                              itemCount: search != null
                                  ? (filter(snapshot.data, search)?.length == 0
                                      ? (filter(snapshot.data, search)
                                              ?.length)! +
                                          1
                                      : filter(snapshot.data, search)?.length)
                                  : snapshot.data!.length);
                          ;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: HexColor(COLOR_PRIMARY),
                            ),
                          );
                        }
                      },
                      future: CampaignApi.getCampaign(),
                    )))
          ],
        ),
      ),
    );
  }
}

List<CampaignModel?>? filter(List<CampaignModel?>? snapshot, search) {
  return snapshot
      ?.where((element) => (element?.nom)!.contains(search!.toLowerCase()))
      .toList();
}

import 'package:flutter/foundation.dart';
import 'package:projet_flutter/API_SERVICES/hospitalApi.dart';
import '../API_SERVICES/pharmacyApi.dart';
import '../classes/PharmacyModel.dart';

class PharmacyProvider extends ChangeNotifier {
  List<PharmacyModel?>? pharmacy;

  getPharmacy() async {
    //pharmacy = (await PharmacyApi.getPharmacy());
    notifyListeners();
  }
}

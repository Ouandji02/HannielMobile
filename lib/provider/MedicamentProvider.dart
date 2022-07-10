import 'package:flutter/foundation.dart';
import 'package:projet_flutter/API_SERVICES/hospitalApi.dart';
import '../API_SERVICES/campaignApi.dart';
import '../API_SERVICES/medicamentApi.dart';
import '../API_SERVICES/pharmacyApi.dart';
import '../classes/CampaignClass.dart';
import '../classes/MedicationClass.dart';
import '../classes/PharmacyModel.dart';

class MedicamentProvider extends ChangeNotifier{
  List<MedicationModel?>? medication;

  getMedication()async {
    medication = (await MedicamentApi.getMedication());
    notifyListeners();
  }
}
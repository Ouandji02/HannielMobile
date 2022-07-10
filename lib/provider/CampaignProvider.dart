import 'package:flutter/foundation.dart';
import 'package:projet_flutter/API_SERVICES/hospitalApi.dart';
import '../API_SERVICES/campaignApi.dart';
import '../API_SERVICES/pharmacyApi.dart';
import '../classes/CampaignClass.dart';
import '../classes/PharmacyModel.dart';

class CampaignProvider extends ChangeNotifier{
  List<CampaignModel>? campaign;

  getCampaign()async {
    campaign = (await CampaignApi.getCampaign());
    notifyListeners();
  }
}
import 'package:flutter/foundation.dart';
import 'package:projet_flutter/API_SERVICES/hospitalApi.dart';
import 'package:projet_flutter/classes/HospitalModel.dart';

class HospitalProvider extends ChangeNotifier{
  List<HospitalModel?>? hospital;

  getHospital()async {
    //hospital = (await HospitalApi.getHospital());
    notifyListeners();
  }
}
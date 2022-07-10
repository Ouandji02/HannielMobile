import 'package:flutter/foundation.dart';
import 'package:projet_flutter/API_SERVICES/hospitalApi.dart';
import '../API_SERVICES/DoctorApi.dart';
import '../classes/DoctorClass.dart';
import '../classes/PharmacyModel.dart';

class DoctorProvider extends ChangeNotifier{
  List<Doctor>? doctor;

  getDoctor()async {
    doctor = (await DoctorApi.getDoctor());
    notifyListeners();
  }
}
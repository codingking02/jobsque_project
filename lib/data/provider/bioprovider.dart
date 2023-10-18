import 'package:flutter/material.dart';

class BioProvider extends ChangeNotifier {
  String _bio = "";
  String get bio => _bio;

  String _address = "";
  String get address => _address;

  String _mobile = "";
  String get mobile => _mobile;

  void setbio(String bio) {
    _bio = bio;
    notifyListeners();
  }

  void setaddress(String address) {
    _address = address;
    notifyListeners();
  }

  void setmobile(String mobile) {
    _mobile = mobile;
    notifyListeners();
  }
}

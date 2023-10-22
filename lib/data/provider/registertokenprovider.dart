import 'package:flutter/material.dart';

class RegisterTokenProvider extends ChangeNotifier {
  String _registertoken = "";
  String get registertoken => _registertoken;
  void setregistertoken(String registertoken) {
    _registertoken = registertoken;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class AccountEmailProvider extends ChangeNotifier {
  String _accountemail = "";

  String get accountemail => _accountemail;

  void setaccountemail(String value) {
    _accountemail = value;
    notifyListeners();
  }
}

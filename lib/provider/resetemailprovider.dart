import 'package:flutter/material.dart';

class resetemailprovider extends ChangeNotifier {
  String _resetemail = "";

  String get resetemail => _resetemail;

  void setresetemail(String value) {
    _resetemail = value;
    notifyListeners();
  }
}

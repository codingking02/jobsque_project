import 'package:flutter/material.dart';

class Profilename extends ChangeNotifier {
  String _username = "";

  String get username => _username;

  void setname(String value) {
    _username = value;
    notifyListeners();
  }
}

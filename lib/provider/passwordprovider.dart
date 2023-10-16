import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  String _password = "";
  String get password => _password;
  void setpass(String accountpassword) {
    _password = accountpassword;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  String _otp = "";
  String get otp => _otp;

  void setotp(String otp) {
    _otp = otp;
    notifyListeners();
  }
}

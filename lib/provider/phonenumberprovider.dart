import 'package:flutter/material.dart';

class PhoneNumberProvider extends ChangeNotifier {
  String _unmaskedphonenumber = "";
  String get unmaskedphonenumber => _unmaskedphonenumber;
  String _maskedphonenumber = "";
  String get maskedphonenumber => _maskedphonenumber;
  void setunmaskednumber(String unmaskedphonenumber) {
    _unmaskedphonenumber = unmaskedphonenumber;
  }

  void setmaskednumber(String maskedphonenumber) {
    _maskedphonenumber = maskedphonenumber;
  }
}

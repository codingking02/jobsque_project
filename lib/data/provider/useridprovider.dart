import 'package:flutter/material.dart';

class UserIdProvider extends ChangeNotifier {
  int? _userid;
  int? get userid => _userid;
  void setuserid(int value) {
    _userid = value;
    notifyListeners();
  }
}

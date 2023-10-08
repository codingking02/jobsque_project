import 'package:flutter/material.dart';

class TokenProvider extends ChangeNotifier {
  String _token = "";
  String get token => _token;
  void settoken(String accounttoken) {
    _token = accounttoken;
  }
}

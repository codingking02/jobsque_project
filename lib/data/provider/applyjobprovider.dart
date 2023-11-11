import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ApplyJobProvider extends ChangeNotifier {
  String _name = '';
  String get name => _name;
  String _email = '';
  String get email => _email;
  String _phonenumber = '';
  String get phonenumber => _phonenumber;
  String _worktype = '';
  String get worktype => _worktype;
  PlatformFile? _pdffile;
  PlatformFile? get pdffile => _pdffile;

  void getapplybio(String name, String email, String phonenumber) {
    _name = name;
    _email = email;
    _phonenumber = phonenumber;
    notifyListeners();
  }

  void getworktype(String value) {
    _worktype = value;
    notifyListeners();
  }

  void getpdffile(PlatformFile value) {
    _pdffile = value;
    notifyListeners();
  }
}

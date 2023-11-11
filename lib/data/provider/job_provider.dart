import 'dart:ffi';

import 'package:flutter/material.dart';

class JobProvider extends ChangeNotifier {
  String _jobname = '';
  String get jobname => _jobname;
  String _image = '';
  String get image => _image;
  String _job_time_type = '';
  String get job_time_type => _job_time_type;
  String _comp_email = '';
  String get comp_email => _comp_email;
  String _about_comp = '';
  String get about_comp => _about_comp;
  String _job_description = '';
  String get job_description => _job_description;
  String _job_skill = '';
  String get job_skill => _job_skill;
  String _comp_name = '';
  String get comp_name => _comp_name;
  String _job_type = '';
  String get job_type => _job_type;
  String _location = '';
  String get location => _location;
  String _comp_website = '';
  String get comp_website => _comp_website;
  int _id = 0;
  int get id => _id;
  int _user_id = 0;
  int get user_id => _user_id;

  void getjobdata(
    String jobname,
    String image,
    String jobtimetype,
    String compemail,
    String aboutcomp,
    String jobdes,
    String jobskill,
    String compname,
    String jobtype,
    String location,
    String compwebsite,
    int id,
    int userid,
  ) {
    _jobname = jobname;
    _image = image;
    _job_time_type = jobtimetype;
    _about_comp = aboutcomp;
    _comp_email = compemail;
    _id = id;
    _user_id = userid;
    _job_type = jobtype;
    _comp_name = compname;
    _job_skill = jobskill;
    _job_description = jobdes;
    _location = location;
    _comp_website = compwebsite;
    notifyListeners();
  }
}

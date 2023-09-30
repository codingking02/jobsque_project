// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/view/apply_job/applyjob2.dart';
import 'package:jobsque_amit_project/view/home/homescreenwidget.dart';
import 'package:jobsque_amit_project/view/home/homesearchscree.dart';
import 'package:jobsque_amit_project/view/home/jobs_screen.dart';
import 'package:jobsque_amit_project/view/home/searchscree.dart';
import 'package:jobsque_amit_project/view/login/login.dart';
import 'package:jobsque_amit_project/view/porfile_settings/change_password.dart';
import 'package:jobsque_amit_project/view/porfile_settings/editprofile.dart';
import 'package:jobsque_amit_project/view/porfile_settings/language.dart';
import 'package:jobsque_amit_project/view/porfile_settings/main_email.dart';
import 'package:jobsque_amit_project/view/porfile_settings/notificationpro.dart';
import 'package:jobsque_amit_project/view/porfile_settings/phone_number.dart';
import 'package:jobsque_amit_project/view/porfile_settings/security.dart';
import 'package:jobsque_amit_project/view/porfile_settings/two_step_verification.dart';
import 'package:jobsque_amit_project/view/porfile_settings/twostep_code.dart';
import 'package:jobsque_amit_project/view/porfile_settings/twostepactivation.dart';
import 'package:jobsque_amit_project/view/register/register_screen.dart';
import 'package:jobsque_amit_project/view/register/select_country.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showlogin = prefs.getBool("showlogin") ?? false;

  runApp(
    MyApp(
      showlogin: showlogin,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showlogin;
  MyApp({super.key, required this.showlogin});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Register(),
    );
  }
}

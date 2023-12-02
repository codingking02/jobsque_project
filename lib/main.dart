import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/data/provider/accountemailprovider.dart';
import 'package:jobsque_amit_project/data/provider/applyjobprovider.dart';
import 'package:jobsque_amit_project/data/provider/bioprovider.dart';
import 'package:jobsque_amit_project/data/provider/filterjobprovider.dart';
import 'package:jobsque_amit_project/data/provider/job_provider.dart';
import 'package:jobsque_amit_project/data/provider/job_search_provider.dart';
import 'package:jobsque_amit_project/data/provider/otpprovider..dart';
import 'package:jobsque_amit_project/data/provider/passwordprovider.dart';
import 'package:jobsque_amit_project/data/provider/phonenumberprovider.dart';
import 'package:jobsque_amit_project/data/provider/profilenameprovider.dart';
import 'package:jobsque_amit_project/data/provider/registertokenprovider.dart';
import 'package:jobsque_amit_project/data/provider/resetemailprovider.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:jobsque_amit_project/data/provider/useridprovider.dart';
import 'package:jobsque_amit_project/view/complete_profile.dart/completeprofile.dart';
import 'package:jobsque_amit_project/view/complete_profile.dart/education.dart';
import 'package:jobsque_amit_project/view/complete_profile.dart/experience.dart';
import 'package:jobsque_amit_project/view/home/homesearchscree.dart';
import 'package:jobsque_amit_project/view/home/jobs_screen.dart';
import 'package:jobsque_amit_project/view/home/searchvalue.dart';
import 'package:jobsque_amit_project/view/login/login.dart';
import 'package:jobsque_amit_project/view/porfile_settings/twostep_code.dart';
import 'package:jobsque_amit_project/view/register/register_screen.dart';
import 'package:jobsque_amit_project/view/register/setupcompleted.dart';
import 'package:jobsque_amit_project/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final rememberme = prefs.getBool("rememberme");
  final showregister = prefs.getBool("showlogin");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserIdProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterJobProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JobSeaarchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ApplyJobProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JobProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterTokenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BioProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneNumberProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TokenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => resetemailprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountEmailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Profilename(),
        ),
      ],
      child: MyApp(
        rememberme: rememberme,
        showregister: showregister,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool? rememberme;
  final bool? showregister;
  MyApp({super.key, required this.rememberme, required this.showregister});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

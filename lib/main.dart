import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/provider/profilenameprovider.dart';
import 'package:jobsque_amit_project/view/home/homescreenwidget.dart';

import 'package:jobsque_amit_project/view/register/register_screen.dart';
import 'package:jobsque_amit_project/view/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showlogin = prefs.getBool("showlogin") ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Profilename(),
          child: HomeScreenWidget(),
        ),
      ],
      child: MyApp(
        showlogin: showlogin,
      ),
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
      home: SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/provider/accountemailprovider.dart';
import 'package:jobsque_amit_project/provider/passwordprovider.dart';
import 'package:jobsque_amit_project/provider/profilenameprovider.dart';
import 'package:jobsque_amit_project/provider/resetemailprovider.dart';
import 'package:jobsque_amit_project/provider/tokenprovider.dart';
import 'package:jobsque_amit_project/view/login/login.dart';
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
      home: LoginScreen(),
    );
  }
}

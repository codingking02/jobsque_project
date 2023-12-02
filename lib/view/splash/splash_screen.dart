import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque_amit_project/view/register/register_screen.dart';
import 'package:jobsque_amit_project/widgets/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../slider/slider_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color color = Color(0x24D6E4FF);
  @override
  void initState() {
    splashduratiion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          gettopbarimage(),
          getcontainer(
            700,
            701.31,
            color,
          ),
          getcontainer(
            533,
            534,
            color,
          ),
          getcontainer(
            343,
            344,
            color,
          ),
          getcontainer(
            189,
            190,
            color,
          ),
          Center(
            child: SvgPicture.asset(
              'assets/Logo.svg',
            ),
          ),
        ],
      ),
    );
  }

  Widget getcontainer(
    double maxheight,
    double maxwidth,
    Color color,
  ) {
    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: OverflowBox(
        maxHeight: maxheight,
        maxWidth: maxwidth,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Future<void> splashduratiion() async {
    final prefs = await SharedPreferences.getInstance();
    return Future.delayed(
      Duration(
        seconds: 3,
      ),
    ).then(
      (value) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return prefs.getBool("showlogin") == true
                  ? Register()
                  : SliderUi();
            },
          ),
        );
      },
    );
  }
}

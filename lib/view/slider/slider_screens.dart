import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/view/register/register_screen.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderUi extends StatefulWidget {
  const SliderUi({super.key});

  @override
  State<SliderUi> createState() => _SliderUiState();
}

class _SliderUiState extends State<SliderUi> {
  bool islastpage = false;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          gettopbarimage(),
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  islastpage = value == 2;
                });
              },
              controller: controller,
              children: [
                getpageview(
                  context,
                  'assets/1.svg',
                  'assets/SmallLogo.svg',
                  'assets/Top bar.svg',
                  'assets/Tittle1.svg',
                ),
                getpageview(
                  context,
                  'assets/2.svg',
                  'assets/SmallLogo.svg',
                  'assets/Top bar.svg',
                  'assets/Tittle2.svg',
                ),
                getpageview(
                  context,
                  'assets/3.svg',
                  'assets/SmallLogo.svg',
                  'assets/Top bar.svg',
                  'assets/Tittle3.svg',
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 40,
            ),
            child: SmoothPageIndicator(
              effect: WormEffect(
                spacing: 4,
                dotHeight: 8,
                dotWidth: 8,
                dotColor: Color.fromRGBO(173, 200, 255, 1),
                activeDotColor: Color.fromRGBO(
                  51,
                  102,
                  255,
                  1,
                ),
              ),
              onDotClicked: (index) {
                controller.animateToPage(
                  index,
                  duration: Duration(
                    milliseconds: 500,
                  ),
                  curve: Curves.easeIn,
                );
              },
              controller: controller,
              count: 3,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 30,
            ),
            width: 327,
            height: 48,
            child: islastpage
                ? Onboardbutton(
                    "Get Started",
                    tologin,
                  )
                : Onboardbutton(
                    'Next',
                    slidetonextpage,
                  ),
          ),
        ],
      ),
    );
  }

  Widget Onboardbutton(String title, Function function) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color.fromRGBO(
            51,
            102,
            255,
            1,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              1000,
            ),
          ),
        ),
      ),
      onPressed: () {
        function();
      },
      child: Text(
        "${title}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
          height: 1.30,
          letterSpacing: 0.16,
        ),
      ),
    );
  }

  slidetonextpage() {
    controller.nextPage(
      duration: Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeInOut,
    );
  }

  tologin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("showlogin", true);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Register();
        },
      ),
    );
  }
}

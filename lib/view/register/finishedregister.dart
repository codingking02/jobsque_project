import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class FinishedRegister extends StatelessWidget {
  const FinishedRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gettopbarimage(),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              child: getSvgPicture(
                'assets/arrow-left.svg',
              ),
            ),
            SizedBox(
              height: 97,
            ),
            Center(
                child: getSvgPicture(
              'assets/finishedregistertitle.svg',
            )),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 24,
                ),
                child: SvgPicture.asset(
                  'assets/finishedregister.svg',
                ),
              ),
            ),
            SizedBox(
              height: 240,
            ),
            Container(
              width: 327,
              height: 48,
              margin: EdgeInsets.only(
                left: 30,
              ),
              child: ElevatedButton(
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
                onPressed: () {},
                child: Text(
                  'Get Started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 1.30,
                    letterSpacing: 0.16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

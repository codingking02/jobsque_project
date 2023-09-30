import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class Pass_Success extends StatelessWidget {
  const Pass_Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            child: Image.asset(
              'assets/arrow-left.png',
            ),
          ),
          SizedBox(
            height: 97,
          ),
          Center(
            child: SvgPicture.asset(
              'assets/passsuccess.svg',
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 24,
              ),
              child: SvgPicture.asset(
                'assets/passchanged.svg',
              ),
            ),
          ),
          SizedBox(
            height: 160,
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
                'Open Email App',
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
    );
  }
}

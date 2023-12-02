import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/view/register/register_screen.dart';

SvgPicture gettopbarimage() {
  return SvgPicture.asset(
    'assets/topbar.svg',
  );
}

Image getHomeIndicatorimage() {
  return Image.asset(
    'assets/Home Indicator.png',
  );
}

SvgPicture getsmalllogo() {
  return SvgPicture.asset(
    'assets/SmallLogo.svg',
  );
}

Image getlargelogo() {
  return Image.asset('assets/Logo.png');
}

SvgPicture getSvgPicture(
  String text,
) {
  return SvgPicture.asset(
    text,
  );
}

Widget getpageview(
  BuildContext context,
  String mainimage,
  String logoimage,
  String titleimage,
) {
  return Container(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: SvgPicture.asset(
            mainimage,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                logoimage,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Register();
                      },
                    ),
                  );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.30,
                    letterSpacing: 0.16,
                  ),
                ),
              ),
            ],
          ),
        ),
        gettopbarimage(),
        Container(
          margin: EdgeInsets.only(
            left: 20,
            top: 440,
          ),
          child: SvgPicture.asset(
            titleimage,
          ),
        ),
      ],
    ),
  );
}

Widget getjob({
  required String title,
  required String icon,
}) {
  return Container(
    width: 327,
    height: 130,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              title,
            ),
            Image.asset(
              icon,
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/twittercategory.svg',
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '\$15K',
                    style: TextStyle(
                      color: Color(0xFF2E8E18),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1.30,
                      letterSpacing: 0.16,
                    ),
                  ),
                  TextSpan(
                    text: '/Month',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                      letterSpacing: 0.12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: 327,
          child: Divider(
            thickness: 1,
            color: Color.fromRGBO(
              229,
              231,
              235,
              1,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget getrecent_popular_search({
  required String text,
}) {
  return Container(
    width: 500,
    height: 36,
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 8,
    ),
    decoration: ShapeDecoration(
      color: Color(0xFFF4F4F5),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.50,
          color: Color(0xFFE5E7EB),
        ),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 14,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
        height: 1.40,
        letterSpacing: 0.14,
      ),
    ),
  );
}

Widget filterbutton(
  String text,
  double width,
  Function function,
) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: EdgeInsets.only(
        left: 8,
      ),
      clipBehavior: Clip.none,
      padding: EdgeInsets.fromLTRB(
        10,
        0,
        0,
        8,
      ),
      width: width,
      height: 32,
      decoration: ShapeDecoration(
        color: Color.fromRGBO(
          255,
          255,
          255,
          1,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color.fromRGBO(
              209,
              213,
              219,
              1,
            ),
          ),
          borderRadius: BorderRadius.circular(
            1000,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              height: 2,
              letterSpacing: -0.13,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 5,
            ),
            height: 16,
            width: 16,
            child: Icon(
              color: Color(0xFF6B7280),
              Icons.keyboard_arrow_down_sharp,
            ),
          ),
        ],
      ),
    ),
  );
}

void funcnull() {
  return null;
}

Widget gettitleforjob() {
  return Container(
    width: double.infinity,
    height: 36,
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 8,
    ),
    decoration: ShapeDecoration(
      color: Color(0xFFF4F4F5),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0.50,
          color: Color(
            0xFFE5E7EB,
          ),
        ),
      ),
    ),
    child: Text(
      'Featuring 120+ jobs',
      style: TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 14,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
        height: 1.40,
        letterSpacing: 0.14,
      ),
    ),
  );
}

Widget textforapplyjobtextfield(
  String text,
) {
  return SizedBox(
    width: 327,
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              color: Color(0xFF111827),
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              height: 1.30,
              letterSpacing: 0.16,
            ),
          ),
          TextSpan(
            text: '*',
            style: TextStyle(
              color: Color(0xFFFF472B),
              fontSize: 16,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              height: 1.30,
              letterSpacing: 0.16,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getheader({
  required String text,
  required double width,
  required Function function,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: () {
          function();
        },
        child: SvgPicture.asset(
          'assets/arrow-left.svg',
        ),
      ),
      SizedBox(
        width: width,
      ),
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF111827),
          fontSize: 20,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
          height: 1.20,
          letterSpacing: 0.20,
        ),
      ),
    ],
  );
}

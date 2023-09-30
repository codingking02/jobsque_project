import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/widgets/custom_jobtypecont.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class ApplyJob2 extends StatefulWidget {
  const ApplyJob2({super.key});

  @override
  State<ApplyJob2> createState() => _ApplyJob2State();
}

class _ApplyJob2State extends State<ApplyJob2> {
  bool istapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gettopbarimage(),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/arrow-left.svg',
                        ),
                        SizedBox(
                          width: 110,
                        ),
                        Text(
                          'Apply Job',
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
                    ),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  SvgPicture.asset(
                    'assets/step2.svg',
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Type of Work',
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 20,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1.20,
                      letterSpacing: 0.20,
                    ),
                  ),
                  Text(
                    'Fill in your bio data correctly',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                      letterSpacing: 0.14,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    children: [
                      JobTypeCont(
                        text: 'Senior UX Designer',
                      ),
                      JobTypeCont(
                        text: 'Senior UI Designer',
                      ),
                      JobTypeCont(
                        text: 'Graphik Designer',
                      ),
                      JobTypeCont(
                        text: 'Front-End Developer',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 1000,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                1000,
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(
                              51,
                              102,
                              255,
                              1,
                            ),
                          )),
                      onPressed: () async {},
                      child: Text(
                        'Next',
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
          ],
        ),
      ),
    );
  }

  getjobtype({
    required String text,
  }) {
    return InkWell(
      onTap: () {
        istapped = !istapped;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(
          16,
        ),
        height: 90,
        width: 1000,
        decoration: ShapeDecoration(
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
              8,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.16,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'CV.pdf . Portfolio.pdf',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.14,
                  ),
                ),
              ],
            ),
            istapped
                ? Image.asset(
                    'assets/bluecircle.png',
                  )
                : Image.asset(
                    'assets/circle.png',
                  ),
          ],
        ),
      ),
    );
  }
}

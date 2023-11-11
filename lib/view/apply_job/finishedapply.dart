import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/view/home/homesearchscree.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class FinishedApply extends StatefulWidget {
  const FinishedApply({super.key});

  @override
  State<FinishedApply> createState() => _FinishedApplyState();
}

class _FinishedApplyState extends State<FinishedApply> {
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
                    height: 121,
                  ),
                  Center(
                    child: getSvgPicture(
                      'assets/finishedapply.svg',
                    ),
                  ),
                  Center(
                    child: getSvgPicture(
                      'assets/finishedapplyinfo.svg',
                    ),
                  ),
                  SizedBox(
                    height: 231,
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
                        ),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Back To Home',
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:jobsque_amit_project/widgets/widgets.dart';

class Activejobs extends StatefulWidget {
  const Activejobs({super.key});

  @override
  State<Activejobs> createState() => _ActivejobsState();
}

class _ActivejobsState extends State<Activejobs> {
  bool isactive = true;
  bool isrejected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/arrow-left.svg',
                          ),
                        ),
                        SizedBox(
                          width: 110,
                        ),
                        Text(
                          'Applied Job',
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
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: custombutton(),
                ),
                isactive
                    ? Column(
                        children: [
                          SizedBox(
                            height: 27,
                          ),
                          customcontainer(),
                          SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : isrejected
                        ? Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 90,
                                ),
                                getSvgPicture(
                                  'assets/norejected.svg',
                                ),
                                getSvgPicture(
                                  'assets/norejectedinfo.svg',
                                ),
                              ],
                            ),
                          )
                        : Text(''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customcontainer() {
    return Container(
      width: double.infinity,
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: ShapeDecoration(
        color: Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              child: Text(
                '3 Jobs',
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.14,
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 0,
            child: Text(
              'Read all messages',
              style: TextStyle(
                color: Color(0xFF3366FF),
                fontSize: 14,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                height: 0.10,
                letterSpacing: 0.14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget custombutton() {
    return Container(
      width: 327,
      height: 46,
      padding: const EdgeInsets.all(3),
      decoration: ShapeDecoration(
        color: Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isactive = true;
                  isrejected = false;
                });
              },
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isactive ? Color(0xFF091A7A) : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Active',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isactive ? Color(0xFFF4F4F5) : Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isrejected = true;
                  isactive = false;
                });
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: isrejected ? Color(0xFF091A7A) : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Rejected',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isrejected ? Colors.white : Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

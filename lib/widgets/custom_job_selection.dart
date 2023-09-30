import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class CustomJobSelection extends StatelessWidget {
  final String titletext;
  final String icon;
  final String jobbuttontext1;
  final String jobbuttontext2;
  final String wage;
  final double width1;
  final double width2;
  const CustomJobSelection({
    super.key,
    required this.icon,
    required this.jobbuttontext1,
    required this.jobbuttontext2,
    required this.titletext,
    required this.wage,
    required this.width1,
    required this.width2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 327,
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                titletext,
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
            children: [
              jobdisbutton(
                text: jobbuttontext1,
                width: width1,
              ),
              SizedBox(
                width: 5,
              ),
              jobdisbutton(
                text: jobbuttontext2,
                width: width2,
              ),
              SizedBox(
                width: 80,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: wage,
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
}

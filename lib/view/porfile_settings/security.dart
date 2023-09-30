import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/widgets/custom_security.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class Security extends StatelessWidget {
  Security({super.key});
  bool isemail = true;
  bool isphone = false;
  bool ischange = false;
  bool istwostep = false;
  bool isface = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          gettopbarimage(),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: getheader(
              text: 'Login and Security',
              width: 70,
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Container(
                    width: 1000,
                    child: SvgPicture.asset(
                      'assets/access.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomSecurity(
                    text: 'Email Address',
                    isbool: isemail,
                    righttext: '',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomSecurity(
                    text: 'Phone number',
                    isbool: isphone,
                    righttext: '',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomSecurity(
                    text: 'Change password',
                    isbool: ischange,
                    righttext: '',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomSecurity(
                    text: 'Two-step verification',
                    isbool: istwostep,
                    righttext: 'Non active',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomSecurity(
                    text: 'Face Id',
                    isbool: isface,
                    righttext: '',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

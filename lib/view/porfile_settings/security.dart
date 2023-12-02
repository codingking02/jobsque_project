// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/view/porfile_settings/change_password.dart';
import 'package:jobsque_amit_project/view/porfile_settings/main_email.dart';
import 'package:jobsque_amit_project/view/porfile_settings/phone_number.dart';
import 'package:jobsque_amit_project/view/porfile_settings/two_step_verification.dart';
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
              function: () {
                Navigator.pop(context);
              },
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
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainEmail(),
                        ),
                      );
                    },
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
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneNumber(),
                        ),
                      );
                    },
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
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePassword(),
                        ),
                      );
                    },
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
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TwoStepVerification(),
                        ),
                      );
                    },
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
                    function: () {},
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

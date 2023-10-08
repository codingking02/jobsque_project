// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque_amit_project/view/login/login.dart';

import '../../widgets/widgets.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          gettopbarimage(),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/arrow-left.svg',
                    ),
                  ),
                  getsmalllogo(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 44,
          ),
          SvgPicture.asset(
            'assets/resetpass.svg',
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: TextFormField(
              onChanged: (value) {},
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(
                    156,
                    163,
                    175,
                    1,
                  ),
                ),
                prefixIcon: Container(
                  margin: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Image.asset(
                    'assets/sms.png',
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(209, 213, 219, 1),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              validator: (String? value) {
                final bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value!);
                if (value == null || value.isEmpty) {
                  return "must enter an email";
                } else if (!emailValid) {
                  return "enter a valid email";
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            height: 300,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 84,
            ),
            child: Row(
              children: [
                Text(
                  'You Remember Your Password',
                  style: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                    letterSpacing: 0.14,
                  ),
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFF3366FF),
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                    letterSpacing: 0.14,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: 327,
            height: 48,
            margin: EdgeInsets.only(
              left: 5,
            ),
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
                  Color.fromRGBO(51, 102, 255, 1),
                ),
              ),
              onPressed: () async {},
              child: Text(
                'Request Password Reset',
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

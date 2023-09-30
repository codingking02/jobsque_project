// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';

class CustomEleveatedButton extends StatelessWidget {
  final Function colorfunction;
  final EdgeInsets mymargin;
  final Function onpress;
  final Color textcolor;
  const CustomEleveatedButton({
    super.key,
    required this.colorfunction,
    required this.mymargin,
    required this.onpress,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 48,
      margin: mymargin,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                1000,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              colorfunction();
            },
          ),
        ),
        onPressed: () async {
          onpress();
        },
        child: Text(
          'Create account',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textcolor,
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 1.30,
            letterSpacing: 0.16,
          ),
        ),
      ),
    );
  }
}

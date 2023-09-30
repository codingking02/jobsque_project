import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TwoStepCode extends StatefulWidget {
  TwoStepCode({super.key});

  @override
  State<TwoStepCode> createState() => _TwoStepCodeState();
}

class _TwoStepCodeState extends State<TwoStepCode> {
  bool istextemptypass2 = false;

  bool ispressedeyeicon2 = false;

  var passcontroller2 = TextEditingController();

  final FocusNode inputFocusNode = FocusNode();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '####-###-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          gettopbarimage(),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: ListView(
                children: [
                  getheader(
                    text: 'Two-step verification',
                    width: 60,
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Enter the 6 digit code',
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please confirm your account by entering the\nauthorization code sen to ',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.14,
                      height: 1.5,
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

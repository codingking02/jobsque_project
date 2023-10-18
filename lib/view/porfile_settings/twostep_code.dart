import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/data/provider/accountemailprovider.dart';
import 'package:jobsque_amit_project/data/provider/otpprovider..dart';
import 'package:jobsque_amit_project/data/provider/phonenumberprovider.dart';
import 'package:jobsque_amit_project/view/porfile_settings/phone_number.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:path/path.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class TwoStepCode extends StatefulWidget {
  TwoStepCode({super.key});

  @override
  State<TwoStepCode> createState() => _TwoStepCodeState();
}

class _TwoStepCodeState extends State<TwoStepCode> {
  TextEditingController pincontroller = TextEditingController();
  static final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(8),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
      color: Color.fromRGBO(234, 239, 243, 1),
    ),
  );
  String hideHalfStringWithStars(String text) {
    final int length = text.length;
    final int halfLength = (length / 2).ceil();
    final String visibleText = text.substring(0, halfLength);
    final String hiddenText = '*' * (length - halfLength);
    return '$visibleText$hiddenText';
  }

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
                    'Please confirm your account by entering the\nauthorization code sen to ${hideHalfStringWithStars(context.read<PhoneNumberProvider>().maskedphonenumber)} ',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.14,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Pinput(
                    controller: pincontroller,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    validator: (s) {
                      return s == context.read<OtpProvider>().otp
                          ? null
                          : 'Pin is incorrect';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
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

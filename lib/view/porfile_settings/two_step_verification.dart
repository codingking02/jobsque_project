import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/view/porfile_settings/twostepactivation.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class TwoStepVerification extends StatefulWidget {
  const TwoStepVerification({super.key});

  @override
  State<TwoStepVerification> createState() => _TwoStepVerificationState();
}

class _TwoStepVerificationState extends State<TwoStepVerification> {
  List<DropDownValueModel> dropdown = [
    DropDownValueModel(
      name: 'Telephone number (SMS)',
      value: null,
    ),
  ];
  bool ischanged = false;
  bool istoggled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        text: 'Two-step-verification',
                        width: 60,
                        function: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 327,
                        height: 66,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(
                                0xFFD1D5DB,
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
                            Text(
                              'Secure your account with\ntwo-step verification',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 16,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.16,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    istoggled = !istoggled;
                                    setState(() {});
                                  },
                                  child: istoggled
                                      ? Image.asset(
                                          'assets/toggleon.png',
                                        )
                                      : Image.asset(
                                          'assets/toggleoff.png',
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      istoggled
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Select a verification method',
                                  style: TextStyle(
                                    color: Color(0xFF111827),
                                    fontSize: 16,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    height: 0.08,
                                    letterSpacing: 0.16,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 60,
                                  child: DropDownTextField(
                                    onChanged: (value) {
                                      ischanged = !ischanged;
                                      print(
                                        'the bool is :  ${ischanged}',
                                      );
                                    },
                                    dropDownList: dropdown,
                                    textFieldDecoration: InputDecoration(
                                      suffixIcon: Image.asset(
                                        'aasets/arrow-down.png',
                                      ),
                                      hintText: 'Telephone number (SMS)',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF111827),
                                        fontSize: 14,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                        height: 0.10,
                                        letterSpacing: 0.30,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(209, 213, 219, 1),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                getSvgPicture(
                                  'assets/notetwostep.svg',
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getSvgPicture(
                                  'assets/twostepcontent.svg',
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                getSvgPicture(
                                  'assets/twostepcontent1.svg',
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 700,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              width: 350,
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
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TwoStepActivation(),
                    ),
                  );
                },
                child: Text(
                  'Save',
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
          ),
        ],
      ),
    );
  }
}

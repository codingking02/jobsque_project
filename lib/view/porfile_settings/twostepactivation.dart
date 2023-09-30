import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TwoStepActivation extends StatefulWidget {
  TwoStepActivation({super.key});

  @override
  State<TwoStepActivation> createState() => _TwoStepActivationState();
}

class _TwoStepActivationState extends State<TwoStepActivation> {
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
                  getSvgPicture(
                    'assets/twosteptitle.svg',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      focusNode: inputFocusNode,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        maskFormatter,
                      ],
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(
                            12.0,
                          ),
                          child: Container(
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 16,
                                ),
                                Image.asset(
                                  'assets/usaflag.png',
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Image.asset(
                                  'assets/arrow-down.png',
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Image.asset(
                                  'assets/smallline.png',
                                ),
                              ],
                            ),
                          ),
                        ),
                        hintText: 'Your Number',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(
                            156,
                            163,
                            175,
                            1,
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
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Enter your password',
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 16,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.16,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length > 0) {
                          istextemptypass2 = true;
                        } else {
                          istextemptypass2 = false;
                        }
                        setState(() {});
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: passcontroller2,
                      obscureText: ispressedeyeicon2 ? false : true,
                      obscuringCharacter: '●',
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              ispressedeyeicon2 = !ispressedeyeicon2;

                              setState(() {});
                            },
                            child: ispressedeyeicon2
                                ? Image.asset(
                                    'assets/eye.png',
                                  )
                                : Image.asset(
                                    'assets/eye-slash.png',
                                  )),
                        hintText: 'Password',
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
                            'assets/lock.png',
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

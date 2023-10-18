import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:jobsque_amit_project/connections/profile_controller.dart';
import 'package:jobsque_amit_project/data/provider/accountemailprovider.dart';
import 'package:jobsque_amit_project/data/provider/otpprovider..dart';
import 'package:jobsque_amit_project/data/provider/passwordprovider.dart';
import 'package:jobsque_amit_project/data/provider/phonenumberprovider.dart';
import 'package:jobsque_amit_project/view/porfile_settings/twostep_code.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TwoStepActivation extends StatefulWidget {
  TwoStepActivation({super.key});

  @override
  State<TwoStepActivation> createState() => _TwoStepActivationState();
}

class _TwoStepActivationState extends State<TwoStepActivation> {
  void sendSMS(String phoneNumber, String message) async {
    final uri = 'sms:$phoneNumber?body=$message';

    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // Handle the error, e.g., show a dialog or a snackbar.
    }
  }

  bool istextemptypass2 = false;
  bool ispressedeyeicon2 = false;
  ProfileConnection profileConnection = ProfileConnection();
  var passcontroller2 = TextEditingController();
  var phonenumbercontroller = TextEditingController();
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
                      controller: phonenumbercontroller,
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
                  SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: 1000,
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
                        ),
                      ),
                      onPressed: () async {
                        print(
                          maskFormatter.getUnmaskedText(),
                        );
                        if (passcontroller2.text ==
                            context.read<PasswordProvider>().password) {
                          context.read<PhoneNumberProvider>().setunmaskednumber(
                                maskFormatter.getUnmaskedText(),
                              );
                          context.read<PhoneNumberProvider>().setmaskednumber(
                                maskFormatter.getMaskedText(),
                              );
                          await profileConnection.getotp(
                            context.read<AccountEmailProvider>().accountemail,
                            context,
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TwoStepCode();
                                  },
                                ),
                              );
                            },
                          );
                          final String phoneNumber = context
                              .read<PhoneNumberProvider>()
                              .unmaskedphonenumber; // Replace with the recipient's phone number
                          final String message =
                              'Hello This Is Your Otp From Jobsque App : ${context.read<OtpProvider>().otp}'; // Replace with your message

                          final Uri uri = Uri(
                              scheme: 'sms',
                              path: phoneNumber,
                              queryParameters: {'body': message});

                          try {
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              throw 'Could not launch the SMS app.';
                            }
                          } catch (e) {
                            print('Error: $e');
                          }

                          print(context.read<OtpProvider>().otp);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Your Otp Is :  ${context.read<OtpProvider>().otp}",
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Wrong Password",
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Next',
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
            ),
          )
        ],
      ),
    );
  }
}

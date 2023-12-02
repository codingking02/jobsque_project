import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/data/provider/applyjobprovider.dart';
import 'package:jobsque_amit_project/view/apply_job/applyjob2.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ApplyJob1 extends StatefulWidget {
  const ApplyJob1({super.key});

  @override
  State<ApplyJob1> createState() => _ApplyJob1State();
}

class _ApplyJob1State extends State<ApplyJob1> {
  final FocusNode inputFocusNode = FocusNode();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '####-###-####', filter: {"#": RegExp(r'[0-9]')});
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  bool isbrightname = false;
  bool isbrightemail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gettopbarimage(),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/arrow-left.svg',
                          ),
                        ),
                        SizedBox(
                          width: 110,
                        ),
                        Text(
                          'Apply Job',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF111827),
                            fontSize: 20,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 1.20,
                            letterSpacing: 0.20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  SvgPicture.asset(
                    'assets/applyjob1.svg',
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Biodata',
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 20,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1.20,
                      letterSpacing: 0.20,
                    ),
                  ),
                  Text(
                    'Fill in your bio data correctly',
                    style: TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                      letterSpacing: 0.14,
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  textforapplyjobtextfield(
                    'Full Name',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      controller: namecontroller,
                      onChanged: (value) {
                        if (value.length > 0) {
                          isbrightname = true;
                        } else {
                          isbrightname = false;
                        }
                        setState(() {});
                      },
                      onTap: () {},
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Username',
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
                          child: isbrightname
                              ? Image.asset(
                                  'assets/brightprofile.png',
                                )
                              : Image.asset(
                                  'assets/profile.png',
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textforapplyjobtextfield(
                    'Email',
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      controller: emailcontroller,
                      onChanged: (value) {
                        if (value.length > 0) {
                          isbrightemail = true;
                        } else {
                          isbrightemail = false;
                        }
                        setState(() {});
                      },
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
                          child: isbrightemail
                              ? Image.asset(
                                  'assets/brightsms.png',
                                )
                              : Image.asset(
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
                        // ignore: unnecessary_null_comparison
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
                    height: 20,
                  ),
                  textforapplyjobtextfield(
                    'No.Handphone',
                  ),
                  SizedBox(
                    height: 8,
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
                    height: 133,
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
                          )),
                      onPressed: () async {
                        context.read<ApplyJobProvider>().getapplybio(
                              namecontroller.text,
                              emailcontroller.text,
                              maskFormatter.getUnmaskedText(),
                            );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ApplyJob2();
                            },
                          ),
                        );
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
          ],
        ),
      ),
    );
  }
}

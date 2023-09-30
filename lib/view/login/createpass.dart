import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class CreatePass extends StatefulWidget {
  const CreatePass({super.key});

  @override
  State<CreatePass> createState() => _CreatePassState();
}

class _CreatePassState extends State<CreatePass> {
  TextEditingController passcontroller = TextEditingController();
  TextEditingController passcontroller2 = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool istextemptypass = false;
  bool istextemptypass2 = false;
  bool ispressedeyeicon = false;
  bool ispressedeyeicon2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gettopbarimage(),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/arrow-left.svg',
                      ),
                      getsmalllogo(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 44,
                ),
                SvgPicture.asset(
                  'assets/createpass.svg',
                ),
                SizedBox(
                  height: 44,
                ),
                Container(
                  height: 60,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length > 0) {
                        istextemptypass = true;
                      } else {
                        istextemptypass = false;
                      }
                      setState(() {});
                    },
                    keyboardType: TextInputType.visiblePassword,
                    controller: passcontroller,
                    obscureText: ispressedeyeicon ? true : false,
                    obscuringCharacter: '●',
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          ispressedeyeicon = !ispressedeyeicon;

                          setState(() {});
                        },
                        child: ispressedeyeicon
                            ? Image.asset(
                                'assets/eye-slash.png',
                              )
                            : Image.asset(
                                'assets/eye.png',
                              ),
                      ),
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
                        child: Image.asset('assets/lock.png'),
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
                      if (value == null || value.isEmpty) {
                        return "must enter a password";
                      } else if (value.length < 8) {
                        return "password must me more than 8 charachters";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Password must be at least 8 characters',
                  style: TextStyle(
                    color: passcontroller.text.length < 8 && istextemptypass
                        ? Color.fromRGBO(
                            255,
                            71,
                            43,
                            1,
                          )
                        : passcontroller.text.length < 8 && !istextemptypass
                            ? Color(
                                0xFF9CA3AF,
                              )
                            : passcontroller.text.length >= 8 && istextemptypass
                                ? Color.fromRGBO(
                                    96,
                                    198,
                                    49,
                                    1,
                                  )
                                : Color(
                                    0xFF9CA3AF,
                                  ),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.30,
                    letterSpacing: 0.16,
                  ),
                ),
                SizedBox(
                  height: 24,
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
                    obscureText: ispressedeyeicon2 ? true : false,
                    obscuringCharacter: '●',
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          ispressedeyeicon2 = !ispressedeyeicon2;

                          setState(() {});
                        },
                        child: ispressedeyeicon2
                            ? Image.asset(
                                'assets/eye-slash.png',
                              )
                            : Image.asset(
                                'assets/eye.png',
                              ),
                      ),
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
                        child: Image.asset('assets/lock.png'),
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
                      if (passcontroller.text != passcontroller2.text) {
                        return 'Both Passwords Must Match';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Both Passwords Must Match',
                  style: TextStyle(
                    color: passcontroller.text != passcontroller2.text &&
                            istextemptypass2
                        ? Color.fromRGBO(
                            255,
                            71,
                            43,
                            1,
                          )
                        : passcontroller.text != passcontroller2.text &&
                                !istextemptypass2
                            ? Color(
                                0xFF9CA3AF,
                              )
                            : passcontroller.text == passcontroller2.text &&
                                    istextemptypass2
                                ? Color.fromRGBO(
                                    96,
                                    198,
                                    49,
                                    1,
                                  )
                                : Color(
                                    0xFF9CA3AF,
                                  ),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.30,
                    letterSpacing: 0.16,
                  ),
                ),
                SizedBox(
                  height: 220,
                ),
                Container(
                  width: 327,
                  height: 48,
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(
                          51,
                          102,
                          255,
                          1,
                        ),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            1000,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Open Email App',
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
        ),
      ),
    );
  }
}

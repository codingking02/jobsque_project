// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/profile_controller.dart';
import 'package:jobsque_amit_project/data/provider/passwordprovider.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:jobsque_amit_project/view/porfile_settings/profile.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  ProfileConnection profileConnection = ProfileConnection();
  bool istextemptypass = false;
  var passcontroller = TextEditingController();
  var ispressedeyeicon = false;
  var passcontroller2 = TextEditingController();
  bool istextemptypass2 = false;
  var ispressedeyeicon2 = false;
  bool istextempty = false;
  var passcontroller0 = TextEditingController();
  var ispressedicon0 = false;

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
                    text: 'Change Password',
                    width: 70,
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 44,
                  ),
                  Text(
                    'Enter Your Old Password',
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
                    height: 8,
                  ),
                  Container(
                    height: 60,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length > 0) {
                          istextempty = true;
                        } else {
                          istextempty = false;
                        }
                        setState(() {});
                      },
                      keyboardType: TextInputType.visiblePassword,
                      controller: passcontroller0,
                      obscureText: ispressedicon0 ? true : false,
                      obscuringCharacter: '●',
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            ispressedicon0 = !ispressedicon0;

                            setState(() {});
                          },
                          child: ispressedicon0
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
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Enter Your New Password',
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
                    height: 8,
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
                              : passcontroller.text.length >= 8 &&
                                      istextemptypass
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
                    height: 50,
                  ),
                  Text(
                    'Confirm Your New Password',
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
                    height: 8,
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
                    height: 200,
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
                        if (passcontroller0.text ==
                                context.read<PasswordProvider>().password &&
                            passcontroller2.text == passcontroller.text) {
                          print(context.read<TokenProvider>().token);
                          await profileConnection.updatePassword(
                            passcontroller.text,
                            context,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
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

                        print(
                          context.read<PasswordProvider>().password,
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

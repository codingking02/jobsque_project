// ignore_for_file: unnecessary_null_comparison, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/controllers/register_controller.dart';
import 'package:jobsque_amit_project/model/profile_model.dart';
import 'package:jobsque_amit_project/view/login/login.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

import '../slider/slider_screens.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color buttoncolor = Color.fromRGBO(
    209,
    213,
    219,
    1,
  );
  Color textcolor = Color.fromRGBO(
    107,
    114,
    128,
    1,
  );
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool istextemptyname = false;
  bool istextemptyemail = false;
  bool istextemptypass = false;
  bool ispressedeyeicon = false;
  bool isbrightname = false;
  bool isbrightemail = false;
  bool isbrightpass = false;
  HttpConnections registerhttp = HttpConnections();

  Image myeyeimage = Image.asset(
    'assets/eye-slash.png',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SliderUi();
                              },
                            ),
                          );
                        },
                        child: getSvgPicture(
                          'assets/arrow-left.svg',
                        ),
                      ),
                      getsmalllogo(),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 41,
                  ),
                  child: getSvgPicture(
                    'assets/createaccount.svg',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 44,
                  ),
                  child: Container(
                    height: 60,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.length > 0) {
                          istextemptyname = true;
                          isbrightname = true;
                        } else {
                          istextemptyname = false;
                          isbrightname = false;
                        }
                        setState(() {});
                      },
                      onTap: () {},
                      keyboardType: TextInputType.name,
                      controller: namecontroller,
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
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 60,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length > 0) {
                        istextemptyemail = true;
                        isbrightemail = true;
                      } else {
                        istextemptyemail = false;
                        isbrightemail = false;
                      }
                      setState(() {});
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailcontroller,
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
                  height: 16,
                ),
                Container(
                  height: 60,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length > 0) {
                        istextemptypass = true;
                        isbrightpass = true;
                      } else {
                        istextemptypass = false;
                        isbrightpass = false;
                      }
                      setState(() {});
                    },
                    keyboardType: TextInputType.visiblePassword,
                    controller: passcontroller,
                    obscureText: ispressedeyeicon ? false : true,
                    obscuringCharacter: '●',
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          ispressedeyeicon = !ispressedeyeicon;

                          setState(() {});
                        },
                        child: ispressedeyeicon
                            ? Image.asset(
                                'assets/eye.png',
                              )
                            : isbrightpass
                                ? Image.asset(
                                    'assets/brighteye-slash.png',
                                  )
                                : Image.asset(
                                    'assets/eye-slash.png',
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
                        child: isbrightpass
                            ? Image.asset(
                                'assets/brightlock.png',
                              )
                            : Image.asset(
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
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 88 - 24,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: 0.14,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen(
                                  email: emailcontroller.text,
                                );
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFF3366FF),
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                            letterSpacing: 0.14,
                          ),
                        ),
                      ),
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
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          if (istextemptyname == true &&
                              istextemptyemail == true &&
                              istextemptypass == true) {
                            return Color.fromRGBO(51, 102, 255, 1);
                          } else {
                            return buttoncolor;
                          }
                        },
                      ),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        // Post post = await registerhttp.createPost(
                        //   namecontroller.text,
                        //   emailcontroller.text,
                        //   passcontroller.text,
                        // );
                        await registerhttp.sendFormData(
                          namecontroller.text,
                          emailcontroller.text,
                          passcontroller.text,
                          context,
                          () {
                            Profilemodel.name = namecontroller.text;
                            Profilemodel.email = emailcontroller.text;
                            Profilemodel.password = passcontroller.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen(
                                    email: emailcontroller.text,
                                  );
                                },
                              ),
                            );
                          },
                        );

                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Congratualations data is right',
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('enter the right data'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Create account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: istextemptyname == true &&
                                istextemptyemail == true &&
                                istextemptypass == true
                            ? Colors.white
                            : textcolor,
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.30,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 28.5,
                ),
                Row(
                  children: [
                    Container(
                      width: 64.50,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFD1D5DB),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Or Sign up With Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.14,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 64.50,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFD1D5DB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Row(
                    children: [
                      getSvgPicture(
                        'assets/google.svg',
                      ),
                      SizedBox(
                        width: 19,
                      ),
                      getSvgPicture(
                        'assets/facebook.svg',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

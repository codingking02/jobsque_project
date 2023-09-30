import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque_amit_project/controllers/register_controller.dart';
import 'package:jobsque_amit_project/view/home/homesearchscree.dart';
import 'package:jobsque_amit_project/view/register/register_screen.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  String email;
  LoginScreen({
    super.key,
    required this.email,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  HttpConnections registerhttp = HttpConnections();
  TextEditingController namecontroller = TextEditingController();

  TextEditingController passcontroller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool istextemptyname = false;
  bool ischecked = false;
  bool istextemptypass = false;
  bool ispressedeyeicon = false;

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

  bool istextemptyemail = false;

  bool isbrightname = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              gettopbarimage(),
              Container(
                margin: EdgeInsets.only(
                  left: 250,
                  top: 16,
                ),
                child: getsmalllogo(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 24,
                ),
                child: SvgPicture.asset(
                  'assets/logintitle.svg',
                ),
              ),
              SizedBox(
                height: 44,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
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
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
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
                  // ignore: body_might_complete_normally_nullable
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "must enter a password";
                    } else if (value.length < 8) {
                      return "password must me more than 8 charachters";
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    margin: EdgeInsets.only(
                      left: 26,
                      top: 20,
                    ),
                    child: Checkbox(
                      activeColor: Color.fromRGBO(
                        51,
                        102,
                        255,
                        1,
                      ),
                      side: BorderSide(
                        color: Color.fromRGBO(
                          156,
                          163,
                          175,
                          1,
                        ),
                      ),
                      value: ischecked,
                      onChanged: (value) {
                        setState(() {
                          ischecked = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      'Remember me',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF3366FF),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 84,
                ),
                child: Row(
                  children: [
                    Text(
                      'Dont’t have an account?',
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
                              return Register();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF3366FF),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: 0.14,
                        ),
                      ),
                    )
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
                        if (istextemptyemail == true &&
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
                      await registerhttp.loginwithapi(namecontroller.text,
                          widget.email, passcontroller.text, context, () {
                        widget.email = HomeScreen.email;
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ));
                      });

                      // Obtain shared preferences.

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
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: istextemptyemail == true && istextemptypass == true
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
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 24,
                ),
                child: Row(
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
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 30,
                ),
                child: Center(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/google.svg',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset(
                        'assets/facebook.svg',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

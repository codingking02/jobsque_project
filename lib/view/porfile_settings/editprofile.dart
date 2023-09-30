import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class editprofile extends StatelessWidget {
  editprofile({super.key});
  TextEditingController namecontroller = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();
  final FocusNode inputFocusNode = FocusNode();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '####-###-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gettopbarimage(),
              SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/arrow-left.svg',
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    'Edit Profile',
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
              SizedBox(
                height: 36,
              ),
              Center(
                child: Image.asset(
                  'assets/photo.png',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              gettext(
                'Name',
              ),
              SizedBox(
                height: 10,
              ),
              gettextfield(
                controller: namecontroller,
                hintext: 'Name',
              ),
              SizedBox(
                height: 25,
              ),
              gettext(
                'Bio',
              ),
              SizedBox(
                height: 10,
              ),
              gettextfield(
                controller: biocontroller,
                hintext: 'Bio',
              ),
              SizedBox(
                height: 25,
              ),
              gettext(
                'Adress',
              ),
              SizedBox(
                height: 10,
              ),
              gettextfield(
                controller: adresscontroller,
                hintext: 'Adress',
              ),
              SizedBox(
                height: 25,
              ),
              gettext(
                'No.HandPhone',
              ),
              SizedBox(
                height: 10,
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
                height: 100,
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
                  onPressed: () async {},
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
      ),
    );
  }

  Widget gettext(
    String text,
  ) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF9CA3AF),
        fontSize: 16,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
        height: 0.08,
        letterSpacing: 0.16,
      ),
    );
  }

  Widget gettextfield({
    required TextEditingController controller,
    required String hintext,
  }) {
    return Container(
      height: 55,
      width: 1000,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: hintext,
          hintStyle: TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 14,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.30,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
            borderSide: BorderSide(
              color: Color(
                0xffD1D5DB,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
            borderSide: BorderSide(
              color: Color(
                0xffD1D5DB,
              ),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
            borderSide: BorderSide(
              color: Color(
                0xffD1D5DB,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

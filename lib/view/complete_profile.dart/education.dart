import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/view/complete_profile.dart/experience.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/widgets.dart';

class Education extends StatelessWidget {
  Education({super.key});
  var Universitycontroller = TextEditingController();
  var Titlecontroller = TextEditingController();
  var startyearcontroller = TextEditingController();
  var endyearcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                getheader(
                  text: "Education",
                  width: 100,
                  function: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 500,
                  width: 327,
                  padding: EdgeInsets.fromLTRB(
                    12,
                    12,
                    12,
                    16,
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(
                          0xffD1D5DB,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      geteducationtext(
                        "University",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      gettextfield(
                        controller: Universitycontroller,
                        hintext: "University",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      geteducationtext(
                        "Title",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      gettextfield(
                        controller: Titlecontroller,
                        hintext: "Title",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      geteducationtext(
                        "Start Year",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      getcalendarfield(
                        controller: startyearcontroller,
                        hintext: "Start Year",
                        context: context,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      geteducationtext(
                        "End Year",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      getcalendarfield(
                        controller: endyearcontroller,
                        hintext: "End Year",
                        context: context,
                      ),
                      SizedBox(
                        height: 20,
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
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString(
                              "University",
                              Universitycontroller.text,
                            );
                            prefs.setString(
                              "Title",
                              Titlecontroller.text,
                            );
                            prefs.setString(
                              "StartYear",
                              startyearcontroller.text,
                            );
                            prefs.setString(
                              "EndYear",
                              endyearcontroller.text,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Experience(),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget geteducationtext(
    String text,
  ) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF9CA3AF),
        fontSize: 16,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w500,
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

  Widget getcalendarfield({
    required TextEditingController controller,
    required String hintext,
    required BuildContext context,
  }) {
    return Container(
      height: 55,
      width: 1000,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(
                  2050,
                ),
              );

              if (pickedDate != null) {
                controller.text = pickedDate.toString().substring(
                      0,
                      11,
                    );
              }
            },
            child: Image.asset(
              "assets/calendar.png",
            ),
          ),
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

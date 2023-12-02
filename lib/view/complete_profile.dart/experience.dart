import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/experienceconnection.dart';
import 'package:jobsque_amit_project/data/provider/useridprovider.dart';
import 'package:jobsque_amit_project/view/complete_profile.dart/completedprofile.dart';
import 'package:jobsque_amit_project/view/complete_profile.dart/completeprofile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/widgets.dart';

class Experience extends StatefulWidget {
  Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  var Positioncontroller = TextEditingController();
  var TypeofWorkcontroller = TextEditingController();
  var CompanyNamecontroller = TextEditingController();
  var Locationcontroller = TextEditingController();
  var StartYearcontroller = TextEditingController();
  ExperienceCollection experienceCollection = ExperienceCollection();
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    height: 626,
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
                          "Position",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        gettextfield(
                          controller: Positioncontroller,
                          hintext: "University",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        geteducationtext(
                          "Type Of Work",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        gettextfield(
                          controller: TypeofWorkcontroller,
                          hintext: "Type of Work",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        geteducationtext(
                          "Company Name",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        gettextfield(
                          controller: CompanyNamecontroller,
                          hintext: "Company Name",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        geteducationtext(
                          "Location",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        gettextfield(
                          controller: Locationcontroller,
                          hintext: "Location",
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
                                onChanged: (value) async {
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
                                'I am currently working in this role',
                                style: TextStyle(
                                  color: Color(0xFF111827),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.14,
                                ),
                              ),
                            ),
                          ],
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
                          controller: StartYearcontroller,
                          hintext: "Start Year",
                          context: context,
                        ),
                        SizedBox(
                          height: 10,
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
                              final prefs =
                                  await SharedPreferences.getInstance();

                              experienceCollection.experience(
                                prefs.getBool("rememberme") == true
                                    ? prefs.getInt("userid")!
                                    : context.read<UserIdProvider>().userid!,
                                Positioncontroller.text,
                                TypeofWorkcontroller.text,
                                CompanyNamecontroller.text,
                                Locationcontroller.text,
                                StartYearcontroller.text,
                                context,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CompleteProfile();
                                  },
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

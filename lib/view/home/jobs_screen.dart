// ignore_for_file: must_be_immutable

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/custom_job_selection.dart';
import 'package:jobsque_amit_project/widgets/custom_jobtype.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class JobsScreen extends StatefulWidget {
  JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  bool istapped = false;

  SizedBox box8 = SizedBox(
    height: 8,
  );

  SizedBox box16 = SizedBox(
    height: 16,
  );
  SizedBox box12 = SizedBox(
    height: 12,
  );
  SizedBox boxw12 = SizedBox(
    width: 12,
  );

  List<DropDownValueModel> dropdown = [
    DropDownValueModel(
      name: '\$5k-\$10k',
      value: null,
    ),
    DropDownValueModel(
      name: '\$10k-\$15k',
      value: null,
    ),
    DropDownValueModel(
      name: '\$15k-\$20k',
      value: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.0),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return SizedBox(
                                height: 770,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    24,
                                    40,
                                    24,
                                    40,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Image.asset(
                                              'assets/arrow-left.png',
                                            ),
                                          ),
                                          Text(
                                            'Set Filter',
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
                                            'Reset',
                                            style: TextStyle(
                                              color: Color(0xFF3366FF),
                                              fontSize: 16,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w500,
                                              height: 1.30,
                                              letterSpacing: 0.16,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 28,
                                      ),
                                      Text(
                                        'Job Tittle',
                                        style: TextStyle(
                                          color: Color(0xFF111827),
                                          fontSize: 16,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 1.30,
                                          letterSpacing: 0.16,
                                        ),
                                      ),
                                      box8,
                                      Container(
                                        height: 60,
                                        child: TextFormField(
                                          onChanged: (value) {},
                                          onTap: () {},
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                            hintText: 'UI/UX Designer',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            prefixIcon: Image.asset(
                                              'assets/lightbriefcase.png',
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    209, 213, 219, 1),
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      box16,
                                      Text(
                                        'location',
                                        style: TextStyle(
                                          color: Color(0xFF111827),
                                          fontSize: 16,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 1.30,
                                          letterSpacing: 0.16,
                                        ),
                                      ),
                                      box8,
                                      Container(
                                        height: 60,
                                        child: TextFormField(
                                          onChanged: (value) {},
                                          onTap: () {},
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                            hintText: 'Location',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            prefixIcon: Image.asset(
                                              'assets/location.png',
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    209, 213, 219, 1),
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      box16,
                                      Text(
                                        'Salary',
                                        style: TextStyle(
                                          color: Color(0xFF111827),
                                          fontSize: 16,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 1.30,
                                          letterSpacing: 0.16,
                                        ),
                                      ),
                                      box8,
                                      Container(
                                        height: 60,
                                        child: DropDownTextField(
                                          dropDownList: dropdown,
                                          textFieldDecoration: InputDecoration(
                                            suffixIcon: Image.asset(
                                              'aasets/arrow-down.png',
                                            ),
                                            prefixIcon: Image.asset(
                                              'assets/dollar-circle.png',
                                            ),
                                            hintText: '\$5k-\$10k',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    209, 213, 219, 1),
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      box16,
                                      Text(
                                        'Job Type',
                                        style: TextStyle(
                                          color: Color(0xFF111827),
                                          fontSize: 16,
                                          fontFamily: 'SF Pro Display',
                                          fontWeight: FontWeight.w500,
                                          height: 1.30,
                                          letterSpacing: 0.16,
                                        ),
                                      ),
                                      box12,
                                      Row(
                                        children: [
                                          JobTypeButton(
                                            istapped: istapped,
                                            text: 'Full Time',
                                            width: 90,
                                          ),
                                          boxw12,
                                          JobTypeButton(
                                            istapped: istapped,
                                            text: 'Remote',
                                            width: 80,
                                          ),
                                          boxw12,
                                          JobTypeButton(
                                            istapped: istapped,
                                            text: 'Contract',
                                            width: 85,
                                          ),
                                        ],
                                      ),
                                      box12,
                                      Row(
                                        children: [
                                          JobTypeButton(
                                            istapped: istapped,
                                            text: 'Part Time',
                                            width: 95,
                                          ),
                                          boxw12,
                                          JobTypeButton(
                                            istapped: istapped,
                                            text: 'Onsite',
                                            width: 74,
                                          ),
                                          boxw12,
                                          JobTypeButton(
                                            istapped: istapped,
                                            text: 'Internship',
                                            width: 91,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 158,
                                      ),
                                      Container(
                                        width: 360,
                                        height: 48,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                              Color.fromRGBO(
                                                51,
                                                102,
                                                255,
                                                1,
                                              ),
                                            ),
                                            shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  1000,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "Show Result",
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
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      'assets/filter.png',
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  filterbutton(
                    'Remote',
                    88,
                    modalsheet,
                  ),
                  filterbutton(
                    'Full Time',
                    88,
                    funcnull,
                  ),
                  filterbutton(
                    'Post Data',
                    96,
                    funcnull,
                  ),
                  filterbutton(
                    'Experience Level',
                    130,
                    funcnull,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          gettitleforjob(),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                CustomJobSelection(
                  icon: 'assets/bluearchive.png',
                  titletext: 'assets/ttitle.svg',
                  wage: '\$10K',
                  jobbuttontext1: 'Fulltime',
                  jobbuttontext2: 'Remote',
                  width1: 80,
                  width2: 75,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomJobSelection(
                  icon: 'assets/blackarchive.png',
                  titletext: 'assets/spectrumtitle.svg',
                  wage: '\$10K',
                  jobbuttontext1: 'Fulltime',
                  jobbuttontext2: 'Remote',
                  width1: 80,
                  width2: 75,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomJobSelection(
                  icon: 'assets/blackarchive.png',
                  titletext: 'assets/vktitle.svg',
                  wage: '\$12K',
                  jobbuttontext1: 'Fulltime',
                  jobbuttontext2: 'Remote',
                  width1: 80,
                  width2: 75,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomJobSelection(
                  icon: 'assets/blackarchive.png',
                  titletext: 'assets/invisiontitle.svg',
                  wage: '\$9K',
                  jobbuttontext1: 'Part Time',
                  jobbuttontext2: 'Remote',
                  width1: 86,
                  width2: 75,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomJobSelection(
                  icon: 'assets/blackarchive.png',
                  titletext: 'assets/behancetitle.svg',
                  wage: '\$12K',
                  jobbuttontext1: 'Part Time',
                  jobbuttontext2: 'Remote',
                  width1: 86,
                  width2: 75,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> modalsheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 249,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              40,
              32,
              24,
              40,
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'On-Site/Remote',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF222741),
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 1.30,
                      letterSpacing: 0.18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    JobTypeButton(
                      istapped: istapped,
                      text: 'Remote',
                      width: 80,
                    ),
                    boxw12,
                    JobTypeButton(
                      istapped: istapped,
                      text: 'Onsite',
                      width: 74,
                    ),
                    boxw12,
                    JobTypeButton(
                      istapped: istapped,
                      text: 'Hybrid',
                      width: 74,
                    ),
                    boxw12,
                    JobTypeButton(
                      istapped: istapped,
                      text: 'Any',
                      width: 60,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 360,
                  height: 48,
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
                      "Show Result",
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
        );
      },
    );
  }
}

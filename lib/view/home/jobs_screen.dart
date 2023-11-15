// ignore_for_file: must_be_immutable, unused_local_variable

import 'dart:async';
import 'dart:convert';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/favorites_connection.dart';
import 'package:jobsque_amit_project/data/provider/filterjobprovider.dart';
import 'package:jobsque_amit_project/data/provider/job_search_provider.dart';

import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:jobsque_amit_project/view/home/nosearchfoundwidget.dart';
import 'package:jobsque_amit_project/widgets/custom_jobtype.dart';
import 'package:jobsque_amit_project/widgets/customalljobwidget.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'dart:core';
import 'package:http/http.dart' as varHttp;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/provider/job_provider.dart';

class JobsScreen extends StatefulWidget {
  JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  FavoritesConnection favoritesConnection = FavoritesConnection();
  bool istapped = false;
  bool istapped2 = false;
  var namecontroller = TextEditingController();
  var locationcontroller = TextEditingController();
  var salarycontroller = SingleValueDropDownController();
  List<String> jobtypelist = [];

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
      name: '17K-19K',
      value: "18000",
    ),
    DropDownValueModel(
      name: '15k-17k',
      value: "16000",
    ),
    DropDownValueModel(
      name: '19k-21k',
      value: "20000",
    ),
  ];
  String name = '';
  String location = '';
  String salary = '';
  bool filtred = false;
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobSeaarchProvider>(context);
    final jobProviderfilter = Provider.of<FilterJobProvider>(context);
    return Expanded(
      child: Column(
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
                            builder: (context, mystate) {
                              return SizedBox(
                                height: 650,
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
                                          InkWell(
                                            onTap: () {
                                              namecontroller.clear();
                                              locationcontroller.clear();
                                            },
                                            child: Text(
                                              'Reset',
                                              style: TextStyle(
                                                color: Color(0xFF3366FF),
                                                fontSize: 16,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w500,
                                                height: 1.30,
                                                letterSpacing: 0.16,
                                              ),
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
                                          controller: namecontroller,
                                          onChanged: (value) {
                                            name = value;
                                          },
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
                                          onChanged: (value) {
                                            location = value;
                                          },
                                          onTap: () {},
                                          keyboardType: TextInputType.name,
                                          controller: locationcontroller,
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
                                          clearOption: true,
                                          controller: salarycontroller,
                                          dropDownList: dropdown,
                                          textFieldDecoration: InputDecoration(
                                            suffixIcon: Image.asset(
                                              'aasets/arrow-down.png',
                                            ),
                                            prefixIcon: Image.asset(
                                              'assets/dollar-circle.png',
                                            ),
                                            hintText: '17k-19k',
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
                                            function: () {
                                              jobtypelist.add("Full time");
                                            },
                                          ),
                                          boxw12,
                                          JobTypeButton(
                                            istapped: istapped2,
                                            text: 'Remote',
                                            width: 80,
                                            function: () {
                                              jobtypelist.add("remote");
                                            },
                                          ),
                                          boxw12,
                                          JobTypeButton(
                                            istapped: istapped,
                                            text: 'Contract',
                                            width: 85,
                                            function: () {},
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
                                            function: () {},
                                          ),
                                          boxw12,
                                          JobTypeButton(
                                            istapped: istapped,
                                            text: 'Onsite',
                                            width: 74,
                                            function: () {},
                                          ),
                                          boxw12,
                                          JobTypeButton(
                                            istapped: istapped,
                                            text: 'Internship',
                                            width: 91,
                                            function: () {},
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
                                          onPressed: () async {
                                            setState(() {});
                                            mystate;
                                            mystate(
                                              () {},
                                            );

                                            final prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setBool(
                                              "isfiltred",
                                              true,
                                            );
                                            Navigator.pop(context);
                                            filtred =
                                                prefs.getBool("isfiltred")!;
                                            jobProviderfilter.fetchJobs(
                                              name,
                                              location,
                                              salarycontroller
                                                  .dropDownValue!.value,
                                              context,
                                            );

                                            setState(() {});
                                            mystate;
                                            mystate(
                                              () {},
                                            );
                                          },
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
          Container(
            alignment: Alignment.center,
            width: 1000,
            height: 36,
            decoration: ShapeDecoration(
              color: Color(0xFFF4F4F5),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color(
                    0xFFE5E7EB,
                  ),
                ),
              ),
            ),
            child: Center(
              child: filtred
                  ? Text(
                      ' ${jobProviderfilter.jobs.length} jobs',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.14,
                      ),
                    )
                  : Text(
                      ' ${jobProvider.jobs.length} jobs',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.14,
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          filtred
              ? jobProviderfilter.jobs.isNotEmpty
                  ? Expanded(
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: ListView.builder(
                            itemCount: jobProviderfilter.jobs.length,
                            itemBuilder: (context, index) {
                              final loc =
                                  jobProviderfilter.jobs[index].location;
                              final jobloc = loc.substring(0, 14);
                              return CustomAllJobs(
                                function: () async {
                                  await favoritesConnection.postDataWithId(
                                    jobProviderfilter.jobs[index].id,
                                    context,
                                  );
                                },
                                networkimage:
                                    jobProviderfilter.jobs[index].image,
                                jobname: jobProviderfilter.jobs[index].name,
                                jobplace:
                                    '${jobProviderfilter.jobs[index].comp_name}.${jobloc}',
                                jobdis:
                                    jobProviderfilter.jobs[index].job_time_type,
                                jobtype: jobProviderfilter.jobs[index].job_type,
                                jobsalary: jobProviderfilter.jobs[index].salary,
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          NoSearchFound(),
                        ],
                      ),
                    )
              : jobProvider.jobs.isNotEmpty
                  ? Expanded(
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          child: ListView.builder(
                            itemCount: jobProvider.jobs.length,
                            itemBuilder: (context, index) {
                              final loc = jobProvider.jobs[index].location;
                              final jobloc = loc.substring(0, 14);
                              return CustomAllJobs(
                                function: () async {
                                  await favoritesConnection.postDataWithId(
                                    jobProvider.jobs[index].id,
                                    context,
                                  );
                                },
                                networkimage: jobProvider.jobs[index].image,
                                jobname: jobProvider.jobs[index].name,
                                jobplace:
                                    '${jobProvider.jobs[index].comp_name}.${jobloc}',
                                jobdis: jobProvider.jobs[index].job_time_type,
                                jobtype: jobProvider.jobs[index].job_type,
                                jobsalary: jobProvider.jobs[index].salary,
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          NoSearchFound(),
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
                      function: () {},
                    ),
                    boxw12,
                    JobTypeButton(
                      istapped: istapped,
                      text: 'Onsite',
                      width: 74,
                      function: () {},
                    ),
                    boxw12,
                    JobTypeButton(
                      istapped: istapped,
                      text: 'Hybrid',
                      width: 74,
                      function: () {},
                    ),
                    boxw12,
                    JobTypeButton(
                      istapped: istapped,
                      text: 'Any',
                      width: 60,
                      function: () {},
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

import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAllJobs extends StatefulWidget {
  String networkimage;
  String jobname;
  String jobplace;
  String jobdis;
  String jobtype;
  String jobsalary;
  Function function;
  CustomAllJobs({
    super.key,
    required this.networkimage,
    required this.jobname,
    required this.jobplace,
    required this.jobdis,
    required this.jobtype,
    required this.jobsalary,
    required this.function,
  });

  @override
  State<CustomAllJobs> createState() => _CustomAllJobsState();
}

class _CustomAllJobsState extends State<CustomAllJobs> {
  Future<bool> getissaved() async {
    final prefs = await SharedPreferences.getInstance();
    final issaved = prefs.getBool("issaved");
    return issaved as bool;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 140,
      padding: EdgeInsets.only(
        bottom: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                child: Image.network(
                  widget.networkimage,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      widget.jobname,
                      style: TextStyle(
                        color: Color(0xFF111827),
                        fontSize: 18,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    child: Text(
                      widget.jobplace,
                      style: TextStyle(
                        color: Color(0xFF374151),
                        fontSize: 12,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 59,
              ),
              InkWell(
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool("issaved", true);
                  setState(() {});
                  widget.function();
                },
                child: getissaved().then((value) => value) == true
                    ? Image.asset(
                        "assets/bluearchive.png",
                      )
                    : Image.asset(
                        "assets/blackarchive.png",
                      ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getjobdis(
                widget.jobdis,
              ),
              SizedBox(
                width: 4,
              ),
              getjobdis(
                widget.jobtype,
              ),
              SizedBox(
                width: 50,
              ),
              SizedBox(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.jobsalary}L.E',
                        style: TextStyle(
                          color: Color(0xFF2E8E18),
                          fontSize: 16,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.16,
                        ),
                      ),
                      TextSpan(
                        text: '/Month',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 0.12,
                          letterSpacing: 0.12,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getjobdis(
    String text,
  ) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(
          0xffD6E4FF,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
      ),
      height: 26,
      padding: EdgeInsets.fromLTRB(
        16,
        4,
        16,
        4,
      ),
      child: Center(
        child: AutoSizeText(
          text,
          style: TextStyle(
            color: Color(0xFF3366FF),
            fontSize: 12,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.12,
          ),
        ),
      ),
    );
  }
}

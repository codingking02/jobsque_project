import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuggestedJob extends StatefulWidget {
  SuggestedJob({
    super.key,
    required this.networkimage,
    required this.jobname,
    required this.jobplace,
    required this.function,
    required this.jobdis,
    required this.jobtype,
    required this.jobsalary,
    required this.function1,
  });
  String networkimage;
  String jobname;
  String jobplace;
  Function function;
  String jobdis;
  String jobtype;
  String jobsalary;
  Function function1;
  @override
  State<SuggestedJob> createState() => _SuggestedJobState();
}

class _SuggestedJobState extends State<SuggestedJob> {
  SharedPreferences? sharedPreferences;
  String selectedImage = 'whitearchive.png';
  // Default image

  @override
  void initState() {
    super.initState();
    loadSelectedImage();
    initializeSharedPreferences();
  }

  Future<void> loadSelectedImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedImage = prefs.getString('selectedImage') ?? selectedImage;
    });
  }

  Future<void> saveSelectedImage(String imageName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedImage', imageName);
    setState(() {
      selectedImage = imageName;
    });
  }

  Future<void> initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 183,
      padding: EdgeInsets.fromLTRB(
        16,
        18,
        16,
        18,
      ),
      decoration: ShapeDecoration(
        color: Color.fromARGB(255, 173, 12, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: Image.network(
                      widget.networkimage ?? '',
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
                          widget.jobname ?? '',
                          style: TextStyle(
                            color: Colors.white,
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
                          widget.jobplace ?? '',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  setState(() {});
                  widget.function();
                  saveSelectedImage(
                    "bluearchive.png",
                  );
                  setState(() {});
                },
                child: Image.asset('assets/$selectedImage'),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getjobdis(
                widget.jobdis,
              ),
              SizedBox(
                width: 10,
              ),
              getjobdis(
                widget.jobtype,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.jobsalary}L.E',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.16,
                        ),
                      ),
                      TextSpan(
                        text: '/Month',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 17,
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
              ),
              InkWell(
                onTap: () {
                  widget.function1();
                },
                child: Container(
                  width: 96,
                  height: 32,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: ShapeDecoration(
                    color: Color(0xFF3366FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Apply now',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.12,
                        ),
                      ),
                    ],
                  ),
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
        color: Color.fromRGBO(
          255,
          255,
          255,
          0.14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
      ),
      height: 30,
      width: 87,
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
            color: Colors.white,
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

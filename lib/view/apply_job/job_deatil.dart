import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsque_amit_project/data/provider/job_provider.dart';
import 'package:jobsque_amit_project/view/apply_job/applyjob1.dart';
import 'package:jobsque_amit_project/widgets/images.dart';
import 'package:jobsque_amit_project/widgets/jobdetailwidget.dart';
import 'package:provider/provider.dart';

class JobDetail extends StatefulWidget {
  JobDetail({super.key});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  bool ispressedDes = true;
  bool ispressedComp = false;
  bool ispressedPeo = false;
  EdgeInsetsGeometry margin24 = EdgeInsets.symmetric(
    horizontal: 24,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: margin24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: Image.asset(
                    'assets/arrow-left.png',
                  ),
                ),
                Text(
                  'Job Detail',
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
                Image.asset(
                  'assets/bluearchive.png',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Center(
            child: JobDetailWidget(),
          ),
          SizedBox(
            height: 32,
          ),
          Center(
            child: CustomButton(),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Stack(
              children: [
                ispressedDes
                    ? Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Text(
                              'Job Description',
                              style: TextStyle(
                                color: Color(0xFF111827),
                                fontSize: 14,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0.10,
                                letterSpacing: 0.14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            AutoSizeText(
                              context.read<JobProvider>().job_description,
                              maxLines: 9,
                              style: TextStyle(
                                color: Color(0xFF4B5563),
                                fontSize: 12,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.12,
                                height: 1.7,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Skill Required',
                              style: TextStyle(
                                color: Color(0xFF111827),
                                fontSize: 14,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0.10,
                                letterSpacing: 0.14,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            AutoSizeText(
                              context.read<JobProvider>().job_skill,
                              maxLines: 9,
                              style: TextStyle(
                                color: Color(0xFF4B5563),
                                fontSize: 12,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                                height: 1.7,
                                letterSpacing: 0.12,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ispressedComp
                        ? Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    color: Color(0xFF111827),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    height: 0.10,
                                    letterSpacing: 0.14,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    getcontactus(
                                      'Email',
                                      context.read<JobProvider>().comp_email,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    getcontactus(
                                      'Website',
                                      context.read<JobProvider>().comp_website,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    color: Color(0xFF111827),
                                    fontSize: 14,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w500,
                                    height: 0.10,
                                    letterSpacing: 0.14,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                AutoSizeText(
                                  context.read<JobProvider>().about_comp,
                                  maxLines: 9,
                                  style: TextStyle(
                                    color: Color(0xFF4B5563),
                                    fontSize: 12,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    height: 1.7,
                                    letterSpacing: 0.12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ispressedPeo
                            ? ListView(
                                physics: BouncingScrollPhysics(),
                                children: [
                                  SvgPicture.asset(
                                    'assets/uidesigncontent.svg',
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  SvgPicture.asset(
                                    'assets/dimas.svg',
                                  ),
                                  SvgPicture.asset(
                                    'assets/syahrul.svg',
                                  ),
                                  SvgPicture.asset(
                                    'assets/farrel.svg',
                                  ),
                                  SvgPicture.asset(
                                    'assets/azza.svg',
                                  ),
                                  SvgPicture.asset(
                                    'assets/dindra.svg',
                                  ),
                                  SvgPicture.asset(
                                    'assets/ferdi.svg',
                                  ),
                                ],
                              )
                            : Text(''),
                Positioned(
                  top: 382,
                  left: 40,
                  child: Container(
                    width: 327,
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
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ApplyJob1();
                            },
                          ),
                        );
                        setState(() {});
                      },
                      child: Text(
                        'Apply now',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget CustomButton() {
    return Container(
      width: 327,
      height: 46,
      padding: const EdgeInsets.all(3),
      decoration: ShapeDecoration(
        color: Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                ispressedDes = !ispressedDes;
                ispressedComp = false;
                ispressedPeo = false;
                setState(() {});
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: ispressedDes ? Color(0xFF02337A) : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Desicription',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ispressedDes ? Colors.white : Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                ispressedComp = !ispressedComp;
                ispressedDes = false;
                ispressedPeo = false;
                setState(() {});
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: ispressedComp ? Color(0xFF02337A) : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Company',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ispressedComp ? Colors.white : Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                ispressedPeo = !ispressedPeo;
                ispressedDes = false;
                ispressedComp = false;
                setState(() {});
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: ispressedPeo ? Color(0xFF02337A) : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'People',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ispressedPeo ? Colors.white : Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getcontactus(String texttype, String textvalue) {
    return Container(
      clipBehavior: Clip.none,
      width: 175,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: AutoSizeText(
              texttype,
              maxLines: 1,
              style: TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 12,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.12,
              ),
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: double.infinity,
            child: AutoSizeText(
              textvalue,
              maxLines: 1,
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
    );
  }
}

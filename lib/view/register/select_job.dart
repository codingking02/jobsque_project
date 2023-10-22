import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/profile_controller.dart';
import 'package:jobsque_amit_project/data/model/joblist.dart';
import 'package:jobsque_amit_project/view/register/select_country.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

import '../../widgets/customejob_widget.dart';

class SelectJob extends StatefulWidget {
  const SelectJob({super.key});

  @override
  State<SelectJob> createState() => _SelectJobState();
}

class _SelectJobState extends State<SelectJob> {
  ProfileConnection profileConnection = ProfileConnection();
  List<String> interesetedjobs = [];
  List<joblist> myjoblist = [
    joblist(
      jobicon: 'assets/linear.png',
      jobtext: 'UI/UX Design',
      coloredjobicon: 'assets/bezier.png',
      height: 125,
    ),
    joblist(
      jobicon: 'assets/Ilustrator Category.png',
      jobtext: 'Ilustrator Designer',
      coloredjobicon: 'assets/Ilustrator Category.png',
      height: 125,
    ),
    joblist(
      jobicon: 'assets/Developer Category.png',
      jobtext: 'Developer',
      coloredjobicon: 'assets/Developer Category.png',
      height: 125,
    ),
    joblist(
      jobicon: 'assets/Management Category.png',
      jobtext: 'Management',
      coloredjobicon: 'assets/Management Category.png',
      height: 125,
    ),
    joblist(
      jobicon: 'assets/Information technology category.png',
      jobtext: 'Information Technologi',
      coloredjobicon: 'assets/Information technology category.png',
      height: 146,
    ),
    joblist(
      jobicon: 'assets/clouduncolored.png',
      jobtext: 'Research and Analytics',
      coloredjobicon: 'assets/cloud.png',
      height: 146,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xFFFFFFFF,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gettopbarimage(),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Image.asset(
                'assets/jobtitle.png',
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Container(
                  child: GridView.builder(
                    itemCount: myjoblist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1.1,
                    ),
                    itemBuilder: (context, index) {
                      return JobCard(
                        jobicon: myjoblist[index].jobicon,
                        jobkind: myjoblist[index].jobtext,
                        coloredjobicon: myjoblist[index].coloredjobicon,
                        height: myjoblist[index].height,
                        function: () {
                          switch (myjoblist[index].jobtext) {
                            case "UI/UX Design":
                              interesetedjobs.add("UI/UX Design");
                              break;
                            case "Ilustrator Designer":
                              interesetedjobs.add("Ilustrator Designer");
                              break;
                            case "Developer":
                              interesetedjobs.add("Developer");
                              break;
                            case "Management":
                              interesetedjobs.add("Management");
                              break;
                            case "Information Technologi":
                              interesetedjobs.add("Information Technologi");
                              break;
                            case "Research and Analytics":
                              interesetedjobs.add("Research and Analytics");
                              break;
                            default:
                              print("default");
                          }
                        },
                        secfunction: () {
                          interesetedjobs.remove(myjoblist[index].jobtext);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 24,
                bottom: 30,
              ),
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
                  ),
                ),
                onPressed: () async {
                  await profileConnection.updateinterstedjob(
                      interesetedjobs, context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectCountry(),
                    ),
                  );
                  print(interesetedjobs);
                  print(myjoblist.length);
                },
                child: Text(
                  'Next',
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
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/data/provider/profilenameprovider.dart';
import 'package:jobsque_amit_project/view/home/homesearchscree.dart';
import 'package:jobsque_amit_project/widgets/customsearchbar.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreenWidget extends StatefulWidget {
  HomeScreenWidget({
    super.key,
  });
  String email = HomeScreen.email;
  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  TextEditingController textEditingController = TextEditingController();
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
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, ${context.watch<Profilename>().username}👋',
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 24,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: 0.24,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Create a better future for yourself here',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color.fromRGBO(
                            209,
                            213,
                            219,
                            1,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(
                          1000,
                        ),
                      ),
                    ),
                    child: Image.asset(
                      'assets/notification.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearch(
                    textEditingController: textEditingController,
                    width: 327,
                    ontap: funcnull,
                    onsub: funcnull,
                    onchange: funcnull,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Suggested Job',
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 18,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.30,
                          letterSpacing: 0.18,
                        ),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                          color: Color(0xFF3366FF),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        getSvgPicture(
                          'assets/zoomjob.svg',
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        getSvgPicture(
                          'assets/slackjob.svg',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reccent Job',
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 18,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.30,
                          letterSpacing: 0.18,
                        ),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                          color: Color(0xFF3366FF),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getjob(
                    title: 'assets/twittertitle.svg',
                    icon: 'assets/blackarchive.png',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getjob(
                    title: 'assets/discordtitle.svg',
                    icon: 'assets/blackarchive.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

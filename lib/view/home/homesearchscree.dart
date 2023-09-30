// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/view/apply_job/active_appliedjobs.dart';
import 'package:jobsque_amit_project/view/chat/messages.dart';
import 'package:jobsque_amit_project/view/home/homescreenwidget.dart';
import 'package:jobsque_amit_project/view/porfile_settings/profile.dart';
import 'package:jobsque_amit_project/view/saved_notification.dart/notificatio_ui.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgets = [
    HomeScreenWidget(),
    Messages(),
    Activejobs(),
    NotificationUi(),
    Profile(),
  ];

  int _selectedindex = 0;
  bool ishome = true;
  bool ismessage = false;
  bool isapplied = false;
  bool issaved = false;
  bool isprofile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets.elementAt(
        _selectedindex,
      ),
      bottomNavigationBar: Container(
        width: 375,
        height: 60,
        child: Column(
          children: [
            BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  _selectedindex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 1.40,
                letterSpacing: 0.30,
              ),
              unselectedFontSize: 10,
              unselectedItemColor: Color(
                0xFF9CA3AF,
              ),
              elevation: 0,
              backgroundColor: Color.fromRGBO(
                255,
                255,
                255,
                1,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: _selectedindex == 0
                      ? Image.asset(
                          'assets/home.png',
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _selectedindex == 2
                                  ? _selectedindex = _selectedindex - 2
                                  : null;
                              _selectedindex == 1
                                  ? _selectedindex = _selectedindex - 1
                                  : null;
                              _selectedindex == 3
                                  ? _selectedindex = _selectedindex - 3
                                  : null;
                              _selectedindex == 4
                                  ? _selectedindex = _selectedindex - 4
                                  : null;
                            });
                          },
                          child: Image.asset(
                            'assets/whitehome.png',
                          ),
                        ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _selectedindex == 1
                      ? Image.asset(
                          'assets/bluemessage.png',
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _selectedindex == 0
                                  ? _selectedindex = _selectedindex + 1
                                  : null;
                              _selectedindex == 2
                                  ? _selectedindex = _selectedindex - 1
                                  : null;
                              _selectedindex == 3
                                  ? _selectedindex = _selectedindex - 2
                                  : null;
                              _selectedindex == 4
                                  ? _selectedindex = _selectedindex - 3
                                  : null;
                            });
                          },
                          child: Image.asset(
                            'assets/message.png',
                          ),
                        ),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: _selectedindex == 2
                      ? Image.asset(
                          'assets/bluebriefcase.png',
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _selectedindex == 0
                                  ? _selectedindex = _selectedindex + 2
                                  : null;
                              _selectedindex == 1
                                  ? _selectedindex = _selectedindex + 1
                                  : null;
                              _selectedindex == 3
                                  ? _selectedindex = _selectedindex - 1
                                  : null;
                              _selectedindex == 4
                                  ? _selectedindex = _selectedindex - 2
                                  : null;
                            });
                          },
                          child: Image.asset(
                            'assets/briefcase.png',
                          ),
                        ),
                  label: 'Applied',
                ),
                BottomNavigationBarItem(
                  icon: _selectedindex == 3
                      ? Image.asset(
                          'assets/bluearchive.png',
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _selectedindex == 0
                                  ? _selectedindex = _selectedindex + 3
                                  : null;
                              _selectedindex == 1
                                  ? _selectedindex = _selectedindex + 2
                                  : null;
                              _selectedindex == 2
                                  ? _selectedindex = _selectedindex + 1
                                  : null;
                              _selectedindex == 4
                                  ? _selectedindex = _selectedindex - 1
                                  : null;
                            });
                          },
                          child: Image.asset(
                            'assets/greyarchive.png',
                          ),
                        ),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: _selectedindex == 4
                      ? Image.asset(
                          'assets/blueprofile.png',
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _selectedindex == 0
                                  ? _selectedindex = _selectedindex + 4
                                  : null;
                              _selectedindex == 1
                                  ? _selectedindex = _selectedindex + 3
                                  : null;
                              _selectedindex == 2
                                  ? _selectedindex = _selectedindex + 2
                                  : null;
                              _selectedindex == 3
                                  ? _selectedindex = _selectedindex + 1
                                  : null;
                            });
                          },
                          child: Image.asset(
                            'assets/profile.png',
                          ),
                        ),
                  label: 'profile',
                ),
              ],
              currentIndex: _selectedindex,
              selectedLabelStyle: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                height: 1.40,
                letterSpacing: 0.30,
              ),
              selectedItemColor: Color(
                0xFF3366FF,
              ),
              selectedFontSize: 10,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/widgets/customnotification.dart';

import '../../widgets/widgets.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool istoggled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: getheader(text: 'Notification', width: 110),
          ),
          Expanded(
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    width: 1000,
                    child: SvgPicture.asset(
                      'assets/jobnotification.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomNotification(
                    text: 'Your Search Alert',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomNotification(
                    text: 'Job Application Update',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomNotification(
                    text: 'Job Application Reminders',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomNotification(
                    text: 'Job You May Be Interested In',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomNotification(
                    text: 'Your Search Alert',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    width: 1000,
                    child: SvgPicture.asset(
                      'assets/othernotification.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  CustomNotification(
                    text: 'Show Profile',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomNotification(
                    text: 'All Message',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                  CustomNotification(
                    text: 'Message Nudges',
                  ),
                  Divider(
                    thickness: 1.5,
                    color: Color(
                      0xffD1D5DB,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class NotificationUi extends StatelessWidget {
  const NotificationUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: getSvgPicture(
              'assets/Notification.svg',
            ),
          ),
          Positioned(
            left: 24,
            top: 160,
            child: Image.asset(
              'assets/dana.png',
            ),
          ),
          Positioned(
            left: 24,
            top: 370,
            child: Image.asset(
              'assets/facebook2.png',
            ),
          ),
          Positioned(
            left: 24,
            top: 300,
            child: Image.asset(
              'assets/slack2.png',
            ),
          ),
          Positioned(
            top: 230,
            left: 24,
            child: Image.asset(
              'assets/shoope.png',
            ),
          ),
        ],
      ),
    );
  }
}

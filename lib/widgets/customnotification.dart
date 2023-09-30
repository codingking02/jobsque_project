// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomNotification extends StatefulWidget {
  String text;
  CustomNotification({
    super.key,
    required this.text,
  });

  @override
  State<CustomNotification> createState() => _CustomNotificationState();
}

class _CustomNotificationState extends State<CustomNotification> {
  bool istoggled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      width: 327,
      height: 62,
      padding: const EdgeInsets.symmetric(
        vertical: 18,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.16,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    istoggled = !istoggled;
                  });
                },
                child: istoggled
                    ? Image.asset(
                        'assets/toggleon.png',
                      )
                    : Image.asset(
                        'assets/toggleoff.png',
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

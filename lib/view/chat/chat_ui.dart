import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class ChatUi extends StatelessWidget {
  const ChatUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          gettopbarimage(),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        getSvgPicture(
                          "assets/arrow-left.svg",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/twitterlogochat.png",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Twitter',
                          style: TextStyle(
                            color: Color(0xFF111827),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.16,
                          ),
                        ),
                      ],
          ),
          Positioned(
            top: 55,
            left: 70,
            child: Image.asset(
              'assets/twitterlogo.png',
            ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

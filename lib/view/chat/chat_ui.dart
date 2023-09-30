import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class ChatUi extends StatelessWidget {
  const ChatUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 375,
                    child: getSvgPicture(
                      'assets/menu.svg',
                    ),
                  );
                },
              );
            },
            child: getSvgPicture(
              'assets/chat.svg',
            ),
          ),
          Positioned(
            top: 55,
            left: 70,
            child: Image.asset(
              'assets/twitterlogo.png',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/profile_controller.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

// ignore: must_be_immutable
class Language extends StatelessWidget {
  Language({super.key});
  ProfileConnection profileConnection = ProfileConnection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
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
                child: Column(
                  children: [
                    getheader(
                      text: 'Language',
                      width: 110,
                      function: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () async {
                        await profileConnection.updatelanguage("en", context);
                      },
                      child: getSvgPicture(
                        'assets/Lang0.svg',
                      ),
                    ),
                    getSvgPicture(
                      'assets/Language1.svg',
                    ),
                    getSvgPicture(
                      'assets/Language2.svg',
                    ),
                    getSvgPicture(
                      'assets/Language3.svg',
                    ),
                    getSvgPicture(
                      'assets/Language4.svg',
                    ),
                    getSvgPicture(
                      'assets/Language5.svg',
                    ),
                    getSvgPicture(
                      'assets/Language6.svg',
                    ),
                    getSvgPicture(
                      'assets/Language7.svg',
                    ),
                    getSvgPicture(
                      'assets/Language8.svg',
                    ),
                    getSvgPicture(
                      'assets/Lang9.svg',
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            left: 24,
            top: 142,
            child: Image.asset(
              'assets/England.png',
            ),
          ),
          Positioned(
            left: 24,
            top: 205,
            child: Image.asset(
              'assets/Indonesia.png',
            ),
          ),
          Positioned(
            top: 270,
            left: 24,
            child: Image.asset(
              'assets/Saudi.png',
            ),
          ),
          Positioned(
            left: 24,
            top: 332,
            child: Image.asset(
              'assets/China.png',
            ),
          ),
          Positioned(
            left: 24,
            top: 398,
            child: Image.asset(
              'assets/Netherlands.png',
            ),
          ),
          Positioned(
            left: 24,
            top: 525,
            child: Image.asset(
              'assets/Germany.png',
            ),
          ),
          Positioned(
            left: 24,
            top: 460,
            child: Image.asset(
              'assets/France.png',
            ),
          ),
          Positioned(
            left: 24,
            top: 588,
            child: Image.asset(
              'assets/Japan.png',
            ),
          ),
          Positioned(
            left: 26,
            top: 653,
            child: Image.asset(
              'assets/Korea.png',
            ),
          ),
          Positioned(
            top: 717,
            left: 24,
            child: Image.asset(
              'assets/Portugal.png',
            ),
          ),
        ],
      ),
    );
  }
}

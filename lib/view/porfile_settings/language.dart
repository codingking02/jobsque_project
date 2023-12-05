import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/profile_controller.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

// ignore: must_be_immutable
class Language extends StatefulWidget {
  Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  ProfileConnection profileConnection = ProfileConnection();

  List<String> languages = [
    "English",
    "Indonesia",
    "Arabic",
    "Chineese",
    "Dutch",
    "French",
    "German",
    "Japanese",
    "Korean",
    "Portuguese"
  ];

  bool istapped = false;

  int selectedIndex = -1;

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
            child: Column(
              children: [
                getheader(
                  text: 'Language',
                  width: 110,
                  function: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 700,
                  child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            selectedIndex = index; // Update the selected index
                          });
                          await profileConnection.updatelanguage(
                            languages[index],
                            context,
                          );
                        },
                        child: Container(
                          height: 64,
                          width: 1000,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/${languages[index]}.png",
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    languages[index],
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
                              selectedIndex == index
                                  ? Image.asset(
                                      'assets/bluecircle.png',
                                    )
                                  : Image.asset(
                                      'assets/circle.png',
                                    ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

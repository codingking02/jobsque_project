import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/widgets/customsearchbar.dart';
import '../../widgets/widgets.dart';

class Messages extends StatefulWidget {
  Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  bool isunread = false;

  bool isspam = false;

  bool isarchieved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/arrow-left.svg',
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      Text(
                        'Messages',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 20,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.20,
                          letterSpacing: 0.20,
                        ),
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
                    CustomSearch(
                      onchange: funcnull,
                      onsub: funcnull,
                      ontap: funcnull,
                      textEditingController: TextEditingController(),
                      width: 280,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20.0),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.fromLTRB(
                                24,
                                36,
                                24,
                                0,
                              ),
                              height: 309,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Message filters',
                                    style: TextStyle(
                                      color: Color(0xFF111827),
                                      fontSize: 18,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.18,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  getmessagebutton(
                                    function: () {
                                      isunread = true;
                                      isspam = false;

                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    text: 'Unread',
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  getmessagebutton(
                                    function: () {
                                      isspam = true;
                                      isunread = false;
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    text: 'Spam',
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  getmessagebutton(
                                    function: () {
                                      isarchieved = !isarchieved;

                                      Navigator.pop(context);
                                    },
                                    text: 'Archieved',
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: getSvgPicture(
                        'assets/messagefilter.svg',
                      ),
                    ),
                  ],
                ),
                isunread
                    ? Stack(
                        children: [
                          Positioned(
                            top: 195,
                            left: 13,
                            child: Image.asset(
                              'assets/dana.png',
                            ),
                          ),
                          Positioned(
                            top: 82,
                            left: 10,
                            child: Image.asset(
                              'assets/twitterchatlogo.png',
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 140,
                            child: Image.asset(
                              'assets/gojeklogo.png',
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              InkWell(
                                onTap: () {
                                  isunread = false;
                                  setState(() {});
                                },
                                child: getSvgPicture(
                                  'assets/unread.svg',
                                ),
                              ),
                              SizedBox(
                                height: 21,
                              ),
                              getSvgPicture(
                                'assets/twitterchat.svg',
                              ),
                              getSvgPicture(
                                'assets/gojek.svg',
                              ),
                              getSvgPicture(
                                'assets/danachat.svg',
                              ),
                            ],
                          ),
                        ],
                      )
                    : isspam
                        ? Column(
                            children: [
                              SizedBox(
                                height: 106,
                              ),
                              getSvgPicture(
                                'assets/nomessages.svg',
                              ),
                              getSvgPicture(
                                'assets/nomessagesinfo.svg',
                              ),
                            ],
                          )
                        : Stack(
                            children: [
                              Positioned(
                                top: 170 + 28,
                                child: Image.asset(
                                  'assets/dana.png',
                                ),
                              ),
                              Positioned(
                                top: 6 + 28,
                                child: Image.asset(
                                  'assets/twitterchatlogo.png',
                                ),
                              ),
                              Positioned(
                                top: 60 + 28,
                                child: Image.asset(
                                  'assets/gojeklogo.png',
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 28,
                                  ),
                                  getSvgPicture(
                                    'assets/twitterchat.svg',
                                  ),
                                  getSvgPicture(
                                    'assets/gojek.svg',
                                  ),
                                  getSvgPicture(
                                    'assets/shoopechat.svg',
                                  ),
                                  getSvgPicture(
                                    'assets/danachat.svg',
                                  ),
                                  getSvgPicture(
                                    'assets/slackchat.svg',
                                  ),
                                  getSvgPicture(
                                    'assets/facebookchat.svg',
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 115 + 28,
                                child: Image.asset(
                                  'assets/shoope.png',
                                ),
                              ),
                              Positioned(
                                top: 226 + 28,
                                child: Image.asset(
                                  'assets/slack2.png',
                                ),
                              ),
                              Positioned(
                                top: 285 + 28,
                                child: Image.asset(
                                  'assets/facebook2.png',
                                ),
                              ),
                            ],
                          ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getmessagebutton({
    required Function function,
    required String text,
  }) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        height: 49,
        width: 327,
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
              100,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Color(0xFF374151),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.16,
                ),
              ),
              Image.asset(
                'assets/arrow-right.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

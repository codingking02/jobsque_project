import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class ChatUi extends StatelessWidget {
  const ChatUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2,
              child: Container(
                height: 125,
                color: Color(0XFFFFFFFF),
                child: Column(
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
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: getSvgPicture(
                                      "assets/arrow-left.svg",
                                    ),
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
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.vertical(
                                        top: Radius.circular(
                                          16,
                                        ),
                                      ),
                                    ),
                                    isScrollControlled: true,
                                    builder: (context) {
                                      return SizedBox(
                                        height: 471,
                                        child: getSvgPicture(
                                          "assets/menu.svg",
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Image.asset(
                                  "assets/morechat.png",
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/Vector.png",
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Today,  Nov 13',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      height: 0.12,
                      letterSpacing: 0.12,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Image.asset(
                    "assets/Vector.png",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            getsendercontainer(
              "Hi Rafif!, I'm Melan the selection team from Twitter. Thank you for applying for a job at our company. We have announced that you are eligible for the interview stage.",
              272,
              138,
            ),
            getyoursendscontainer(
              "Hi Melan, thank you for considering me, this is good news for me.",
              237,
              78,
            ),
            getsendercontainer(
              "Can we have an interview via google meet call today at 3pm?",
              272,
              78,
            ),
            getyoursendscontainer(
              "Of course, I can!",
              119,
              58,
            ),
            getsendercontainer(
              "Ok, here I put the google meet link for later this afternoon. I ask for the timeliness, thank you!\nhttps://meet.google.com/dis-sxdu-ave",
              280,
              110,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: getSvgPicture(
                "assets/Messagechat.svg",
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getsendercontainer(
    String text,
    double width,
    double height,
  ) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 20,
      ),
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Color(0xFFE5E7EB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              child: AutoSizeText(
                text,
                maxLines: 5,
                style: TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 14,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.14,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(
                  top: 15,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    '10.18',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                      letterSpacing: 0.12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getyoursendscontainer(
    String text,
    double width,
    double height,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: Color(0xFF3366FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                child: AutoSizeText(
                  text,
                  maxLines: 5,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.14,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '10.18',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                    letterSpacing: 0.12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

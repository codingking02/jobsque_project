import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/customsearchbar.dart';
import 'package:jobsque_amit_project/widgets/customtextSearch.dart';

import '../../widgets/widgets.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});
  final bool customicon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  getheader(
                    text: "Help Center",
                    width: 100,
                    function: () {
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextSearch(
                    onchange: () {},
                    onsub: () {},
                    ontap: () {},
                    width: 1000,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getexpansiontile(),
                  getexpansiontile(),
                  getexpansiontile(),
                  getexpansiontile(),
                  getexpansiontile(),
                  getexpansiontile(),
                  getexpansiontile(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getexpansiontile() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
          side: BorderSide(
            color: Color(
              0xffD1D5DB,
            ),
          ),
        ),
      ),
      child: ExpansionTile(
        title: Text(
          'Lorem ipsum dolor sit amet',
          style: TextStyle(
            color: Color(0xFF111827),
            fontSize: 16,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 0.08,
            letterSpacing: 0.16,
          ),
        ),
        children: [
          Container(
            margin: EdgeInsets.all(
              10,
            ),
            child: AutoSizeText(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.",
              maxLines: 8,
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 14,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

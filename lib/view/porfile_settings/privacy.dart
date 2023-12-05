import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
                    text: "Privacy Policy",
                    width: 75,
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  getSvgPicture(
                    "assets/policy.svg",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  getSvgPicture(
                    "assets/policy2.svg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

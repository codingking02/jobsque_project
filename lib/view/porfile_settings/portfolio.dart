import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          gettopbarimage(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                getheader(text: 'Portfolio', width: 110),
                SizedBox(
                  height: 36,
                ),
                getSvgPicture(
                  'assets/addportfolio.svg',
                ),
                SizedBox(
                  height: 24,
                ),
                getSvgPicture(
                  'assets/myportfolio.svg',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

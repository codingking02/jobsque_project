import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoSearch extends StatelessWidget {
  const NoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/nosearch.svg',
            ),
            SizedBox(
              height: 24,
            ),
            SvgPicture.asset(
              'assets/nosearchinfo.svg',
            ),
          ],
        ),
      ),
    );
  }
}

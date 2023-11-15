import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class NoSearchFound extends StatelessWidget {
  const NoSearchFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          getSvgPicture(
            'assets/nosearch.svg',
          ),
          getSvgPicture(
            'assets/infom.svg',
          ),
        ],
      ),
    );
  }
}

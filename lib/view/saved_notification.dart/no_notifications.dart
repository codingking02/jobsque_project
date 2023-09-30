import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class No_Notification extends StatelessWidget {
  const No_Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getSvgPicture(
        'assets/emptynotification.svg',
      ),
    );
  }
}

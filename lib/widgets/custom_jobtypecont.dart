import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/data/provider/applyjobprovider.dart';
import 'package:provider/provider.dart';

class JobTypeCont extends StatefulWidget {
  final String text;
  const JobTypeCont({
    super.key,
    required this.text,
  });

  @override
  State<JobTypeCont> createState() => _JobTypeContState();
}

class _JobTypeContState extends State<JobTypeCont> {
  bool istapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        istapped = !istapped;
        setState(() {});
        context.read<ApplyJobProvider>().getworktype(
              widget.text,
            );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(
          16,
        ),
        height: 90,
        width: 1000,
        decoration: ShapeDecoration(
          color: istapped ? Color(0xffD6E4FF) : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: istapped
                  ? Color(
                      0xff3366FF,
                    )
                  : Color.fromRGBO(
                      209,
                      213,
                      219,
                      1,
                    ),
            ),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.16,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'CV.pdf . Portfolio.pdf',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.14,
                  ),
                ),
              ],
            ),
            istapped
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
  }
}

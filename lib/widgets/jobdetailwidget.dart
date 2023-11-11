import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/data/provider/job_provider.dart';
import 'package:provider/provider.dart';

class JobDetailWidget extends StatefulWidget {
  const JobDetailWidget({super.key});

  @override
  State<JobDetailWidget> createState() => _JobDetailWidgetState();
}

class _JobDetailWidgetState extends State<JobDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 148,
      child: Center(
        child: Column(
          children: [
            Container(
              height: 48,
              width: 48,
              child: Image.network(
                context.read<JobProvider>().image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            AutoSizeText(
              context.read<JobProvider>().jobname,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF111827),
                fontSize: 20,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${context.read<JobProvider>().comp_name}.${context.read<JobProvider>().location}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF374151),
                fontSize: 12,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 26,
                  width: 73,
                  decoration: ShapeDecoration(
                    color: Color(0xffD6E4FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      context.read<JobProvider>().job_time_type,
                      style: TextStyle(
                        color: Color(0xFF3366FF),
                        fontSize: 12,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 26,
                  width: 73,
                  decoration: ShapeDecoration(
                    color: Color(0xffD6E4FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      context.read<JobProvider>().job_type,
                      style: TextStyle(
                        color: Color(0xFF3366FF),
                        fontSize: 12,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

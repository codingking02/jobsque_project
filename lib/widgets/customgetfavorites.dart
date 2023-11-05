import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class GetFavoritesWidget extends StatefulWidget {
  String networkimage;
  String jobname;
  String jobplace;

  Function function;
  String timetext;
  GetFavoritesWidget({
    super.key,
    required this.networkimage,
    required this.jobname,
    required this.jobplace,
    required this.function,
    required this.timetext,
  });

  @override
  State<GetFavoritesWidget> createState() => _GetFavoritesWidgetState();
}

class _GetFavoritesWidgetState extends State<GetFavoritesWidget> {
  bool issaved = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 150,
      padding: EdgeInsets.only(
        bottom: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                child: Image.network(
                  widget.networkimage,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      widget.jobname,
                      style: TextStyle(
                        color: Color(0xFF111827),
                        fontSize: 18,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    child: Text(
                      widget.jobplace,
                      style: TextStyle(
                        color: Color(0xFF374151),
                        fontSize: 12,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 140,
              ),
              InkWell(
                onTap: () {
                  widget.function();
                },
                child: getSvgPicture(
                  'assets/more.svg',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Posted At ${widget.timetext}',
                style: TextStyle(
                  color: Color(0xFF374151),
                  fontSize: 12,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.12,
                ),
              ),
              Row(
                children: [
                  getSvgPicture(
                    'assets/clock.svg',
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Be an early applicant',
                    style: TextStyle(
                      color: Color(0xFF374151),
                      fontSize: 12,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

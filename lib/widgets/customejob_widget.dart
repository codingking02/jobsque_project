import 'package:flutter/material.dart';

class JobCard extends StatefulWidget {
  final String jobicon;
  final String jobkind;
  final String coloredjobicon;
  final double height;
  final Function function;
  final Function secfunction;

  const JobCard({
    super.key,
    required this.coloredjobicon,
    required this.height,
    required this.jobicon,
    required this.jobkind,
    required this.function,
    required this.secfunction,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool ispressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          ispressed = !ispressed;
          ispressed
              ? widget.function()
              : !ispressed
                  ? widget.secfunction()
                  : null;
        });
      },
      child: Container(
        width: 156,
        height: widget.height,
        decoration: BoxDecoration(
          color: ispressed
              ? Color.fromRGBO(
                  214,
                  228,
                  255,
                  1,
                )
              : Color(
                  0xFFFAFAFA,
                ),
          border: Border.fromBorderSide(
            BorderSide(
              color: ispressed
                  ? Color.fromRGBO(
                      51,
                      102,
                      255,
                      1,
                    )
                  : Color.fromRGBO(
                      209,
                      213,
                      219,
                      1,
                    ),
            ),
          ),
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(
                  20,
                ),
                width: 48,
                height: 48,
                decoration: ShapeDecoration(
                  color: ispressed
                      ? Colors.white
                      : Color.fromRGBO(
                          255,
                          255,
                          255,
                          1,
                        ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(
                      color: ispressed
                          ? Color.fromRGBO(
                              51,
                              102,
                              255,
                              1,
                            )
                          : Color.fromRGBO(
                              209,
                              213,
                              219,
                              1,
                            ),
                    ),
                  ),
                ),
                child: ispressed
                    ? Image.asset(
                        widget.coloredjobicon,
                      )
                    : Image.asset(
                        widget.jobicon,
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  widget.jobkind,
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    height: 1.30,
                    letterSpacing: 0.16,
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

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomApplyJob extends StatefulWidget {
  bool ispressedDes;
  bool ispressedcomp;
  bool ispressedpeo;

  CustomApplyJob({
    super.key,
    required this.ispressedDes,
    required this.ispressedcomp,
    required this.ispressedpeo,
  });

  @override
  State<CustomApplyJob> createState() => _CustomApplyJobState();
}

class _CustomApplyJobState extends State<CustomApplyJob> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 46,
      padding: const EdgeInsets.all(3),
      decoration: ShapeDecoration(
        color: Color(0xFFF4F4F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                widget.ispressedDes = !widget.ispressedDes;
                widget.ispressedcomp = false;
                widget.ispressedpeo = false;
                setState(() {});
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: widget.ispressedDes
                      ? Color(0xFF02337A)
                      : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Desicription',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: widget.ispressedDes
                            ? Colors.white
                            : Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                widget.ispressedcomp = !widget.ispressedcomp;
                widget.ispressedDes = false;
                widget.ispressedpeo = false;
                setState(() {});
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: widget.ispressedcomp
                      ? Color(0xFF02337A)
                      : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Company',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: widget.ispressedcomp
                            ? Colors.white
                            : Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                widget.ispressedpeo = !widget.ispressedpeo;
                widget.ispressedDes = false;
                widget.ispressedcomp = false;
                setState(() {});
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: widget.ispressedpeo
                      ? Color(0xFF02337A)
                      : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'People',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: widget.ispressedpeo
                            ? Colors.white
                            : Color(0xFF6B7280),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

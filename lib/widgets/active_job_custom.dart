import 'package:flutter/material.dart';

class ActiveJobCustom extends StatefulWidget {
  String text1;
  String text2;
  bool ispressed1;
  bool ispressed2;
  ActiveJobCustom({
    super.key,
    required this.text1,
    required this.text2,
    required this.ispressed1,
    required this.ispressed2,
  });

  @override
  State<ActiveJobCustom> createState() => _ActiveJobCustomState();
}

class _ActiveJobCustomState extends State<ActiveJobCustom> {
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
                setState(() {
                  widget.ispressed1 = true;
                  widget.ispressed2 = false;
                });
              },
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color:
                      widget.ispressed1 ? Color(0xFF091A7A) : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.text1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: widget.ispressed1
                            ? Color(0xFFF4F4F5)
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
                setState(() {
                  widget.ispressed2 = true;
                  widget.ispressed1 = false;
                });
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color:
                      widget.ispressed2 ? Color(0xFF091A7A) : Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.text2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: widget.ispressed2
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

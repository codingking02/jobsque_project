import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text1;
  final String text2;
  const CustomButton({super.key, required this.text1, required this.text2});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool ispressed = false;
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
                  ispressed = !ispressed;
                });
              },
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: ispressed ? Color(0xFF091A7A) : Color(0xFFF4F4F5),
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
                        color:
                            ispressed ? Color(0xFFF4F4F5) : Color(0xFF6B7280),
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
                  ispressed = !ispressed;
                });
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: ispressed ? Color(0xFFF4F4F5) : Color(0xFF091A7A),
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
                        color: ispressed ? Color(0xFF6B7280) : Colors.white,
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

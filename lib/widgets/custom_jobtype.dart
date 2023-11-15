// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class JobTypeButton extends StatefulWidget {
  JobTypeButton({
    super.key,
    required this.istapped,
    required this.text,
    required this.width,
    required this.function,
  });
  double width;
  bool istapped;
  String text;
  Function function;

  @override
  State<JobTypeButton> createState() => _JobTypeButtonState();
}

class _JobTypeButtonState extends State<JobTypeButton> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: widget.width,
          height: 34,
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStatePropertyAll(
                0,
              ),
              backgroundColor: widget.istapped
                  ? MaterialStatePropertyAll(
                      Color.fromRGBO(
                        214,
                        228,
                        255,
                        1,
                      ),
                    )
                  : MaterialStatePropertyAll(
                      Colors.white,
                    ),
              side: MaterialStatePropertyAll(
                BorderSide(
                  color: widget.istapped
                      ? Color.fromRGBO(
                          51,
                          102,
                          255,
                          1,
                        )
                      : Color.fromRGBO(
                          156,
                          163,
                          175,
                          1,
                        ),
                ),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
              ),
            ),
            onPressed: () {
              widget.function();
              setState(() {
                widget.istapped = !widget.istapped;
              });
            },
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.istapped
                    ? Color.fromRGBO(
                        51,
                        102,
                        255,
                        1,
                      )
                    : Color(0xFF6B7280),
                fontSize: 12,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                height: 1.50,
                letterSpacing: 0.12,
              ),
            ),
          ),
        );
      },
    );
  }
}

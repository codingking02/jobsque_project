import 'package:flutter/material.dart';

class CountryButton extends StatefulWidget {
  final String country;
  final String countryimage;
  final double width;
  const CountryButton({
    super.key,
    required this.width,
    required this.country,
    required this.countryimage,
  });

  @override
  State<CountryButton> createState() => _CountryButtonState();
}

class _CountryButtonState extends State<CountryButton> {
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          ispressed = !ispressed;
        });
      },
      child: Container(
        decoration: ShapeDecoration(
          color: ispressed
              ? Color.fromRGBO(
                  214,
                  228,
                  255,
                  1,
                )
              : Color.fromRGBO(
                  250,
                  250,
                  250,
                  1,
                ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ispressed
                  ? Color.fromRGBO(
                      51,
                      102,
                      255,
                      1,
                    )
                  : Color.fromRGBO(
                      229,
                      231,
                      235,
                      1,
                    ),
            ),
            borderRadius: BorderRadius.circular(
              100,
            ),
          ),
        ),
        height: 42,
        width: widget.width,
        child: Container(
          margin: EdgeInsets.only(
            left: 10,
          ),
          child: Row(
            children: [
              Image.asset(
                widget.countryimage,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                widget.country,
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 1.30,
                  letterSpacing: 0.16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

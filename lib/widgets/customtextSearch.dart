import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTextSearch extends StatefulWidget {
  double width;
  Function ontap;
  Function onsub;
  Function onchange;

  CustomTextSearch({
    super.key,
    required this.onchange,
    required this.onsub,
    required this.ontap,
    required this.width,
  });

  @override
  State<CustomTextSearch> createState() => _CustomTextSearchState();
}

class _CustomTextSearchState extends State<CustomTextSearch> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 48,
      child: TextField(
        controller: searchcontroller,
        onTap: () {
          widget.ontap();
          setState(() {});
        },
        onSubmitted: (value) async {
          widget.onsub();
          final prefs = await SharedPreferences.getInstance();
          prefs.setString(
            "searchinput",
            value,
          );
          setState(() {});
        },
        onChanged: (value) {
          widget.onchange();

          setState(() {});
        },
        autocorrect: false,
        enableSuggestions: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              100,
            ),
          ),
          contentPadding: EdgeInsetsDirectional.fromSTEB(
            12,
            0,
            12,
            0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              100,
            ),
            borderSide: BorderSide(
              color: Color.fromRGBO(
                209,
                213,
                219,
                1,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              100,
            ),
            borderSide: BorderSide(
              color: Color.fromRGBO(
                209,
                213,
                219,
                1,
              ),
            ),
          ),
          hintText: 'What Can We Help With',
          hintStyle: TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 14,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            height: 1.40,
            letterSpacing: 0.30,
          ),
          prefixIcon: Image.asset(
            'assets/search.png',
          ),
        ),
      ),
    );
  }
}

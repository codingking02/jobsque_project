import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  final double width;
  final Function ontap;
  final Function onsub;
  final Function onchange;
  final TextEditingController textEditingController;
  const CustomSearch({
    super.key,
    required this.onchange,
    required this.onsub,
    required this.ontap,
    required this.textEditingController,
    required this.width,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 48,
      child: TextField(
        controller: widget.textEditingController,
        onTap: () {
          widget.ontap();
          setState(() {});
        },
        onSubmitted: (value) {
          widget.onsub();
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
          hintText: 'Search....',
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

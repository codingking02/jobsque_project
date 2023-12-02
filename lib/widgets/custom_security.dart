import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/login_controller.dart';

// ignore: must_be_immutable
class CustomSecurity extends StatefulWidget {
  String text;
  bool isbool;
  String righttext;
  Function function;
  CustomSecurity({
    super.key,
    required this.text,
    required this.isbool,
    required this.righttext,
    required this.function,
  });

  @override
  State<CustomSecurity> createState() => _CustomSecurityState();
}

class _CustomSecurityState extends State<CustomSecurity> {
  LoginConnection loginConnection = LoginConnection();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      width: 327,
      height: 55,
      padding: const EdgeInsets.symmetric(
        vertical: 18,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.16,
                ),
              ),
              Row(
                children: [
                  widget.isbool
                      ? FutureBuilder(
                          future: loginConnection.getprofile(context),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              print(snapshot.data);

                              return Text(
                                '${snapshot.data!['email']}',
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  height: 0.10,
                                  letterSpacing: 0.14,
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }
                            // By default, show a loading indicator
                            return Text('');
                          },
                        )
                      : Text(
                          widget.righttext,
                          style: TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.14,
                          ),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      widget.function();
                    },
                    child: Image.asset(
                      'assets/right-arrow.png',
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

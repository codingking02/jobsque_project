import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/dio/dio_connection.dart';

// ignore: must_be_immutable
class CustomSecurity extends StatefulWidget {
  String text;
  bool isbool;
  String righttext;
  CustomSecurity({
    super.key,
    required this.text,
    required this.isbool,
    required this.righttext,
  });

  @override
  State<CustomSecurity> createState() => _CustomSecurityState();
}

class _CustomSecurityState extends State<CustomSecurity> {
  DioConnection dioConnection = DioConnection();

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
                          future: dioConnection.getusersdata(),
                          builder: (context, snapshot) {
                            return FutureBuilder(
                              future: dioConnection.getusersdata(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasData) {
                                  return Text(
                                    '${snapshot.data![1].email}',
                                    style: TextStyle(
                                      color: Color(0xFF6B7280),
                                      fontSize: 14,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.14,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    '',
                                  );
                                }
                              },
                            );
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
                  Image.asset(
                    'assets/right-arrow.png',
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
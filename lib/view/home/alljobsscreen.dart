import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../connections/favorites_connection.dart';
import '../../widgets/customalljobwidget.dart';
import 'package:http/http.dart' as varHttp;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  FavoritesConnection favoritesConnection = FavoritesConnection();
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String getalljobsendpoint = "jobs";
  final client = varHttp.Client();
  List<Map<String, dynamic>>? data = [] ?? [];
  Future<List<Map<String, dynamic>>?> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final headers1 = {
      'Authorization': 'Bearer ${prefs.getString("token")}',
      'Content-Type': 'application/json', // You can add other headers if needed
    };
    final headers2 = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json', // You can add other headers if needed
    };
    final response = await client.get(
      Uri.parse(
        baseUrl + getalljobsendpoint,
      ),
      headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return List<Map<String, dynamic>>.from(jsonData['data']);
    } else {
      throw Exception('Failed to load data');
    }
  }

  bool istapped = false;
  @override
  void initState() {
    super.initState();
    fetchData().then((result) {
      setState(() {
        data = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 1000,
          height: 36,
          decoration: ShapeDecoration(
            color: Color(0xFFF4F4F5),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Color(
                  0xFFE5E7EB,
                ),
              ),
            ),
          ),
          child: Center(
            child: Text(
              '${data!.length ?? ''} Job ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 14,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.14,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Expanded(
          child: Center(
            child: data == null
                ? CircularProgressIndicator()
                : Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: ListView.builder(
                      itemCount: data!.length == 0 ? 0 : data!.length,
                      itemBuilder: (context, index) {
                        final jobItem = data![index] ?? {};
                        String joblocation = jobItem['location'];
                        final jobloc = joblocation.substring(0, 14);

                        return CustomAllJobs(
                          function: () async {
                            await favoritesConnection.postDataWithId(
                              jobItem['id'],
                              context,
                            );
                          },
                          networkimage: jobItem['image'] ?? '',
                          jobname: jobItem['name'] ?? '',
                          jobplace: '${jobItem['comp_name']}.${jobloc}' ?? '',
                          jobdis: jobItem['job_time_type'] ?? '',
                          jobtype: jobItem['job_type'] ?? '',
                          jobsalary: jobItem['salary'] ?? '',
                        );
                      },
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

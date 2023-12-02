// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/favorites_connection.dart';
import 'package:jobsque_amit_project/connections/login_controller.dart';
import 'package:jobsque_amit_project/data/provider/job_provider.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:jobsque_amit_project/data/provider/useridprovider.dart';
import 'package:jobsque_amit_project/view/apply_job/job_deatil.dart';
import 'package:jobsque_amit_project/view/home/homesearchscree.dart';
import 'package:jobsque_amit_project/view/home/searchvalue.dart';
import 'package:jobsque_amit_project/view/saved_notification.dart/notificatio_ui.dart';
import 'package:jobsque_amit_project/widgets/customalljobwidget.dart';
import 'package:jobsque_amit_project/widgets/customsearchbar.dart';
import 'package:jobsque_amit_project/widgets/customsuggestedjob.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:http/http.dart' as varHttp;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenWidget extends StatefulWidget {
  HomeScreenWidget({
    super.key,
  });
  String email = HomeScreen.email;
  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  LoginConnection loginConnection = LoginConnection();
  FavoritesConnection favoritesConnection = FavoritesConnection();
  TextEditingController textEditingController = TextEditingController();
  bool ischange = false;
  bool istapped = false;
  bool issubmitted = false;
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String getalljobsendpoint = "jobs/sugest/2";
  final client = varHttp.Client();
  Future<Map<String, dynamic>> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final headers1 = {
      'Authorization': 'Bearer ${prefs.getString("token")}',
      'Content-Type': 'application/json', // You can add other headers if needed
    };
    final headers2 = {
      'Authorization': 'Bearer ${context.read<TokenProvider>().token}',
      'Content-Type': 'application/json', // You can add other headers if needed
    };
    // Replace with the actual API endpoint
    final response = await client.get(
      Uri.parse(
        baseUrl + getalljobsendpoint,
      ),
      headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      // Check if the 'status' is true
      if (jsonData['status'] == true) {
        // Access the 'data' field
        final data = jsonData['data'];
        return data;
      } else {
        throw Exception('Failed to fetch data.');
      }
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gettopbarimage(),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                        future: loginConnection.getprofile(context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print(snapshot.data);

                            return Text(
                              'Hi, ${snapshot.data!['name']}👋',
                              style: TextStyle(
                                color: Color(0xFF111827),
                                fontSize: 24,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w500,
                                height: 0.06,
                                letterSpacing: 0.24,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          // By default, show a loading indicator
                          return CircularProgressIndicator();
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Create a better future for yourself here',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color.fromRGBO(
                            209,
                            213,
                            219,
                            1,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(
                          1000,
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationUi(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/notification.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearch(
                    width: 327,
                    ontap: () {
                      istapped = true;
                      issubmitted = false;
                      ischange = false;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SearchValue();
                          },
                        ),
                      );
                    },
                    onsub: () {
                      istapped = false;
                      issubmitted = true;
                      ischange = false;
                    },
                    onchange: () {
                      istapped = false;
                      issubmitted = false;
                      ischange = true;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Suggested Job',
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 18,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.30,
                          letterSpacing: 0.18,
                        ),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                          color: Color(0xFF3366FF),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: FutureBuilder(
                        future: fetchData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            final data = snapshot.data;
                            String joblocation = data!['location'];
                            final jobloc = joblocation.substring(0, 14);
                            return SuggestedJob(
                              networkimage: data['image'],
                              jobname: data['name'],
                              jobplace: jobloc,
                              jobdis: data['job_time_type'],
                              jobtype: data['job_type'],
                              jobsalary: data['salary'],
                              function: () async {
                                await favoritesConnection.postDataWithId(
                                  data['id'],
                                  context,
                                );
                              },
                              function1: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                context.read<JobProvider>().getjobdata(
                                      data['name'],
                                      data['image'],
                                      data['job_time_type'],
                                      data['comp_email'],
                                      data['about_comp'],
                                      data['job_description'],
                                      data['job_skill'],
                                      data['comp_name'],
                                      data['job_type'],
                                      jobloc,
                                      data['comp_website'],
                                      data['id'],
                                      prefs.getBool("rememberme") == true
                                          ? prefs.getInt("userid")!
                                          : context
                                              .read<UserIdProvider>()
                                              .userid!,
                                    );

                                prefs.setInt(
                                  'jobid',
                                  data['id'],
                                );
                                dispose();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return JobDetail();
                                    },
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reccent Job',
                        style: TextStyle(
                          color: Color(0xFF111827),
                          fontSize: 18,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.30,
                          letterSpacing: 0.18,
                        ),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                          color: Color(0xFF3366FF),
                          fontSize: 14,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: FutureBuilder(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final data = snapshot.data;
                        String joblocation = data!['location'];
                        final jobloc = joblocation.substring(0, 14);
                        return CustomAllJobs(
                          networkimage: data['image'],
                          jobname: data['name'],
                          jobplace: jobloc,
                          jobdis: data['job_time_type'],
                          jobtype: data['job_type'],
                          jobsalary: data['salary'],
                          function: () async {
                            await favoritesConnection.postDataWithId(
                              data['id'],
                              context,
                            );
                          },
                        ); // Display the 'name' field, for example.
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

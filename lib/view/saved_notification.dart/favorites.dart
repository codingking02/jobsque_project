import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/favorites_connection.dart';
import 'package:jobsque_amit_project/data/provider/job_provider.dart';
import 'package:jobsque_amit_project/data/provider/tokenprovider.dart';
import 'package:jobsque_amit_project/view/apply_job/job_deatil.dart';
import 'package:jobsque_amit_project/widgets/customgetfavorites.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:http/http.dart' as varHttp;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  FavoritesConnection favoritesConnection = FavoritesConnection();
  List<Map<String, dynamic>> dataList = [];
  static String baseUrl = "https://project2.amit-learning.com/api/";
  static String postfavoritesendpoint = "favorites";
  late Timer timer;
  final client = varHttp.Client();
  bool? status;
  Future<void> fetchDataFromPostmanAPI() async {
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
        baseUrl + postfavoritesendpoint,
      ),
      headers: prefs.getBool("rememberme") == true ? headers1 : headers2,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      status = true;
      if (data['status'] == true) {
        dataList = List<Map<String, dynamic>>.from(data['data']);
      }
      print(response.body);
    } else {
      status = false;
      print(response.body);
      throw Exception('Failed to load data');
    }
    setState(() {}); // Trigger a rebuild to display the fetched data
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Call your continuous function here
      fetchDataFromPostmanAPI();
      setState(() {});
    });
  }

  void dispose() {
    // Don't forget to cancel the timer when the widget is disposed to avoid memory leaks
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: getheader(
              text: 'Saved',
              width: 120,
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
                '${status == true ? dataList.length : 0} Job Saved',
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
                child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: status == true
                  ? ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        final item = dataList[index];
                        final job = item['jobs'];
                        String joblocation = item['location'];
                        final jobloc = joblocation.substring(0, 14);
                        String createdat = item['created_at'];
                        final time = createdat.substring(0, 10);

                        return GetFavoritesWidget(
                          networkimage: item['image'],
                          jobname: job['name'],
                          jobplace: '${job['comp_name']}.${jobloc}',
                          function: () {
                            showModalBottomSheet(
                              isDismissible: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(
                                    16,
                                  ),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, mystate) {
                                  return SizedBox(
                                    height: 271,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Center(
                                            child: getSvgPicture(
                                              'assets/smallline.svg',
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              context
                                                  .read<JobProvider>()
                                                  .getjobdata(
                                                    job['name'],
                                                    item['image'],
                                                    job['job_time_type'],
                                                    job['comp_email'],
                                                    job['about_comp'],
                                                    job['job_description'],
                                                    job['job_skill'],
                                                    job['comp_name'],
                                                    job['job_type'],
                                                    jobloc,
                                                    job['comp_website'],
                                                    job['id'],
                                                    item['user_id'],
                                                  );
                                              final prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setInt(
                                                'userid',
                                                item['user_id'],
                                              );
                                              prefs.setInt(
                                                'jobid',
                                                job['id'],
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
                                            child: getSvgPicture(
                                              "assets/Apply.svg",
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          getSvgPicture(
                                            "assets/Share.svg",
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              setState(() {});
                                              mystate;
                                              mystate(
                                                () {},
                                              );
                                              fetchDataFromPostmanAPI();
                                              favoritesConnection.deleteSaved(
                                                item['id'],
                                                context,
                                              );
                                              mystate;
                                              mystate(
                                                () {},
                                              );
                                              fetchDataFromPostmanAPI();
                                              setState(() {});
                                              mystate;
                                              mystate(
                                                () {},
                                              );
                                            },
                                            child: getSvgPicture(
                                              "assets/Cancel.svg",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                          },
                          timetext: time,
                        );
                      },
                    )
                  : CircularProgressIndicator(),
            )),
          ),
        ],
      ),
    );
  }
}

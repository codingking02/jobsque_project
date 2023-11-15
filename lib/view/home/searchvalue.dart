import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/data/provider/job_provider.dart';
import 'package:jobsque_amit_project/data/provider/job_search_provider.dart';
import 'package:jobsque_amit_project/view/home/jobs_screen.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../widgets/customsearchbar.dart';
import '../../widgets/widgets.dart';

class SearchValue extends StatefulWidget {
  const SearchValue({super.key});

  @override
  State<SearchValue> createState() => _SearchValueState();
}

class _SearchValueState extends State<SearchValue> {
  var searchcontroller = TextEditingController();
  List<String> recent_searches = [];

  bool ischange = false;
  bool istapped = false;
  bool issubmitted = false;
  @override
  void dispose() {
    searchcontroller.dispose();
    super.dispose();
  }

  late Future<Database> _database;

  @override
  void initState() {
    super.initState();
    _database = initializeDatabase();
    fetchTextsFromDatabase();
  }

  Future<Database> initializeDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'text_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE texts(id INTEGER PRIMARY KEY, text TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> fetchTextsFromDatabase() async {
    final Database db = await _database;
    final List<Map<String, dynamic>> maps = await db.query('texts');
    setState(() {
      recent_searches = List.generate(maps.length, (index) {
        return maps[index]['text'];
      });
    });
  }

  Future<void> addTextToDatabase(String text) async {
    final Database db = await _database;
    await db.insert('texts', {'text': text});
  }

  void addTextToList() {
    String newText = searchcontroller.text;
    if (newText.isNotEmpty && !recent_searches.contains(newText)) {
      addTextToDatabase(newText);
      setState(() {
        recent_searches.add(newText);
        searchcontroller.clear();
      });
    } else {
      searchcontroller.clear();
    }
  }

  String searchinput = '';
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobSeaarchProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: getSvgPicture(
                    'assets/arrow-left.svg',
                  ),
                ),
                Container(
                  width: 327,
                  height: 48,
                  child: TextField(
                    controller: searchcontroller,
                    onTap: () {
                      istapped = true;
                      issubmitted = false;
                      ischange = false;
                      setState(() {});
                    },
                    onSubmitted: (value) async {
                      searchinput = value;
                      istapped = false;
                      issubmitted = true;
                      ischange = false;
                      addTextToList();
                      jobProvider.fetchJobs(
                        searchinput,
                        context,
                      );
                      searchinput = value;
                      print(
                        searchinput,
                      );
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool(
                        "isfiltred",
                        false,
                      );
                      setState(() {});
                    },
                    onChanged: (value) {
                      istapped = false;
                      issubmitted = false;
                      ischange = true;
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
                ),
              ],
            ),
          ),
          issubmitted
              ? JobsScreen()
              : Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 22,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                            24,
                            8,
                            24,
                            8,
                          ),
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
                          child: Text(
                            'Recent Searches',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: ListView.builder(
                              itemCount: recent_searches.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            searchcontroller.text =
                                                recent_searches[index];
                                          },
                                          child: Row(
                                            children: [
                                              getSvgPicture(
                                                'assets/clocksearch.svg',
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                recent_searches[index],
                                                style: TextStyle(
                                                  color: Color(0xFF111827),
                                                  fontSize: 14,
                                                  fontFamily: 'SF Pro Display',
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.14,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            recent_searches.removeAt(index);
                                            setState(() {});
                                          },
                                          child: getSvgPicture(
                                            "assets/close-circle.svg",
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

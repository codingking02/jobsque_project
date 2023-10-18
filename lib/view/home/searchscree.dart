// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/data/model/searches_model.dart';
import 'package:jobsque_amit_project/widgets/customsearchbar.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<RecentSearches> myrecentsearches = [];
  bool istyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gettopbarimage(),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Row(
                    children: [
                      getSvgPicture(
                        'assets/arrow-left.svg',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CustomSearch(
                        onchange: funcnull,
                        onsub: funconsub,
                        ontap: funcnull,
                        textEditingController: textEditingController,
                        width: 291,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
          getrecent_popular_search(
            text: 'Recent Searches',
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: ListView.builder(
                itemCount: myrecentsearches.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/clock.png',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${myrecentsearches[index].recentsearch}',
                            style: TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 14,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                              letterSpacing: 0.14,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          InkWell(
                            onTap: () {
                              myrecentsearches.removeAt(index);
                              setState(() {});
                            },
                            child: Image.asset(
                              'assets/close-circle.png',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                getrecent_popular_search(
                  text: 'Popular Searches',
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void funconsub() {
    myrecentsearches.add(
      RecentSearches(
        recentsearch: textEditingController.text,
      ),
    );
    setState(() {});
  }
}

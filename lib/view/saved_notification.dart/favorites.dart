import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/favorites_connection.dart';
import 'package:jobsque_amit_project/widgets/customgetfavorites.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  FavoritesConnection favoritesConnection = FavoritesConnection();
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    favoritesConnection.getAllSaved(context).then((jsonData) {
      setState(() {
        data = jsonData!;
      });
    });
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
                '${data!.length} Job Saved',
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
              child: data != null
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final datas = data[index];
                          String joblocation = datas['location'];
                          final jobloc = joblocation.substring(0, 14);
                          String createdat = datas['created_at'];
                          final time = createdat.substring(0, 10);

                          return GetFavoritesWidget(
                            networkimage: datas['image'],
                            jobname: datas['jobs']['name'],
                            jobplace: jobloc,
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
                                  return StatefulBuilder(builder: (
                                    BuildContext context,
                                    StateSetter mystate,
                                  ) {
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
                                            getSvgPicture(
                                              "assets/Apply.svg",
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
                                              onTap: () {
                                                favoritesConnection
                                                    .getAllSaved(context)
                                                    .then((jsonData) {
                                                  mystate(() {
                                                    data = jsonData!;
                                                  });
                                                });
                                                favoritesConnection.deleteSaved(
                                                  datas['id'],
                                                  context,
                                                );
                                                favoritesConnection
                                                    .getAllSaved(context)
                                                    .then((jsonData) {
                                                  mystate(() {
                                                    data = jsonData!;
                                                  });
                                                });
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
                      ),
                    )
                  : data == null || data.isEmpty
                      ? CircularProgressIndicator()
                      : Text(
                          'no data',
                        ),
            ),
          ),
        ],
      ),
    );
  }
}

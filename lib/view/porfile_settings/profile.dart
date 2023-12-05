import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/connections/login_controller.dart';
import 'package:jobsque_amit_project/data/provider/bioprovider.dart';
import 'package:jobsque_amit_project/view/home/homesearchscree.dart';
import 'package:jobsque_amit_project/view/login/login.dart';
import 'package:jobsque_amit_project/view/porfile_settings/editprofile.dart';
import 'package:jobsque_amit_project/view/porfile_settings/help_center.dart';
import 'package:jobsque_amit_project/view/porfile_settings/language.dart';
import 'package:jobsque_amit_project/view/porfile_settings/notificationpro.dart';
import 'package:jobsque_amit_project/view/porfile_settings/portfolio.dart';
import 'package:jobsque_amit_project/view/porfile_settings/privacy.dart';
import 'package:jobsque_amit_project/view/porfile_settings/security.dart';
import 'package:jobsque_amit_project/view/porfile_settings/terms_condition.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  LoginConnection loginConnection = LoginConnection();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 255,
            child: Stack(
              children: [
                Container(
                  width: 1000,
                  child: SvgPicture.asset(
                    'assets/profilebackground.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                gettopbarimage(),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 60,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/arrow-left.svg',
                          ),
                        ),
                        Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF111827),
                            fontSize: 20,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 1.20,
                            letterSpacing: 0.20,
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool(
                              "rememberme",
                              false,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: getSvgPicture(
                            'assets/logout.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 141,
                  left: 150,
                  child: Image.asset(
                    'assets/profileimagep.png',
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: loginConnection.getprofile(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);

                return Text(
                  snapshot.data!['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.20,
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
            height: 20,
          ),
          SizedBox(
            height: 24,
          ),
          getSvgPicture(
            'assets/profileinfo.svg',
          ),
          SizedBox(
            height: 28,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      'About',
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Edit',
                  style: TextStyle(
                    color: Color(0xFF3366FF),
                    fontSize: 14,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                    letterSpacing: 0.14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 327,
            child: Text(
              'Im Rafif Dian Axelingga, I’m UI/UX Designer,I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a  high spirit and likes to work to achieve what I dream of.',
              style: TextStyle(
                color: Color(0xFF6B7280),
                fontSize: 14,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.14,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  width: 1000,
                  child: SvgPicture.asset(
                    'assets/general.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => editprofile(),
                      ),
                    );
                  },
                  child: getSvgPicture(
                    'assets/editprofile.svg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Portfolio();
                        },
                      ),
                    );
                  },
                  child: getSvgPicture(
                    'assets/portfolio.svg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Language(),
                      ),
                    );
                  },
                  child: getSvgPicture(
                    'assets/Lang.svg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationSettings(),
                      ),
                    );
                  },
                  child: getSvgPicture(
                    'assets/notificationprofile.svg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Security(),
                      ),
                    );
                  },
                  child: getSvgPicture(
                    'assets/security.svg',
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: 1000,
                  child: SvgPicture.asset(
                    'assets/others.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                getSvgPicture(
                  'assets/accesebility.svg',
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpCenter(),
                      ),
                    );
                  },
                  child: getSvgPicture(
                    'assets/help.svg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermsCondition(),
                      ),
                    );
                  },
                  child: getSvgPicture(
                    'assets/terms.svg',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyPolicy(),
                      ),
                    );
                  },
                  child: getSvgPicture(
                    'assets/privacy.svg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget> getbio(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    return Text(
      '${prefs.getBool('rememberme') == true ? prefs.getBool('bio') : context.read<BioProvider>().bio}',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF6B7280),
        fontSize: 14,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
        height: 0.10,
        letterSpacing: 0.14,
      ),
    );
  }
}

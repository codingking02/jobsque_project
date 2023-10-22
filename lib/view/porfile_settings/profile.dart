import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque_amit_project/data/provider/bioprovider.dart';
import 'package:jobsque_amit_project/data/provider/profilenameprovider.dart';
import 'package:jobsque_amit_project/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                        SvgPicture.asset(
                          'assets/arrow-left.svg',
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
                        getSvgPicture(
                          'assets/logout.svg',
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
          Text(
            context.read<Profilename>().username,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF111827),
              fontSize: 20,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              height: 0.06,
              letterSpacing: 0.20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            context.read<BioProvider>().bio,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 14,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              height: 0.10,
              letterSpacing: 0.14,
            ),
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
                getSvgPicture(
                  'assets/editprofile.svg',
                ),
                getSvgPicture(
                  'assets/portfolio.svg',
                ),
                getSvgPicture(
                  'assets/Lang.svg',
                ),
                getSvgPicture(
                  'assets/notificationprofile.svg',
                ),
                getSvgPicture(
                  'assets/security.svg',
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
                getSvgPicture(
                  'assets/help.svg',
                ),
                getSvgPicture(
                  'assets/terms.svg',
                ),
                getSvgPicture(
                  'assets/privacy.svg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

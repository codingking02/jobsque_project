import 'package:flutter/material.dart';
import 'package:jobsque_amit_project/connections/profile_controller.dart';
import 'package:jobsque_amit_project/view/login/login.dart';
import 'package:jobsque_amit_project/widgets/custom_button.dart';

import 'package:jobsque_amit_project/widgets/widgets.dart';

import '../../widgets/custom_country_button.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  ProfileConnection profileConnection = ProfileConnection();
  String placeofwork = "Work From Office";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            gettopbarimage(),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: getSvgPicture(
                'assets/countrytitle.svg',
              ),
            ),
            SizedBox(
              height: 35,
            ),
            CustomButton(
              text1: 'Work From Office',
              text2: 'Remote Work',
              function: () {
                placeofwork = "Work From Office";
              },
              secfunction: () {
                placeofwork = "Remote Work";
              },
            ),
            SizedBox(
              height: 27,
            ),
            SizedBox(
              width: 327,
              child: Text(
                'Select the country you want for your job',
                style: TextStyle(
                  color: Color(0xFF737379),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 1.30,
                  letterSpacing: 0.16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CountryButton(
                        width: 151,
                        country: 'United States',
                        countryimage: 'assets/usa.png',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CountryButton(
                        width: 119,
                        country: 'Malaysia',
                        countryimage: 'assets/malysia.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      CountryButton(
                        width: 128,
                        country: 'Singapore',
                        countryimage: 'assets/singapore.png',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CountryButton(
                        width: 125,
                        country: 'Indonesia',
                        countryimage: 'assets/indonisiasmall.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      CountryButton(
                        width: 133,
                        country: 'Philiphines',
                        countryimage: 'assets/philipeens.png',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CountryButton(
                        width: 117,
                        country: 'Polandia',
                        countryimage: 'assets/poland.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      CountryButton(
                        width: 91,
                        country: 'India',
                        countryimage: 'assets/india.png',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CountryButton(
                        width: 115,
                        country: 'Vietnam',
                        countryimage: 'assets/vietnam.png',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CountryButton(
                        width: 98,
                        country: 'China',
                        countryimage: 'assets/chinasmall.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      CountryButton(
                        width: 112,
                        country: 'Canada',
                        countryimage: 'assets/canada.png',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CountryButton(
                        width: 145,
                        country: 'Saudi Arabia',
                        countryimage: 'assets/saudismall.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      CountryButton(
                        width: 124,
                        country: 'Argentina',
                        countryimage: 'assets/argentina.png',
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      CountryButton(
                        width: 96,
                        country: 'Brazil',
                        countryimage: 'assets/brazil.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 63,
            ),
            Container(
              width: 327,
              height: 48,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        1000,
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(
                      51,
                      102,
                      255,
                      1,
                    ),
                  ),
                ),
                onPressed: () async {
                  await profileConnection.updateplaceofwork(
                    placeofwork == "Work From Office" ? "true" : "false",
                    placeofwork == "Work From Office" ? "false" : "true",
                    context,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    height: 1.30,
                    letterSpacing: 0.16,
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

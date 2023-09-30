import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

SvgPicture gettopbarimage() {
  return SvgPicture.asset(
    'assets/topbar.svg',
  );
}

Image getHomeIndicatorimage() {
  return Image.asset('assets/Home Indicator.png');
}

Image getsmalllogo() {
  return Image.asset('assets/SmallLogo.png');
}

Image getlargelogo() {
  return Image.asset('assets/Logo.png');
}

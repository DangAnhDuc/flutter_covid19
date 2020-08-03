import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

const kTextColor = Color(0xFF1E2432);
const kTextMediumColor = Color(0xFF53627C);
const kTextLightColor = Color(0xFFACB1C0);
const kPrimaryColor = Color(0xFF0D8E53);
const kBackgroundColor = Color(0xFFFCFCFC);

const Color blue = Color(0xff356DE4);
const Color green = Color(0xff61BD80);
const Color cyan = Color(0xff3DB6BA);
Color transparentBlack = Colors.black.withOpacity(0.07);


const String FIRSTIMEUSER= "first_time_user";


const Map<NavBarItem, String> kNavbarItems = {
  NavBarItem.home: 'Home',
  NavBarItem.news: 'News',
  NavBarItem.guides: 'Guides',
};

const List<String> svgs = [
  'assets/images/onboard1.svg',
  'assets/images/onboard2.svg',
  'assets/images/onboard3.svg',
  'assets/images/onboard4.svg',
];

enum NavBarItem {
  home,
  news,
  guides,
}

const BoxShadow kCardBoxshadow = BoxShadow(
    color: const Color(0x137777FF),
    blurRadius: 5.0,
    spreadRadius: 8.0,
    offset: Offset(6.0, 5.0));

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid19/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'Stats/stats_screen.dart';
import 'guide/guides_screen.dart';
import 'news/news_screen.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int activeIndex=0;

  PageController pageController= PageController(
    initialPage: 0,
    keepPage: true
  );

  Widget buildPageView(){
    return PageView(
      controller: pageController,
      onPageChanged: (index){
        setState(() {
          activeIndex=index;
        });
      },
      children: <Widget>[
        Stats(),
        News(),
        Guides(),
      ],
    );
  }

  void bottomTapped(int index) {
    setState(() {
      activeIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      body: buildPageView(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 30,color: Colors.black.withOpacity(0.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10).add(EdgeInsets.only(top: 5)),
            child: GNav(
              gap: 10,
              activeColor: Colors.white,
              color: Colors.grey[400],
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.grey[800],
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  backgroundColor: Colors.green,
                ),
                GButton(
                  icon: LineIcons.newspaper_o,
                  text: 'News',
                  backgroundColor: Colors.green,
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: 'Guides',
                  backgroundColor: Colors.green,
                ),
              ],
              selectedIndex: activeIndex,
              onTabChange: (index){
                setState(() {
                  pageController.jumpToPage(index);
                });
              },
            ),
          ),

        ),
      ),
    );
  }

}

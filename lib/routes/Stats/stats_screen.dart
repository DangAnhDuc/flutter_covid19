import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid19/components/stats/global_card.dart';
import 'package:flutter_covid19/components/stats/oval_bottom_clipper.dart';
import 'package:flutter_covid19/constants.dart';
import 'package:flutter_covid19/helper/news/global_data.dart';
import 'package:flutter_covid19/model/stats/cases.dart';
import 'package:flutter_svg/svg.dart';

class Stats extends StatefulWidget{
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  Cases cases;
  bool isLoading=true;
  ScrollController _scrollController;

  @override
  void initState() {
    getGlobalData();
    super.initState();
  }

  getGlobalData() async{
    cases= await GlobalData().refresh();
    setState(() {
      isLoading=false;
    });
  }

  Future<void> refreshPage() async {
    isLoading = true;
    setState(() {});
    cases = await GlobalData().refresh();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return buildStatsScreen(width,height);
  }

  Widget buildStatsScreen(double width,double height){
      return RefreshIndicator(
        onRefresh: refreshPage,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight:height+height*0.2
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  height: height*0.32,
                  width: width,
                  child: ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        gradient:LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            green,kPrimaryColor
                          ],
                        )
                      ),
                      padding: EdgeInsets.only(left: width*0.05),
                      alignment: Alignment.center,
                      child: DelayedDisplay(
                        slidingCurve: Curves.easeInCubic,
                        fadingDuration: const Duration(milliseconds: 500),
                        child: Text(
                          'Covide-19 Tracker',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                              color: Colors.white
                          ),
                        ),
                      )
                    ),
                  ),
                ),
                Positioned(
                  top: height*0.16,
                  left: height*0.01,
                  width: width*0.08,
                  child: DelayedDisplay(
                    slidingCurve: Curves.easeInCubic,
                    fadingDuration: const Duration(milliseconds: 500),
                    child: SvgPicture.asset(
                        'assets/images/corona.svg'
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.06,
                  left: height * 0.05,
                  width: width*0.5,
                  child: DelayedDisplay(
                    slidingCurve: Curves.easeInOutCirc,
                    fadingDuration: const Duration(milliseconds: 1000),
                    slidingBeginOffset: Offset.fromDirection(100),
                    child: SvgPicture.asset(
                      'assets/images/corona.svg',
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.2,
                  right: height * 0.16,
                  child: DelayedDisplay(
                    slidingCurve: Curves.easeInOutCirc,
                    fadingDuration: const Duration(milliseconds: 1000),
                    slidingBeginOffset: Offset.fromDirection(100),
                    child: SvgPicture.asset(
                      'assets/images/corona.svg',
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.05,
                  right: height * 0.1,
                  child: DelayedDisplay(
                    slidingCurve: Curves.easeInOutCirc,
                    fadingDuration: const Duration(milliseconds: 1000),
                    slidingBeginOffset: Offset.fromDirection(100),
                    child: SvgPicture.asset(
                      'assets/images/corona.svg',
                    ),
                  ),
                ),
                Positioned(
                  top: height*0.18,
                  left: height*0.25,
                  width: width*0.1,
                  child: DelayedDisplay(
                    slidingCurve: Curves.easeInCubic,
                    fadingDuration: const Duration(milliseconds: 500),
                    child: SvgPicture.asset(
                        'assets/images/corona.svg'
                    ),
                  ),
                ),
                Positioned(
                  top: height*0.25,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      GlobalSituationCard(
                        cardTitle: "Confirmed Cases",
                        firstCaseTitle: "Total",
                        secondCaseTitle: "New",
                        firstData: isLoading ? 0 :cases.total_cases,
                        secondData: isLoading ? 0 :cases.total_new_cases_today,
                        cardColor: Colors.red,
                        showShimmer: isLoading,
                      ),
                      GlobalSituationCard(
                        cardTitle: "Recovered & Death Cases",
                        firstCaseTitle: "Recovered",
                        secondCaseTitle: "Death",
                        firstData: isLoading ? 0 :cases.total_recovered,
                        secondData: isLoading ? 0 :cases.total_deaths,
                        cardColor: Colors.green,
                        showShimmer: isLoading,
                      ),
                      GlobalSituationCard(
                        cardTitle: "Serious & Active Cases",
                        firstCaseTitle: "Serious",
                        secondCaseTitle: "Active",
                        firstData: isLoading ? 0 :cases.total_serious_cases,
                        secondData: isLoading ? 0 :cases.total_active_cases,
                        cardColor: Colors.blue,
                        showShimmer: isLoading,
                      ),
                      GlobalSituationCard(
                        cardTitle: "Other info",
                        firstCaseTitle: "Affected Countries",
                        secondCaseTitle: "Unresolved cases",
                        firstData: isLoading ? 0 :cases.total_affected_countries,
                        secondData: isLoading ? 0 :cases.total_unresolved,
                        cardColor: Colors.cyan,
                        showShimmer: isLoading,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }

}
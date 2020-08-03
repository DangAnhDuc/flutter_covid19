import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../shimmer_container.dart';

class GlobalSituationCard extends StatelessWidget{
  final String cardTitle;
  final String firstCaseTitle;
  final String secondCaseTitle;
  final int firstData;
  final int secondData;
  final Color cardColor;
  final bool showShimmer;

  const GlobalSituationCard(
  {@required this.cardTitle,
    @required this.firstCaseTitle,
    @required this.secondCaseTitle,
    @required this.firstData,
    @required this.secondData,
    @required this.cardColor,
    @required this.showShimmer
  });

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: height*0.21,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 20,
                spreadRadius: 3.5,
                offset: Offset(0,13),
              )
            ]
          ),
          child: showShimmer?showShimmerEffect(width,height):showStats(width, height),
        )
      ],
    );
  }

  Widget showShimmerEffect(width,height){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 40,
              margin: EdgeInsets.all(15),
              child: ShimmerContainer(height: 40.0,width: width*0.4,color: const Color(0x55cccccc),radius: 5.0,),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ShimmerContainer(height: 30.0,width: width*0.3,color: const Color(0x55cccccc),radius: 5.0,),
                  SizedBox(height: 5,),
                  ShimmerContainer(height: 25.0,width: width*0.2,color: const Color(0x55cccccc),radius: 5.0,),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ShimmerContainer(height: 30.0,width: width*0.3,color: const Color(0x55cccccc),radius: 5.0,),
                  SizedBox(height: 5,),
                  ShimmerContainer(height: 25.0,width: width*0.2,color: const Color(0x55cccccc),radius: 5.0,),
                ],
              ),
              Spacer(),
            ],
          ),
        )
      ],
    );
  }

  Widget showStats(width,height){
    final formater= new NumberFormat("#,###");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 40,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 17),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: transparentBlack,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: RichText(
                text: TextSpan(
                    text: "$cardTitle".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    firstData!=null?formater.format(firstData):"-",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 29,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    firstCaseTitle??"",
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    secondData!=null?formater.format(secondData):"-",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 29,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    secondCaseTitle??"",
                    style: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        )
      ],
    );
  }
}



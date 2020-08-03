import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadlineImage extends StatelessWidget {
  const HeadlineImage({@required this.imageUrl, @required this.text});
  final String imageUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.05,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  const Color(0x33000000), BlendMode.multiply),
          ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: width*0.054,
          color:  Colors.white,
          fontWeight:FontWeight.w700,
          fontFamily:'ProductSans'
        ),
      ),
      alignment: Alignment.bottomCenter,
    );
  }
}

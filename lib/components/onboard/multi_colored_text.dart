import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid19/constants.dart';
import 'package:flutter_covid19/model/onboard/colored_text.dart';

class MultiColoredText extends StatelessWidget {
  const MultiColoredText({this.textItems});

  final List<ColoredText> textItems;

  TextStyle coloredTextStyle(bool isViewportLarge) {
    return TextStyle(
      fontSize: isViewportLarge ? 34 : 26,
      color: kPrimaryColor,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle defaultStyle(bool isViewportLarge) {
    return TextStyle(
      fontSize: isViewportLarge ? 34 : 26,
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    double viewPortHeight = MediaQuery.of(context).size.height;
    bool viewportLarge = viewPortHeight > 800;

    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(textItems.length, (itemcount) {
        return Text(
          textItems[itemcount].text,
          style: textItems[itemcount].colored
              ? coloredTextStyle(viewportLarge)
              : defaultStyle(viewportLarge),
        );
      }),
    );
  }
}

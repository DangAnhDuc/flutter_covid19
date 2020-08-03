import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid19/Routes.dart';
import 'package:flutter_covid19/components/action_button.dart';
import 'package:flutter_covid19/components/onboard/multi_colored_text.dart';
import 'package:flutter_covid19/model/onboard/colored_text.dart';
import 'package:flutter_covid19/routes/onboard/onboard_images.dart';
import 'package:flutter_covid19/routes/onboard/onboard_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  bool _onBoardComplete = false;

  updateControl(page) {
    if (page.toInt() == 3) {
      setState(() {
        _onBoardComplete = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: updateControl,
            children: <Widget>[
              OnboardPage(
                image: SvgPicture(OnboardImage.svgImages['onboardOne']),
                multiColoredText: const MultiColoredText(textItems: [
                  const ColoredText(text: 'Avoid ', colored: false),
                  const ColoredText(text: 'Close ', colored: true),
                  const ColoredText(text: 'Contact', colored: false),
                ]),
                infoText:
                'Keep your distance from others \n to protect them from getting sick too.',
              ),
              OnboardPage(
                image: SvgPicture(OnboardImage.svgImages['onboardTwo']),
                multiColoredText: const MultiColoredText(textItems: [
                  const ColoredText(text: 'Clean ', colored: false),
                  const ColoredText(text: 'Your ', colored: false),
                  const ColoredText(text: 'Hands ', colored: true),
                  const ColoredText(text: 'Often', colored: false),
                ]),
                infoText:
                    'Wash your hands with soap and water\, scrub your hands for at least 20 seconds.',
              ),
              OnboardPage(
                image: SvgPicture(OnboardImage.svgImages['onboardThree']),
                multiColoredText: const MultiColoredText(textItems: [
                  const ColoredText(text: 'Wear a ', colored: false),
                  const ColoredText(text: 'facemask ', colored: true),
                  const ColoredText(text: 'if you are', colored: false),
                  const ColoredText(text: 'sick', colored: true),
                ]),
                infoText:
                    'Consider wearing a face mask when you are sick with a cough or sneezing',
              ),
              OnboardPage(
                image: SvgPicture(OnboardImage.svgImages['onboardFour']),
                multiColoredText: const MultiColoredText(textItems: [
                  const ColoredText(text: 'Stay ', colored: false),
                  const ColoredText(text: 'at ', colored: false),
                  const ColoredText(text: 'Home', colored: true),
                ]),
                infoText:
                    'Staying at home will help control the spread of the virus to friends\, the wider community.',
              ),
            ],
          ),
          Positioned(
            bottom: height * 0.06,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: AnimatedSwitcher(
                duration: const Duration(microseconds: 300),
                child: _onBoardComplete
                    ? onBoardingCompleted(width, height)
                    : onBoardingControl(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Align onBoardingCompleted(width, heigth) {
    return Align(
      alignment: Alignment.center,
      child: ActionButton(
        buttonCallback: navigateToHome,
        text: 'Let\'s Go',
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.2, vertical: heigth * 0.02),
      ),
    );
  }

  Row onBoardingControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: navigateToHome,
          child: Text('Skip',
              style: TextStyle(color: Colors.grey[600], fontSize: 18)),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          effect: WormEffect(
            dotWidth: 12.0,
            dotHeight: 12.0,
            activeDotColor: const Color(0xFF0D8E53),
            dotColor: Colors.grey[300],
            paintStyle: PaintingStyle.fill,
          ),
        ),
        ActionButton(
          text: 'Next',
          padding: EdgeInsets.zero,
          buttonCallback: () {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
          },
        )
      ],
    );
  }

  void navigateToHome() {
    Navigator.popAndPushNamed(context, Routes.kHomepage);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_covid19/Routes.dart';
import 'package:flutter_covid19/constants.dart';
import 'package:flutter_covid19/routes/homepage.dart';
import 'package:flutter_covid19/routes/onboard/onboard.dart';
import 'package:flutter_covid19/routes/onboard/onboard_images.dart';
import 'package:flutter_covid19/services/svg_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:custom_splash/custom_splash.dart';

String initialScreen;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SVGLoader.loadSVG(OnboardImage.svgImages);
//  initialScreen=await isFirstTimeUser()? Routes.kOnboarding: Routes.kHomepage;
  initialScreen=Routes.kOnboarding;
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      isFirstTimeUser();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialScreen,
        routes: <String,WidgetBuilder>{
          Routes.kOnboarding: (context) => Onboard(),
          Routes.kHomepage: (context) => HomePage(),
//          Routes.kNews: (context) => News(),
//          Routes.kGuides: (context) => Guides(),
      }
      );
  }

}

Future<bool>isFirstTimeUser() async {
  SharedPreferences _sharedPreferences;
  bool isFirstTimeUser;
  _sharedPreferences= await SharedPreferences.getInstance();
  if(_sharedPreferences.getBool(FIRSTIMEUSER)==null){
    await _sharedPreferences.setBool(FIRSTIMEUSER, true);
    isFirstTimeUser=true;
  }
  else{
    isFirstTimeUser=false;
  }
  return isFirstTimeUser;
}


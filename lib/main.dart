import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:yoganath/services/routeGenerator.dart';

import 'screens/splash_screen.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(YogaNath()));
}

class YogaNath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YogaNath',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        typography: Typography.material2018(platform: TargetPlatform.android),
        primaryColor: Color(0xffcc9c74),
        primaryColorDark: Color(0xff996E48),
        buttonColor: Color(0xff5F9269),
        accentColor: Color(0xff32643E),
        canvasColor: Color(0xffDEA97E),
        scaffoldBackgroundColor: Colors.white,
        textTheme: Typography.blackMountainView.copyWith(
          bodyText2: TextStyle(color: Colors.black54, fontSize: 16.0),
          headline5: TextStyle(
            fontFamily: 'Indie Flower',
            fontSize: 33.0,
            color: Color(0xff5F9269),
          ),
          headline6: TextStyle(
            fontFamily: 'Indie Flower',
            fontSize: 27.0,
            color: Colors.black87,
          ),
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Color(0xff32643E),
          inactiveTrackColor: Color(0xff8ec397),
          thumbColor: Color(0xff32643E),
          valueIndicatorColor: Color(0xff32643E),
          overlayColor: Color(0xff8ec397),
        ),
      ),
    );
  }
}

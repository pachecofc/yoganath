import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/setOrientation.dart';
import 'dart:io' show Platform;

import 'screens/splash_screen.dart';

void main() {
  // Set portrait orientation as default
  setOrientation(Orientation.portrait);
  initializeDateFormatting().then((_) => runApp(YogaNath()));
}

class YogaNath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            title: 'YogaNath',
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            theme: CupertinoThemeData(
              scaffoldBackgroundColor: CupertinoColors.white,
              primaryColor: Color(0xffcc9c74),
              primaryContrastingColor: Color(0xff5F9269),
            ),
          )
        : MaterialApp(
            title: 'YogaNath',
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              typography:
                  Typography.material2018(platform: TargetPlatform.android),
              primaryColor: Color(0xffcc9c74),
              primaryColorDark: Color(0xff996E48),
              buttonColor: Color(0xff5F9269),
              accentColor: Color(0xff32643E),
              bottomAppBarColor: Color(0xffDEA97E),
              canvasColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              textTheme: Typography.blackMountainView.copyWith(
                bodyText2: TextStyle(color: Colors.black54),
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

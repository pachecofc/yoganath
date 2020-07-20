import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';

import 'screens/splash_screen.dart';

void main() => runApp(
      MaterialApp(
        title: 'YogaNath',
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          typography: Typography.material2018(platform: TargetPlatform.android),
          colorScheme: ColorScheme(
              primary: Color(0xffcc9c74),
              primaryVariant: Color(0xff996e48),
              secondary: Color(0xff5F9269),
              secondaryVariant: Color(0xff32643E),
              surface: Colors.white,
              background: Colors.white,
              error: Color(0xffa2001d),
              onPrimary: Colors.black,
              onSecondary: Colors.white,
              onSurface: Colors.black54,
              onBackground: Colors.black54,
              onError: Colors.white,
              brightness: Brightness.light),
          textTheme: TextTheme(
            headline5: TextStyle(
                fontFamily: 'IndieFlower-Regular',
                fontSize: 33.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 0,
                height: 48.0,
                color: Color(0xff5F9269)),
            headline6: TextStyle(
              fontFamily: 'IndieFlower-Regular',
              fontSize: 27.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.15,
              height: 39,
              color: Colors.black87,
            ),
            bodyText2: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 30.8,
              height: 21.0,
              color: Colors.black54,
            ),
            bodyText1: TextStyle(
              fontFamily: 'Roboto-Medium',
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 89.1,
              height: 19.0,
              color: Colors.black87,
            ),
            button: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 17.4,
              height: 19.0,
              color: Colors.black54,
            ),
            caption: TextStyle(
              fontFamily: 'Roboto-Medium',
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 156.4,
              height: 16.0,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );

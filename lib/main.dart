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
          primaryColor: Color(0xffcc9c74),
          buttonColor: Color(0xff5F9269),
          scaffoldBackgroundColor: Colors.white,
          textTheme: Typography.blackMountainView.copyWith(
            bodyText2: TextStyle(color: Colors.black54, fontSize: 16.0),
            headline5: TextStyle(
              fontFamily: 'IndieFlower-Regular',
              fontSize: 33.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0,
              height: 48.0,
              color: Color(0xff5F9269),
            ),
            headline6: TextStyle(
              fontFamily: 'IndieFlower-Regular',
              fontSize: 27.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.15,
              height: 39,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );

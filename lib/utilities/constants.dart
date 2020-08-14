import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Color constants for Cupertino widgets
abstract class ColorConstants {
  static const Color kCupertinoButtonText = CupertinoColors.white;
  static const Color kButtonText = Colors.white;
  static const Color kCupertinoTabBar = Color(0xffDEA97E);
  static const Color kTabBarActiveColor = Color.fromRGBO(0, 0, 0, 0.87);
  static const Color kTabBarInactiveColor = Color.fromRGBO(0, 0, 0, 0.5);
  static const Color kDarkerGreen = Color(0xff32643E);
}

abstract class TextConstants {
  static const TextStyle kHeadline1 = TextStyle(
    fontFamily: 'Indie Flower',
    fontSize: 33.0,
    color: Color(0xff5F9269),
  );

  static const TextStyle kHeadline2 = TextStyle(
    fontFamily: 'Indie Flower',
    fontSize: 27.0,
    color: ColorConstants.kTabBarActiveColor,
  );
}

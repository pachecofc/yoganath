import 'package:flutter/material.dart';

import 'package:yoganath/screens/base_screen.dart';
import 'package:yoganath/screens/birthday_screen.dart';
import 'package:yoganath/screens/class_screen.dart';
import 'package:yoganath/screens/feedback_screen.dart';
import 'package:yoganath/screens/level_screen.dart';
import 'package:yoganath/screens/login_screen.dart';
import 'package:yoganath/screens/premium_screen.dart';
import 'package:yoganath/screens/signup_screen.dart';
import 'package:yoganath/screens/splash_screen.dart';

class RouteGenerator {
  static const String kROOT_ROUTE = '/';
  static const String kLOGIN_ROUTE = '/login';
  static const String kSIGNUP_ROUTE = '/signup';
  static const String kLEVEL_ROUTE = '/level';
  static const String kBIRTHDAY_ROUTE = '/birthday';
  static const String kBASE_ROUTE = '/base';
  static const String kPREMIUM_ROUTE = '/premium';
  static const String kCLASS_ROUTE = '/class';
  static const String kFEEDBACK_ROUTE = '/feedback';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kROOT_ROUTE:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case kLOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => Login());
        break;
      case kSIGNUP_ROUTE:
        return MaterialPageRoute(builder: (_) => Signup());
        break;
      case kLEVEL_ROUTE:
        return MaterialPageRoute(builder: (_) => Level());
        break;
      case kBIRTHDAY_ROUTE:
        return MaterialPageRoute(builder: (_) => Birthday());
        break;
      case kBASE_ROUTE:
        return MaterialPageRoute(builder: (_) => Base());
        break;
      case kPREMIUM_ROUTE:
        return MaterialPageRoute(builder: (_) => Premium());
        break;
      case kCLASS_ROUTE:
        return MaterialPageRoute(builder: (_) => Class());
        break;
      case kFEEDBACK_ROUTE:
        return MaterialPageRoute(builder: (_) => ClassFeedback());
        break;
      default:
        _routeNotFound();
    }
    return null;
  }

  static Route<dynamic> _routeNotFound() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Tela não encontrada'),
              ),
              body: Center(
                child: Text('Tela não encontrada'),
              ),
            ));
  }
}

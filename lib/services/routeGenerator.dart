import 'package:flutter/material.dart';
import 'package:yoganath/screens/about_more_screen.dart';
import 'package:yoganath/screens/about_screen.dart';
import 'package:yoganath/screens/account_screen.dart';
import 'package:yoganath/screens/admin_screen.dart';
import 'package:yoganath/screens/asanaInfo_screen.dart';
import 'package:yoganath/screens/asanas_screen.dart';
import 'package:yoganath/screens/base_screen.dart';
import 'package:yoganath/screens/birthday_screen.dart';
import 'package:yoganath/screens/cancel_subscription_screen.dart';
import 'package:yoganath/screens/class_screen.dart';
import 'package:yoganath/screens/feedback_screen.dart';
import 'package:yoganath/screens/learnMore_screen.dart';
import 'package:yoganath/screens/login_screen.dart';
import 'package:yoganath/screens/meditation_screen.dart';
import 'package:yoganath/screens/pranayamas_screen.dart';
import 'package:yoganath/screens/premium_screen.dart';
import 'package:yoganath/screens/signup_screen.dart';
import 'package:yoganath/screens/splash_screen.dart';
import 'package:yoganath/screens/subscription_screen.dart';
import 'package:yoganath/screens/support_screen.dart';

class RouteGenerator {
  static const String kROOT_ROUTE = '/';
  static const String kLOGIN_ROUTE = '/login';
  static const String kSIGNUP_ROUTE = '/signup';
  static const String kBIRTHDAY_ROUTE = '/birthday';
  static const String kBASE_ROUTE = '/base';
  static const String kPROFILE_ROUTE = '/profile';
  static const String kPREMIUM_ROUTE = '/premium';
  static const String kCLASS_ROUTE = '/class';
  static const String kADHOC_ROUTE = '/adhoc';
  static const String kFEEDBACK_ROUTE = '/feedback';
  static const String kASANAS_ROUTE = '/asanas';
  static const String kPRANA_ROUTE = '/pranayamas';
  static const String kMEDITATION_ROUTE = '/meditation';
  static const String kLEARN_ROUTE = '/learn';
  static const String kACCOUNT_ROUTE = '/account';
  static const String kSUBSCRIPTION_ROUTE = '/subscription';
  static const String kCANCELSUBSCRIPTION_ROUTE = '/cancelsub';
  static const String kSUPPORT_ROUTE = '/support';
  static const String kABOUT_ROUTE = '/about';
  static const String kABOUTMORE_ROUTE = '/aboutmore';
  static const String kADMIN_ROUTE = '/admin';

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
      case kBIRTHDAY_ROUTE:
        return MaterialPageRoute(builder: (_) => Birthday());
        break;
      case kBASE_ROUTE:
        return MaterialPageRoute(builder: (_) => Base());
        break;
      case kPROFILE_ROUTE:
        return MaterialPageRoute(builder: (_) => Base(fromFeedback: true));
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
      case kASANAS_ROUTE:
        return MaterialPageRoute(builder: (_) => Asanas());
        break;
      case kPRANA_ROUTE:
        return MaterialPageRoute(builder: (_) => Pranayamas());
        break;
      case kADHOC_ROUTE:
        return MaterialPageRoute(builder: (_) => AsanaInfo());
        break;
      case kMEDITATION_ROUTE:
        return MaterialPageRoute(builder: (_) => Meditation());
        break;
      case kLEARN_ROUTE:
        return MaterialPageRoute(builder: (_) => LearnMore());
        break;
      case kACCOUNT_ROUTE:
        return MaterialPageRoute(builder: (_) => Account());
        break;
      case kSUBSCRIPTION_ROUTE:
        return MaterialPageRoute(builder: (_) => Subscription());
        break;
      case kCANCELSUBSCRIPTION_ROUTE:
        return MaterialPageRoute(builder: (_) => CancelSubscription());
        break;
      case kSUPPORT_ROUTE:
        return MaterialPageRoute(builder: (_) => Support());
        break;
      case kABOUT_ROUTE:
        return MaterialPageRoute(builder: (_) => About());
        break;
      case kABOUTMORE_ROUTE:
        return MaterialPageRoute(builder: (_) => AboutMore());
        break;
      case kADMIN_ROUTE:
        return MaterialPageRoute(builder: (_) => Admin());
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

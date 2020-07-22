import 'package:flutter/material.dart';
import 'package:yoganath/screens/level_screen.dart';
import 'package:yoganath/screens/login_screen.dart';
import 'package:yoganath/screens/signup_screen.dart';
import 'package:yoganath/screens/splash_screen.dart';

class RouteGenerator {
  static const String kROOT_ROUTE = '/';
  static const String kLOGIN_ROUTE = '/login';
  static const String kSIGNUP_ROUTE = '/signup';
  static const String kLEVEL_ROUTE = '/level';

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

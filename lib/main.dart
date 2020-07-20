import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';

import 'screens/splash_screen.dart';

void main() => runApp(MaterialApp(
      title: 'YogaNath',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    ));

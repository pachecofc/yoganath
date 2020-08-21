import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/setOrientation.dart';
import 'dart:io' show Platform;

import 'screens/splash_screen.dart';

// void main() {
//   setOrientation(Orientation.portrait);
//   initializeDateFormatting().then((_) => runApp(YogaNath()));
// }
void main() async {
  setOrientation(Orientation.portrait);
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(YogaNath());
}

class YogaNath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YogaNath',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      locale: Locale('pt-BR', 'BR'),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        typography: Typography.material2018(
            platform:
                Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android),
        primaryColor: Color(0xffcc9c74),
        primaryColorDark: Color(0xff996E48),
        buttonColor: Color(0xff5F9269),
        accentColor: Color(0xff32643E),
        bottomAppBarColor: Color(0xffDEA97E),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        errorColor: Color(0xffA2001D),
        textTheme: Typography.blackMountainView.copyWith(
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
          bodyText2: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16.0,
          ),
          button: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
          ),
          caption: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12.0,
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

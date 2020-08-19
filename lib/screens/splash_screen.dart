import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        RouteGenerator.kLOGIN_ROUTE,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    final startWidth = mediaSize.width * 0.548;
    final finalWidth = mediaSize.width * 0.848;

    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/ganesha.png',
                  height: mediaSize.height * 0.27,
                )
              ],
            ),
            Center(
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: startWidth, end: finalWidth),
                  duration: Duration(seconds: 2),
                  builder:
                      (BuildContext context, double largura, Widget widget) {
                    return Hero(
                      tag: 'logo',
                      child: Image(
                        image: AssetImage('assets/images/logo.jpg'),
                        width: largura,
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  'assets/images/nath_splash.png',
                  height: mediaSize.height * 0.27,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

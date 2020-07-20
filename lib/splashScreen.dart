import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yoganath/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        // TODO Definir arquivo de rotas
        MaterialPageRoute(builder: (_) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final startWidth = mediaQuery.width * 0.548;
    final finalWidth = mediaQuery.width * 0.848;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'images/ganesha.png',
                  height: mediaQuery.height * 0.27,
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
                        image: AssetImage('images/logo.jpg'),
                        width: largura,
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  'images/nath_splash.png',
                  height: mediaQuery.height * 0.27,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Birthday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;

    var pageBody = Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ReusableTitle(
              text: 'Namastê João',
              isPremium: false,
            ),
            SizedBox(height: _height * 0.01),
            ReusableSubtitle(
              text: 'Feliz Aniversário pra Você!',
            ),
            SizedBox(height: _height * 0.05),
            Text(
                'Eu, sua professora Nat, desejo a você muita saúde, paz e prosperidade!'),
            Text('Feliz Aniversário e continue praticando Yoga conosco.'),
            SizedBox(height: _height * 0.05),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/baloons.jpg'),
              maxRadius: _height * 0.19,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            SizedBox(height: _height * 0.05),
            ReusableRaisedButton(
                buttonText: 'CONTINUAR',
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.kBASE_ROUTE);
                })
          ],
        ),
      ),
    );
    return SafeArea(
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              child: pageBody,
            )
          : Scaffold(
              body: pageBody,
            ),
    );
  }
}

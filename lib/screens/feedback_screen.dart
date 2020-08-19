import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/buildDropdown.dart';
import 'package:yoganath/utilities/setOrientation.dart';
import 'package:yoganath/widgets/reusableDropdown.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableSmiley.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';
import 'package:yoganath/widgets/reusableTitle.dart';
import 'package:yoganath/widgets/reusableYogaPoints.dart';
import 'package:yoganath/utilities/dropdownLists.dart';

class ClassFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;

    setOrientation(Orientation.portrait);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ReusableTitle(
                  text: 'Parabéns, João!',
                  isPremium: false,
                ),
                SizedBox(height: _screenHeight * 0.005),
                ReusableSubtitle(text: 'Você ganhou'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ReusableYogaPoints(score: 100),
                ),
                SizedBox(height: _screenHeight * 0.005),
                ReusableSubtitle(text: 'Como você se sente?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ReusableSmiley(smiley: Icons.sentiment_very_satisfied),
                    ReusableSmiley(smiley: Icons.sentiment_satisfied),
                    ReusableSmiley(smiley: Icons.sentiment_neutral),
                    ReusableSmiley(smiley: Icons.sentiment_dissatisfied),
                    ReusableSmiley(smiley: Icons.sentiment_very_dissatisfied),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Platform.isIOS
                      ?
                      // IosPicker(sourceList: feelings)
                      GestureDetector(
                          child: Text('Eu me sinto...'),
                          onTap: () {
                            buildDropdownPopup(context, feelings);
                          },
                        )
                      : AndroidDropdown(sourceList: feelings),
                ),
                ReusableRaisedButton(
                    buttonText: 'CONCLUIR',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.kPROFILE_ROUTE);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

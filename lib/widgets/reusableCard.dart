import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {@required this.cardImage,
      @required this.cardText,
      this.routeName,
      this.secondTextLine,
      this.reusableFlatButton});

  final String cardImage;
  final String cardText;
  final String secondTextLine;
  final ReusableFlatButton reusableFlatButton;
  final String routeName;

  bool containsSecondLine() {
    if (secondTextLine == null) return false;
    return true;
  }

  bool containsButton() {
    if (reusableFlatButton == null) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: Platform.isIOS
                  ? CupertinoTheme.of(context).primaryColor
                  : Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: SizedBox(
                  height: _screenSize.height * 0.16,
                  width: _screenSize.height * 0.16,
                  child: Image.asset(
                    'assets/images/$cardImage',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(cardText),
                    containsSecondLine() ? Text(secondTextLine) : Container(),
                    containsButton() ? reusableFlatButton : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

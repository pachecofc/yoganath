import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/utilities/constants.dart';

class ReusableMidiaCard extends StatelessWidget {
  const ReusableMidiaCard(
      {@required this.imageName,
      this.firstTextLine,
      this.secondTextLine,
      @required this.isChecked,
      this.onTap});

  final String imageName;
  final String firstTextLine;
  final String secondTextLine;
  final bool isChecked;
  final Function onTap;

  bool containsFirstLine() {
    if (firstTextLine == null) return false;
    return true;
  }

  bool containsSecondLine() {
    if (secondTextLine == null) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Stack(
          alignment: const Alignment(-0.8, 0.8),
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Platform.isIOS
                        ? CupertinoTheme.of(context).primaryColor
                        : Theme.of(context).primaryColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/$imageName',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            !containsFirstLine()
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.kTransparentLighterGreen,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5.0),
                      child: containsSecondLine()
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  firstTextLine,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  secondTextLine,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              firstTextLine,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
            Positioned(
              child: !isChecked
                  ? Container()
                  : Icon(
                      Icons.check_circle,
                      color: Platform.isIOS
                          ? CupertinoTheme.of(context).primaryContrastingColor
                          : Theme.of(context).buttonColor,
                    ),
              right: 10,
              top: 10,
            ),
          ],
        ),
      ),
    );
  }
}

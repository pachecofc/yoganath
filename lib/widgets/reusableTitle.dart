import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:yoganath/utilities/constants.dart';

class ReusableTitle extends StatelessWidget {
  const ReusableTitle({@required this.text, @required this.isPremium});

  final String text;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: Platform.isIOS
                  ? TextConstants.kHeadline1
                  : Theme.of(context).textTheme.headline5,
            ),
            isPremium
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 8.0),
                    child: Icon(
                      Icons.star_border,
                      color: Platform.isIOS
                          ? ColorConstants.kDarkerGreen
                          : Theme.of(context).accentColor,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

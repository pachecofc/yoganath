import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableFlatButton extends StatelessWidget {
  const ReusableFlatButton(
      {@required this.buttonText, @required this.onPressed});

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: Platform.isIOS
            ? TextStyle(color: CupertinoTheme.of(context).primaryColor)
            : TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}

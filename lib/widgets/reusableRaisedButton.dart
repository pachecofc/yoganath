import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:yoganath/utilities/constants.dart';

class ReusableRaisedButton extends StatelessWidget {
  const ReusableRaisedButton({
    @required this.buttonText,
    @required this.onPressed,
  });

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IosButton(buttonText: buttonText, onPressed: onPressed)
        : AndroidRaisedButton(buttonText: buttonText, onPressed: onPressed);
  }
}

class AndroidRaisedButton extends StatelessWidget {
  const AndroidRaisedButton({
    @required this.buttonText,
    @required this.onPressed,
  });

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        buttonText,
        style: TextStyle(color: ColorConstants.kButtonText),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      onPressed: onPressed,
    );
  }
}

class IosButton extends StatelessWidget {
  const IosButton({
    @required this.buttonText,
    @required this.onPressed,
  });

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(
        buttonText,
        style: TextStyle(color: Theme.of(context).canvasColor),
      ),
      color: Theme.of(context).buttonColor,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      onPressed: onPressed,
    );
  }
}

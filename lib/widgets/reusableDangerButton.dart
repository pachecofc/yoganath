import 'package:flutter/material.dart';
import 'package:yoganath/utilities/constants.dart';

class ReusableDangerButton extends StatelessWidget {
  const ReusableDangerButton(
      {@required this.buttonText, @required this.onPressed});

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: ColorConstants.kDangerAction,
      shape: Border.all(color: ColorConstants.kDangerAction),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}

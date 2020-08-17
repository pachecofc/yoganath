import 'package:flutter/material.dart';

class ReusableDangerButton extends StatelessWidget {
  const ReusableDangerButton(
      {@required this.buttonText, @required this.onPressed});

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Theme.of(context).errorColor,
      shape: Border.all(color: Theme.of(context).errorColor),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}

import 'package:flutter/material.dart';

class ReusableDangerButton extends StatelessWidget {
  const ReusableDangerButton(
      {@required this.buttonText, @required this.onPressed});

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Color(0xffA2001D),
      shape: Border.all(color: Color(0xffA2001D)),
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}

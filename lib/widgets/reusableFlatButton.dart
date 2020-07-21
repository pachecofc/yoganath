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
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}

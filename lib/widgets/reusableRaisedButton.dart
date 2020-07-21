import 'package:flutter/material.dart';

class ReusableRaisedButton extends StatelessWidget {
  const ReusableRaisedButton({
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
        style: TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      onPressed: onPressed,
    );
  }
}

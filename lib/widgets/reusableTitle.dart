import 'package:flutter/material.dart';

class ReusableTitle extends StatelessWidget {
  const ReusableTitle({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

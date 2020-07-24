import 'package:flutter/material.dart';

class ReusableSubtitle extends StatelessWidget {
  const ReusableSubtitle({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}

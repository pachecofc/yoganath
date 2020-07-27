import 'package:flutter/material.dart';

class ReusableStar extends StatelessWidget {
  const ReusableStar({@required this.starStyle});
  final IconData starStyle;

  @override
  Widget build(BuildContext context) {
    return Icon(
      starStyle,
      color: Theme.of(context).accentColor,
    );
  }
}

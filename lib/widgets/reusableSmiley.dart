import 'package:flutter/material.dart';

class ReusableSmiley extends StatelessWidget {
  const ReusableSmiley({@required this.smiley});

  final IconData smiley;

  @override
  Widget build(BuildContext context) {
    return Icon(
      smiley,
      color: Theme.of(context).primaryColor,
      size: 48.0,
    );
  }
}

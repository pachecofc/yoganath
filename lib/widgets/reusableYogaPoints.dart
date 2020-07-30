import 'package:flutter/material.dart';

class ReusableYogaPoints extends StatelessWidget {
  const ReusableYogaPoints({@required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/lotus.png',
          width: 24.0,
          height: 24.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(score.toString()),
        ),
        Text('YogaPoints'),
      ],
    );
  }
}

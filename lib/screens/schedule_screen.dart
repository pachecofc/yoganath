import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ReusableTitle(text: 'Nath Agenda', isPremium: false),
      ],
    );
  }
}

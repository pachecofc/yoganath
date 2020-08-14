import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:yoganath/utilities/constants.dart';

class ReusableSubtitle extends StatelessWidget {
  const ReusableSubtitle({@required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Platform.isIOS
          ? TextConstants.kHeadline2
          : Theme.of(context).textTheme.headline6,
    );
  }
}

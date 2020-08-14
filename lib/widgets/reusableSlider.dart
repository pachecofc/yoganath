import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/utilities/constants.dart';

class ReusableSlider extends StatelessWidget {
  const ReusableSlider({@required this.initialValue});

  final double initialValue;

  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
      value: initialValue,
      min: 0,
      max: 100,
      divisions: 9,
      label: '$initialValue%',
      onChanged: (double newValue) {},
      activeColor: Platform.isIOS
          ? ColorConstants.kDarkerGreen
          : Theme.of(context).sliderTheme.activeTrackColor,
    );
  }
}

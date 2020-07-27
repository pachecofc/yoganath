import 'package:flutter/material.dart';

class ReusableSlider extends StatelessWidget {
  const ReusableSlider({@required this.initialValue});

  final double initialValue;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: initialValue,
      min: 0,
      max: 100,
      divisions: 9,
      label: '$initialValue%',
      onChanged: (double newValue) {},
    );
  }
}

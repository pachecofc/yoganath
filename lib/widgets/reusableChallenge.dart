import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableSlider.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';

class ReusableChallenge extends StatelessWidget {
  const ReusableChallenge({this.progress = 0});
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: IconButton(
              icon: Icon(Icons.show_chart),
              onPressed: () {
                showAlertDialog(context);
              }),
        ),
        Expanded(
          child: Container(
            child: ReusableSlider(initialValue: progress),
          ),
        ),
        Container(
          child: Checkbox(value: true, onChanged: (newValue) {}),
        ),
      ],
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: ReusableSubtitle(text: 'Instruções'),
          titlePadding: EdgeInsets.all(43.0),
          content: Text('Beber 2 litros de água'),
          contentPadding: EdgeInsets.fromLTRB(43.0, 0.0, 43.0, 26.0),
          actions: <Widget>[
            ReusableRaisedButton(
                buttonText: 'OK',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }
}

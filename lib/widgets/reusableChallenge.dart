import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
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
          child: Checkbox(
            value: true,
            onChanged: (newValue) {},
            activeColor: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final ReusableSubtitle title = ReusableSubtitle(text: 'Instruções');
        final Text content = Text('Beber 2 litros de água');
        final String buttonText = 'OK';

        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: title,
                content: content,
                actions: [
                  CupertinoDialogAction(
                      child: Text(buttonText),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              )
            : AlertDialog(
                title: title,
                titlePadding: EdgeInsets.all(43.0),
                content: content,
                contentPadding: EdgeInsets.fromLTRB(43.0, 0.0, 43.0, 26.0),
                actions: <Widget>[
                  ReusableRaisedButton(
                      buttonText: buttonText,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              );
      },
    );
  }
}

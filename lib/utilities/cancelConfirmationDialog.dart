import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';

void showCancelConfirmationDialog(
    BuildContext context, String message, String title) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: ReusableSubtitle(text: title),
        titlePadding: EdgeInsets.all(43.0),
        content: Text(message),
        contentPadding: EdgeInsets.fromLTRB(43.0, 0.0, 43.0, 26.0),
        actions: <Widget>[
          ReusableRaisedButton(
              buttonText: 'SAIR',
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.kLOGIN_ROUTE);
              }),
        ],
      );
    },
  );
}

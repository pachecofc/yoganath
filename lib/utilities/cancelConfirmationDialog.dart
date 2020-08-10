import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';

void showCancelConfirmationDialog(
    BuildContext context, String message, String title) {
  showDialog(
    context: context,
    builder: (context) {
      return Platform.isIOS
          ? IosAlertDialog(title: title, message: message)
          : AndroidAlertDialog(title: title, message: message);
    },
  );
}

class AndroidAlertDialog extends StatelessWidget {
  const AndroidAlertDialog({@required this.title, @required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ReusableSubtitle(text: title),
      content: Text(message),
      actions: [
        ReusableRaisedButton(
            buttonText: 'SAIR',
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, RouteGenerator.kLOGIN_ROUTE);
            }),
      ],
    );
  }
}

class IosAlertDialog extends StatelessWidget {
  const IosAlertDialog({@required this.title, @required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
          child: Text(
            'SAIR',
            style: TextStyle(color: Theme.of(context).buttonColor),
          ),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, RouteGenerator.kLOGIN_ROUTE);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

void buildSnackBar(BuildContext context, String snackBarMessage) {
  final snackbar = SnackBar(
    backgroundColor: Theme.of(context).buttonColor,
    duration: Duration(seconds: 3),
    content: Text(snackBarMessage),
  );
  Scaffold.of(context).showSnackBar(snackbar);
}

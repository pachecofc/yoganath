import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoNavigationBar buildCupertinoNavigationBar(
    BuildContext context, Text appBarTitle) {
  return CupertinoNavigationBar(
    backgroundColor: Theme.of(context).primaryColor,
    middle: appBarTitle,
    leading: GestureDetector(
      child: Icon(
        CupertinoIcons.back,
        color: CupertinoColors.black,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
  );
}

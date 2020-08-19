import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableDropdown.dart';

Future buildDropdownPopup(BuildContext context, List<String> sourceList) {
  return showCupertinoModalPopup(
    context: context,
    semanticsDismissible: true,
    builder: (_) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.15,
        color: Theme.of(context).canvasColor,
        child: IosPicker(sourceList: sourceList),
      );
    },
  );
}

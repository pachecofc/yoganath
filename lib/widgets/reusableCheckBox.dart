import 'package:flutter/material.dart';

class ReusableCheckboxListTile extends StatelessWidget {
  const ReusableCheckboxListTile({@required this.checkTitle});

  final String checkTitle;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(
          checkTitle,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        value: true,
        onChanged: (bool newValue) {},
        controlAffinity: ListTileControlAffinity.platform);
  }
}

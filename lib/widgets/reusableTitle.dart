import 'package:flutter/material.dart';

class ReusableTitle extends StatelessWidget {
  const ReusableTitle({@required this.text, @required this.isPremium});

  final String text;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ),
        isPremium
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                child: Icon(
                  Icons.star_border,
                  color: Theme.of(context).accentColor,
                ),
              )
            : Container(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {@required this.cardImage,
      @required this.cardText,
      this.routeName,
      this.secondTextLine,
      this.reusableFlatButton});

  final String cardImage;
  final String cardText;
  final String secondTextLine;
  final ReusableFlatButton reusableFlatButton;
  final String routeName;

  bool containsSecondLine() {
    if (secondTextLine == null) return false;
    return true;
  }

  bool containsButton() {
    if (reusableFlatButton == null) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 11.0),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Image.asset(
                    'assets/images/$cardImage',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(cardText),
                  containsSecondLine() ? Text(secondTextLine) : Container(),
                  containsButton() ? reusableFlatButton : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

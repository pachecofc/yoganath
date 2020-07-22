import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {@required this.cardImage,
      @required this.cardText,
      @required this.routeName});

  final String cardImage;
  final String cardText;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, routeName);
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
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(cardText),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

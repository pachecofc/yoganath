import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableCard.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Practice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ReusableTitle(
          text: 'Práticas Avulsas',
          isPremium: false,
        ),
        ReusableCard(
          cardImage: 'trikonasana.jpg',
          cardText: 'Ásanas',
          routeName: '',
        ),
        ReusableCard(
          cardImage: 'time.png',
          cardText: 'Timer Meditação',
          routeName: '',
        ),
        ReusableCard(
          cardImage: 'pranayama.png',
          cardText: 'Pranayamas',
          routeName: '',
        ),
        SizedBox(
          height: 44.0,
        ),
        ReusableTitle(text: 'Aulas Personalizadas', isPremium: true),
        ReusableRaisedButton(
            buttonText: 'PERGUNTAR PARA A PROFESSORA', onPressed: () {}),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Sadhana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ReusableTitle(
          text: 'Reflexão do Dia',
          isPremium: false,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.'),
        ),
        ReusableTitle(
          text: 'Prática Diária',
          isPremium: true,
        ),
        ReusableMidiaCard(
          imageName: 'guerreiro.jpg',
          firstTextLine: 'Dia 3 / 21',
          secondTextLine: '30 min',
          isChecked: true,
        ),
        ReusableTitle(
          text: 'Desafio Semanal',
          isPremium: true,
        ),
        ReusableMidiaCard(
          imageName: 'corvo.jpg',
          firstTextLine: 'Semana 2 / 7',
          isChecked: false,
        ),
      ],
    );
  }
}

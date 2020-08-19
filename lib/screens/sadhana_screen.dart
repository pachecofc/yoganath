import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/screens/premium_screen.dart';
import 'package:yoganath/widgets/reusableChallenge.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Sadhana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ReusableTitle(
            text: 'Reflexão do Dia',
            isPremium: false,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Material(
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.'),
            ),
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
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (_) {
                  return CupertinoPopupSurface(
                    child: Premium(),
                  );
                },
              );
            },
          ),
          ReusableTitle(
            text: 'Desafio Semanal',
            isPremium: false,
          ),
          for (var i = 0; i < 50; i++)
            Platform.isIOS
                ? Material(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: ReusableChallenge(),
                  )
                : ReusableChallenge()
        ],
      ),
    );
  }
}

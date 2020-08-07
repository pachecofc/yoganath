import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableCard.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Practice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ReusableTitle(
            text: 'Práticas Avulsas',
            isPremium: false,
          ),
          ReusableCard(
            cardImage: 'trikonasana.jpg',
            cardText: 'Ásanas',
            routeName: RouteGenerator.kASANAS_ROUTE,
          ),
          ReusableCard(
            cardImage: 'time.png',
            cardText: 'Timer Meditação',
            routeName: RouteGenerator.kMEDITATION_ROUTE,
          ),
          ReusableCard(
            cardImage: 'pranayama.png',
            cardText: 'Pranayamas',
            routeName: RouteGenerator.kPRANA_ROUTE,
          ),
          SizedBox(
            height: 44.0,
          ),
          ReusableTitle(text: 'Aulas Personalizadas', isPremium: true),
          ReusableRaisedButton(
              buttonText: 'PERGUNTAR PARA A PROFESSORA', onPressed: () {}),
        ],
      ),
    );
  }
}

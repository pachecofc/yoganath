import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableCard.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Level extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ReusableTitle(
                  text: 'Namastê João',
                  isPremium: false,
                ),
                SizedBox(height: 19.0),
                ReusableSubtitle(
                  text: 'Vamos nos conhecer melhor? Você se considera:',
                ),
                // Text(
                //   'Vamos nos conhecer melhor? Você se considera:',
                //   // textAlign: TextAlign.left,
                //   style: Theme.of(context).textTheme.headline6,
                // ),
                SizedBox(
                  height: 49.0,
                ),
                ReusableCard(
                  cardImage: 'beginner.jpg',
                  cardText: 'Iniciante',
                  routeName: RouteGenerator.kBASE_ROUTE,
                ),
                ReusableCard(
                  cardImage: 'intermediate.jpg',
                  cardText: 'Intermediário',
                  routeName: RouteGenerator.kBASE_ROUTE,
                ),
                ReusableCard(
                  cardImage: 'advanced.jpg',
                  cardText: 'Avançado',
                  routeName: RouteGenerator.kBASE_ROUTE,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 21.0),
                  child: Text(
                      'Você poderá alterar sua escolha futuramente na aba de Perfil.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

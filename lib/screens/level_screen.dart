import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableCard.dart';

class Level extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Namastê João',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 19.0),
                Text(
                  'Vamos nos conhecer melhor? Você se considera:',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 49.0,
                ),
                ReusableCard(
                  cardImage: 'beginner.jpg',
                  cardText: 'Iniciante',
                  routeName: RouteGenerator.kSIGNUP_ROUTE,
                ),
                ReusableCard(
                  cardImage: 'intermediate.jpg',
                  cardText: 'Intermediário',
                  routeName: RouteGenerator.kLOGIN_ROUTE,
                ),
                ReusableCard(
                  cardImage: 'advanced.jpg',
                  cardText: 'Avançado',
                  routeName: RouteGenerator.kSIGNUP_ROUTE,
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

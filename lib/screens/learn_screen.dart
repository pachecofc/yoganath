import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableCard.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Learn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ReusableTitle(
            text: 'Aprenda Mais',
            isPremium: false,
          ),
          ReusableCard(
            cardImage: 'Patanjali_Statue.jpg',
            cardText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
            routeName: RouteGenerator.kLEARN_ROUTE,
          ),
          ReusableCard(
            cardImage: 'simbolo-om.jpg',
            cardText:
                ' Nam quis nulla. Integer malesuada. In in enim a arcu imperdiet malesuada. Sed vel lectus. Donec odio urna, tempus molestie, porttitor ut, iaculis quis, sem.',
            routeName: RouteGenerator.kLEARN_ROUTE,
          ),
          ReusableCard(
            cardImage: '7-chakras.jpg',
            cardText:
                'Vestibulum fermentum tortor id mi. Pellentesque ipsum. Nulla non arcu lacinia neque faucibus fringilla.',
            routeName: RouteGenerator.kLEARN_ROUTE,
          ),
          SizedBox(
            height: 40.0,
          ),
          ReusableTitle(text: 'Você sabia?', isPremium: false),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.'),
        ],
      ),
    );
  }
}

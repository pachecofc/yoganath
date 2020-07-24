import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Birthday extends StatelessWidget {
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
                SizedBox(height: 17.0),
                ReusableSubtitle(
                  text: 'Feliz Aniversário pra Você!',
                ),
                SizedBox(
                  height: 39.0,
                ),
                Text(
                    'Eu, sua professora Nat, desejo a você muita saúde, paz e prosperidade!'),
                Text('Feliz Aniversário e continue praticando Yoga conosco.'),
                SizedBox(
                  height: 57.0,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/baloons.jpg'),
                  maxRadius: 150.0,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 58.0,
                ),
                ReusableRaisedButton(
                    buttonText: 'CONTINUAR',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.kBASE_ROUTE);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

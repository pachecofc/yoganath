import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';

class Plans extends StatelessWidget {
  final String expensive = '\$\$';
  final String mostExpensive = '\$\$\$';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ReusablePlanCard(
          planName: 'Anual',
          planPrice: 'R\$ 118,80 / ano, equivale a R\$ 9,90 / mês',
        ),
        ReusablePlanCard(
          planName: 'Semestral',
          planPrice: 'R\$ 165,6 / ano, equivale a R\$ 13,80 / mês',
          planSymbol: expensive,
        ),
        ReusablePlanCard(
          planName: 'Mensal',
          planPrice: 'R\$ 18,50 / mês',
          planSymbol: mostExpensive,
        ),
      ],
    );
  }
}

class ReusablePlanCard extends StatelessWidget {
  const ReusablePlanCard(
      {@required this.planName,
      @required this.planPrice,
      this.planSymbol = '\$'});

  final String planName;
  final String planPrice;
  final String planSymbol;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Plano $planName',
                  style: Theme.of(context).textTheme.headline5,
                ),
                CircleAvatar(
                  backgroundColor: Theme.of(context).bottomAppBarColor,
                  radius: 24.0,
                  child: Text(
                    planSymbol,
                    style: TextStyle(
                      color: Theme.of(context).buttonColor,
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Text(planPrice),
                ],
              ),
            ),
            ReusableRaisedButton(
                buttonText: 'ESCOLHER ESTE PLANO', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

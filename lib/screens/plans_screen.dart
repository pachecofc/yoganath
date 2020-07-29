import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusablePlanCard.dart';

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

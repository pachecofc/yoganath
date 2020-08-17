import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoganath/widgets/reusablePlanCard.dart';

class Plans extends StatelessWidget {
  final String expensive = '\$\$';
  final String mostExpensive = '\$\$\$';
  final String firstPlanName = 'Anual';
  final String firstPlanPrice = 'R\$ 118,80 / ano, equivale a R\$ 9,90 / mês';
  final String secondPlanName = 'Semestral';
  final String secondPlanPrice = 'R\$ 165,6 / ano, equivale a R\$ 13,80 / mês';
  final String thirdPlanName = 'Mensal';
  final String thirdPlanPrice = 'R\$ 18,50 / mês';

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IosPlansList(
            expensive: expensive,
            mostExpensive: mostExpensive,
            firstPlanName: firstPlanName,
            firstPlanPrice: firstPlanPrice,
            secondPlanName: secondPlanName,
            secondPlanPrice: secondPlanPrice,
            thirdPlanName: thirdPlanName,
            thirdPlanPrice: thirdPlanPrice,
          )
        : AndroidPlansList(
            expensive: expensive,
            mostExpensive: mostExpensive,
            firstPlanName: firstPlanName,
            firstPlanPrice: firstPlanPrice,
            secondPlanName: secondPlanName,
            secondPlanPrice: secondPlanPrice,
            thirdPlanName: thirdPlanName,
            thirdPlanPrice: thirdPlanPrice,
          );
  }
}

class IosPlansList extends StatelessWidget {
  const IosPlansList({
    @required this.expensive,
    @required this.mostExpensive,
    @required this.firstPlanName,
    @required this.firstPlanPrice,
    @required this.secondPlanName,
    @required this.secondPlanPrice,
    @required this.thirdPlanName,
    @required this.thirdPlanPrice,
  });

  final String expensive;
  final String mostExpensive;
  final String firstPlanName;
  final String firstPlanPrice;
  final String secondPlanName;
  final String secondPlanPrice;
  final String thirdPlanName;
  final String thirdPlanPrice;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        ReusablePlanCard(
          planName: firstPlanName,
          planPrice: firstPlanPrice,
        ),
        ReusablePlanCard(
          planName: secondPlanName,
          planPrice: secondPlanPrice,
          planSymbol: expensive,
        ),
        ReusablePlanCard(
          planName: thirdPlanName,
          planPrice: thirdPlanPrice,
          planSymbol: mostExpensive,
        ),
      ],
    );
  }
}

class AndroidPlansList extends StatelessWidget {
  const AndroidPlansList({
    @required this.expensive,
    @required this.mostExpensive,
    @required this.firstPlanName,
    @required this.firstPlanPrice,
    @required this.secondPlanName,
    @required this.secondPlanPrice,
    @required this.thirdPlanName,
    @required this.thirdPlanPrice,
  });

  final String expensive;
  final String mostExpensive;
  final String firstPlanName;
  final String firstPlanPrice;
  final String secondPlanName;
  final String secondPlanPrice;
  final String thirdPlanName;
  final String thirdPlanPrice;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ReusablePlanCard(
          planName: firstPlanName,
          planPrice: firstPlanPrice,
        ),
        ReusablePlanCard(
          planName: secondPlanName,
          planPrice: secondPlanPrice,
          planSymbol: expensive,
        ),
        ReusablePlanCard(
          planName: thirdPlanName,
          planPrice: thirdPlanPrice,
          planSymbol: mostExpensive,
        ),
      ],
    );
  }
}

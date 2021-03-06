import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: Colors.black87,
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(planPrice),
            ),
            ReusableRaisedButton(
                buttonText: 'ESCOLHER ESTE PLANO',
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.kCLASS_ROUTE);
                }),
          ],
        ),
      ),
    );
  }
}

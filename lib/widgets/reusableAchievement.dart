import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableSlider.dart';
import 'package:yoganath/widgets/reusableStar.dart';

class ReusableAchievement extends StatelessWidget {
  const ReusableAchievement(
      {@required this.goalTitle,
      @required this.goalDescription,
      @required this.progress});

  final String goalTitle;
  final String goalDescription;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          // Achievement title
          Container(
            color: primaryColor,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    goalTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(goalDescription),
                ],
              ),
            ),
          ),
          // Achievement status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ReusableSlider(initialValue: progress),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Row(
                    children: <Widget>[
                      ReusableStar(starStyle: Icons.star_border),
                      ReusableStar(starStyle: Icons.star_border),
                      ReusableStar(starStyle: Icons.star_border),
                      ReusableStar(starStyle: Icons.star_border),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

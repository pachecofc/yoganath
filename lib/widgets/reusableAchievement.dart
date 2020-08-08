import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableSlider.dart';
import 'package:yoganath/widgets/reusableStar.dart';

class ReusableAchievement extends StatelessWidget {
  const ReusableAchievement(
      {@required this.goalTitle,
      @required this.goalDescription,
      @required this.progress,
      @required this.numOfStars});

  final String goalTitle;
  final String goalDescription;
  final double progress;
  final int numOfStars;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
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
              padding: const EdgeInsets.all(8.0),
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
          // Achievement Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ReusableSlider(initialValue: progress),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: <Widget>[
                    numOfStars >= 1
                        ? ReusableStar(starStyle: Icons.star)
                        : ReusableStar(starStyle: Icons.star_border),
                    numOfStars >= 2
                        ? ReusableStar(starStyle: Icons.star)
                        : ReusableStar(starStyle: Icons.star_border),
                    numOfStars >= 3
                        ? ReusableStar(starStyle: Icons.star)
                        : ReusableStar(starStyle: Icons.star_border),
                    numOfStars >= 4
                        ? ReusableStar(starStyle: Icons.star)
                        : ReusableStar(starStyle: Icons.star_border),
                    numOfStars == 5
                        ? ReusableStar(starStyle: Icons.star)
                        : ReusableStar(starStyle: Icons.star_border),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

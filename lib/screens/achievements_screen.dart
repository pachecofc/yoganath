import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableAchievement.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableYogaPoints.dart';

class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ProfileHeader(),
          ReusableAchievement(
            goalTitle: 'Ásanas',
            goalDescription: 'Complete 14 aulas',
            progress: 50.0,
            numOfStars: 0,
          ),
          ReusableAchievement(
            goalTitle: 'Pranayamas',
            goalDescription: 'Complete 7 aulas',
            progress: 70.0,
            numOfStars: 1,
          ),
          ReusableAchievement(
            goalTitle: 'Meditação',
            goalDescription: 'Complete 21 aulas',
            progress: 10.0,
            numOfStars: 2,
          ),
          ReusableAchievement(
            goalTitle: 'Prática Diária',
            goalDescription: 'Complete 1 aula',
            progress: 0,
            numOfStars: 3,
          ),
          ReusableAchievement(
            goalTitle: 'Intelectual',
            goalDescription: 'Complete 30 leituras',
            progress: 90.0,
            numOfStars: 4,
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Avatar
          Expanded(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/meditation.png',
                  width: 60.0,
                  height: 68.09,
                ),
                ReusableFlatButton(
                    buttonText: 'INSERIR FOTO', onPressed: () {}),
              ],
            ),
          ),
          // User name and level
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Nathalia Steindorfer',
                    textAlign: TextAlign.center,
                  ),
                ),
                Text('Mestre'),
              ],
            ),
          ),
          // User score
          Expanded(
            child: ReusableYogaPoints(score: 512),
          ),
        ],
      ),
    );
  }
}

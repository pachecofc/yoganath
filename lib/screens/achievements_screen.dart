import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableAchievement.dart';

class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ReusableAchievement(
            goalTitle: 'Ásanas',
            goalDescription: 'Complete 14 aulas',
            progress: 50.0,
          ),
          ReusableAchievement(
            goalTitle: 'Pranayamas',
            goalDescription: 'Complete 7 aulas',
            progress: 70.0,
          ),
          ReusableAchievement(
            goalTitle: 'Meditação',
            goalDescription: 'Complete 21 aulas',
            progress: 10.0,
          ),
          ReusableAchievement(
            goalTitle: 'Prática Diária',
            goalDescription: 'Complete 1 aula',
            progress: 0,
          ),
          ReusableAchievement(
            goalTitle: 'Intelectual',
            goalDescription: 'Complete 30 leituras',
            progress: 90.0,
          ),
        ],
      ),
    );
  }
}

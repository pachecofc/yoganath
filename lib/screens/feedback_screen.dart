import 'package:flutter/material.dart';
import 'package:yoganath/utilities/setOrientation.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class ClassFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setOrientation(Orientation.portrait);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ReusableTitle(
                  text: 'Parabéns, João!',
                  isPremium: false,
                ),
                SizedBox(height: 19.0),
                ReusableSubtitle(
                  text: 'Você ganhou',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

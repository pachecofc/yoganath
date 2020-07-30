import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/setOrientation.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableSmiley.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';
import 'package:yoganath/widgets/reusableTitle.dart';
import 'package:yoganath/widgets/reusableYogaPoints.dart';

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
                ReusableSubtitle(text: 'Você ganhou'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ReusableYogaPoints(score: 100),
                ),
                SizedBox(height: 55.0),
                ReusableSubtitle(text: 'Como você se sente?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ReusableSmiley(smiley: Icons.sentiment_very_satisfied),
                    ReusableSmiley(smiley: Icons.sentiment_satisfied),
                    ReusableSmiley(smiley: Icons.sentiment_neutral),
                    ReusableSmiley(smiley: Icons.sentiment_dissatisfied),
                    ReusableSmiley(smiley: Icons.sentiment_very_dissatisfied),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Sentiment(),
                ),
                ReusableRaisedButton(
                    buttonText: 'CONCLUIR',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.kPROFILE_ROUTE);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Sentiment extends StatefulWidget {
  @override
  _SentimentState createState() => _SentimentState();
}

class _SentimentState extends State<Sentiment> {
  String _selectedSentiment = 'Eu me sinto...';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedSentiment,
      items: [
        DropdownMenuItem(
          child: Text('Eu me sinto...'),
          value: 'Eu me sinto...',
        ),
        DropdownMenuItem(
          child: Text('Tranquilo (a)'),
          value: 'tranquilo',
        ),
        DropdownMenuItem(
          child: Text('Dolorido (a)'),
          value: 'dolorido',
        ),
        DropdownMenuItem(
          child: Text('Relaxado (a)'),
          value: 'relaxado',
        ),
        DropdownMenuItem(
          child: Text('Feliz'),
          value: 'feliz',
        ),
      ],
      onChanged: (value) {
        setState(() {
          _selectedSentiment = value;
        });
      },
    );
  }
}

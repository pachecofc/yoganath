import 'package:flutter/material.dart';
import 'package:yoganath/screens/plans_screen.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Premium extends StatelessWidget {
  final List<String> _benefits = [
    'Reflexão do dia',
    'Práticas avulsas',
    'Timer meditação',
    'Agenda de eventos',
    'Leituras do Yoga',
    'Desafios semanais',
    'Aulas personalizadas',
    'Aulas completas',
    'Aulas ao vivo',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Header(),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: buildBenefits(context, true),
                    ),
                    Expanded(
                      child: buildBenefits(context, false),
                    ),
                  ],
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildBenefits(BuildContext context, bool isPremium) {
    Color secondaryColor = Theme.of(context).accentColor;
    return ListView(
      children: _benefits
          .map(
            (benefit) => ListTile(
              leading: isPremium
                  ? Icon(
                      Icons.check_box,
                      color: secondaryColor,
                    )
                  : _benefits.indexOf(benefit) < 6
                      ? Icon(
                          Icons.check_box,
                          color: secondaryColor,
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          color: secondaryColor,
                        ),
              title: Text(benefit),
            ),
          )
          .toList(),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableRaisedButton(
                buttonText: 'SEJA PREMIUM',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Plans(),
                  );
                }),
          ),
          Expanded(
            child: ReusableFlatButton(
                buttonText: 'Continue Grátis',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      child: Column(
        children: <Widget>[
          ReusableTitle(text: 'Seja Premium', isPremium: true),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Veja os benefícios de um aluno Premium'),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(
                    'Premium',
                    style: TextStyle(color: Theme.of(context).buttonColor),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text('Gratuito'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

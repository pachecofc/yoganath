import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableCard.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ReusableTitle(text: 'Nath Agenda', isPremium: false),
          Card(
            shadowColor: Theme.of(context).bottomAppBarColor,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).buttonColor,
                    ),
                    Column(
                      children: <Widget>[
                        ReusableSubtitle(text: 'Eventos'),
                        Text('Presenciais'),
                      ],
                    ),
                    Icon(
                      Icons.share,
                      color: Theme.of(context).buttonColor,
                    )
                  ],
                ),
                Image.asset('assets/images/mapa.png'),
                Text(
                    'Greyhound divisively hello coldly wonderfully marginally far…'),
                ReusableFlatButton(
                    buttonText: 'ADICIONAR AO CALENDÁRIO',
                    onPressed: () {
                      buildSnackBar(context);
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 46.5,
          ),
          ReusableTitle(text: 'Aulas ao Vivo', isPremium: true),
          ReusableCard(
            cardImage: 'sirshasana.jpg',
            cardText: 'Data: 01/ago/2020',
            secondTextLine: 'Horário: 19:30',
            reusableFlatButton: ReusableFlatButton(
                buttonText: 'AGENDAR',
                onPressed: () {
                  buildSnackBar(context);
                }),
          ),
        ],
      ),
    );
  }

  void buildSnackBar(BuildContext context) {
    final snackbar = SnackBar(
      backgroundColor: Theme.of(context).buttonColor,
      duration: Duration(seconds: 3),
      content: Text('Evento agendado com sucesso!'),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}

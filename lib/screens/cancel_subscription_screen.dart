import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/cancelConfirmationDialog.dart';
import 'package:yoganath/widgets/reusableDangerButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';

class CancelSubscription extends StatelessWidget {
  final String _message =
      'Sua assinatura foi cancelada, mas você ainda pode usufruir de todos os benefícios até o final do período vigente da assinatura (27/jan/2021).';
  final String _title = 'Assinatura Cancelada';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cancelamento de Assinatura'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.jpg',
                        width: MediaQuery.of(context).size.width * 0.848,
                      ),
                      SizedBox(height: 32.0),
                      Text(
                          'Ao cancelar seu plano Premium, você deixará de usufruir dos seguintes benefícios:'),
                      SizedBox(height: 43.0),
                      LostBenefits(benefit: 'Aulas completas'),
                      LostBenefits(benefit: 'Desafios semanais'),
                      LostBenefits(benefit: 'Aulas ao vivo'),
                      LostBenefits(benefit: 'Orientação profissional'),
                    ],
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Column(
                  children: <Widget>[
                    ReusableRaisedButton(
                      buttonText: 'OK, MUDEI DE IDEIA :)',
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kBASE_ROUTE);
                      },
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    ReusableDangerButton(
                      buttonText: 'Cancelar assim mesmo :(',
                      onPressed: () {
                        showCancelConfirmationDialog(context, _message, _title);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LostBenefits extends StatelessWidget {
  const LostBenefits({@required this.benefit});

  final String benefit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.close,
        color: Color(0xffA2001D),
      ),
      title: Text(benefit),
    );
  }
}

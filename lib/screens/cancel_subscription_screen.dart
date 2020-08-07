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
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cancelar Assinatura'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        screenSize.height > 430
                            ? Image.asset(
                                'assets/images/logo.jpg',
                                width: screenSize.width * 0.848,
                              )
                            : Container(),
                        screenSize.height > 430
                            ? SizedBox(height: 32.0)
                            : Container(),
                        Text(
                            'Ao cancelar seu plano Premium, você deixará de usufruir dos seguintes benefícios:'),
                        screenSize.height > 430
                            ? SizedBox(height: screenSize.height * 0.1)
                            : Container(),
                        LostBenefits(benefit: 'Aulas completas'),
                        LostBenefits(benefit: 'Aulas ao vivo'),
                        LostBenefits(benefit: 'Orientação profissional'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      ReusableRaisedButton(
                        buttonText: 'OK, MUDEI DE IDEIA :)',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteGenerator.kBASE_ROUTE);
                        },
                      ),
                      screenSize.height > 430
                          ? SizedBox(height: 32.0)
                          : Container(),
                      ReusableDangerButton(
                        buttonText: 'Cancelar assim mesmo :(',
                        onPressed: () {
                          showCancelConfirmationDialog(
                              context, _message, _title);
                        },
                      ),
                    ],
                  ),
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

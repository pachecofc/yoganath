import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/buildNavigationBar.dart';
import 'package:yoganath/widgets/reusableAcceptTerms.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appBarTitle = Text('Conheça a Nath');
    var pageBody = Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ReusableMidiaCard(imageName: 'sobre_Nath.png', isChecked: false),
            Material(
              child: Text(
                  'Oi João, eu sou a Nat, sua professora de yoga online. Tenho 30 anos e atualmente moro em Fortaleza/CE. Eu entendo que um bom professor de yoga te conduz a uma autoinvestigação muito além dos asanas (as práticas físicas), e a minha missão é exatamente essa, te apresentar uma outra visão do yoga além dos asanas e te guiar por um caminho de aprimoramento pessoal, por isso eu fiz questão que esse app trouxesse algo além das posturas.'),
            ),
            ReusableFlatButton(
                buttonText: 'Ler mais',
                onPressed: () {
                  Navigator.pushNamed(context, RouteGenerator.kABOUTMORE_ROUTE);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // @nathsteins
                Image.asset(
                  'assets/images/Instagram.png',
                  width: 24.0,
                  height: 24.0,
                ),
                // @ioganath
                Image.asset(
                  'assets/images/Facebook.png',
                  width: 24.0,
                  height: 24.0,
                ),
              ],
            ),
            // Termos
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ReusableAcceptTerms(
                  withCheckbox: false, startingText: 'Consulte os '),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Versão do app: 1.0.0',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  'ID do aluno: a1xy3m4o',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return SafeArea(
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: buildCupertinoNavigationBar(context, appBarTitle),
              child: pageBody,
            )
          : Scaffold(
              appBar: AppBar(
                title: appBarTitle,
              ),
              body: pageBody,
            ),
    );
  }
}

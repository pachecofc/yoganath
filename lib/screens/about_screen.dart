import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Conheça a Nath'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ReusableTitle(text: 'Quem é a Nath?', isPremium: false),
                ReusableMidiaCard(
                    imageName: 'sobre_Nath.png', isChecked: false),
                Text(
                    'Oi João, eu sou a Nat, sua professora de yoga online. Tenho 30 anos e atualmente moro em Fortaleza/CE. Eu entendo que um bom professor de yoga te conduz a uma autoinvestigação muito além dos asanas (as práticas físicas), e a minha missão é exatamente essa, te apresentar uma outra visão do yoga além dos asanas e te guiar por um caminho de aprimoramento pessoal, por isso eu fiz questão que esse app trouxesse algo além das posturas.'),
                ReusableFlatButton(
                    buttonText: 'Ler mais',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteGenerator.kABOUTMORE_ROUTE);
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
                ListTile(
                  title: Text('Termos de Uso'),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Política de Privacidade'),
                  onTap: () {},
                ),
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
          ),
        ),
      ),
    );
  }
}

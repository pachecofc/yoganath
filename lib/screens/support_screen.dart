import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/utilities/buildNavigationBar.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Support extends StatelessWidget {
  final List<String> _searchHints = [
    'Lorem ipsum dolor sit amet',
    'Consectetur adipiscing elit, sed do',
    'Eiusmod tempor incididunt ut labore',
    'Lorem ipsum dolor sit amet',
    'Consectetur adipiscing elit, sed do',
    'Eiusmod tempor incididunt ut labore',
    'Lorem ipsum dolor sit amet',
    'Consectetur adipiscing elit, sed do',
    'Eiusmod tempor incididunt ut labore',
  ];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appBarTitle = Text('Suporte do App');
    var pageBody = Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ReusableTextFormField(
              textEditingController: _searchController,
              isObscure: false,
              label: 'Termo de busca',
              hint: 'Digite o termo de busca',
              errorMessage: null,
              keyboardType: TextInputType.text,
              suffixIcon: Platform.isIOS
                  ? Icon(CupertinoIcons.search,
                      color: Theme.of(context).primaryColor)
                  : Icon(Icons.search),
            ),
          ),
          for (var hint in _searchHints)
            Material(
              child: ListTile(
                title: Text(
                  hint,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          Footer(),
        ],
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

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Material(
              child: Text(
                  'Se sua pergunta não estiver na lista, clique no botão abaixo para enviar um e-mail ao suporte técnico do app.'),
            ),
            SizedBox(
              height: 24.0,
            ),
            ReusableRaisedButton(
                buttonText: 'SUPORTE TÉCNICO', onPressed: () {}),
            Material(
              child: Text(
                '* Só envie perguntas relacionadas a dúvidas técnicas do aplicativo. Para saber mais sobre o Yoga ou solicitar um plano de aulas personalizadas, clique abaixo.',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            ReusableFlatButton(
                buttonText: 'AULAS PERSONALIZADAS', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Suporte do App'),
        ),
        body: Padding(
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
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              for (var hint in _searchHints)
                ListTile(
                  title: Text(hint),
                ),
              Footer(),
            ],
          ),
        ),
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
        // height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: <Widget>[
            Text(
                'Se sua pergunta não estiver na lista, clique no botão abaixo para enviar um e-mail ao suporte técnico do app.'),
            SizedBox(
              height: 24.0,
            ),
            ReusableRaisedButton(
                buttonText: 'SUPORTE TÉCNICO', onPressed: () {}),
            Text(
              '* Só envie perguntas relacionadas a dúvidas técnicas do aplicativo. Para saber mais sobre o Yoga ou solicitar um plano de aulas personalizadas, clique abaixo.',
              style: Theme.of(context).textTheme.caption,
            ),
            ReusableFlatButton(
                buttonText: 'AULAS PERSONALIZADAS', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

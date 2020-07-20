import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO Criar Scaffold
    return Column(
      children: <Widget>[
        Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/images/logo.jpg',
            width: MediaQuery.of(context).size.width * 0.848,
          ),
        ),
        Text('E-mail'),
        Text('Senha'),
        Text('Botão')
      ],
    );
  }
}

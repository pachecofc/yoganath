import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableAcceptTerms.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    final Padding pageBody = Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/images/logo.jpg',
                width: _screenSize.width * 0.848,
              ),
            ),
            SizedBox(height: _screenSize.height * 0.04),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ReusableTextFormField(
                      textEditingController: _emailController,
                      isObscure: false,
                      label: 'E-mail',
                      hint: 'seu@email.com',
                      errorMessage: 'Por favor, digite seu e-mail',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: _screenSize.height * 0.053),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ReusableTextFormField(
                      textEditingController: _passController,
                      isObscure: true,
                      suffixIcon: Platform.isIOS
                          ? Icon(CupertinoIcons.eye)
                          : Icon(Icons.visibility),
                      label: 'Senha',
                      hint: null,
                      errorMessage: 'Por favor, digite sua senha',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: _screenSize.height * 0.047),
                  ReusableRaisedButton(
                    buttonText: 'ENTRAR',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.kBIRTHDAY_ROUTE);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: _screenSize.height * 0.03),
            Text('Ainda não é cadastrado?'),
            ReusableFlatButton(
              buttonText: 'Cadastrar',
              onPressed: () {
                Navigator.pushNamed(context, RouteGenerator.kSIGNUP_ROUTE);
              },
            ),
            Platform.isIOS
                ? Material(
                    child: ReusableAcceptTerms(),
                    color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                  )
                : ReusableAcceptTerms(),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? SafeArea(
            child: CupertinoPageScaffold(
              child: CupertinoScrollbar(child: pageBody),
            ),
          )
        : AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Color(0xff996E48),
            ),
            child: SafeArea(
              child: Scaffold(
                body: pageBody,
              ),
            ),
          );
  }
}

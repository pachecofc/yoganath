import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/buildNavigationBar.dart';
import 'package:yoganath/widgets/reusableAcceptTerms.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Signup extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    final Text appBarTitle = Text('Cadastre-se');
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
            SizedBox(
              height: _screenSize.height * 0.05,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ReusableTextFormField(
                      textEditingController: _nameController,
                      isObscure: false,
                      label: 'Nome',
                      hint: 'Seu Nome',
                      errorMessage: 'Por favor, digite seu nome',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: _screenSize.height * 0.05),
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
                  SizedBox(height: _screenSize.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ReusableTextFormField(
                      textEditingController: _passController,
                      isObscure: true,
                      suffixIcon: Platform.isIOS
                          ? Icon(
                              CupertinoIcons.eye,
                              color: Theme.of(context).primaryColor,
                            )
                          : Icon(Icons.visibility),
                      label: 'Senha',
                      hint: null,
                      errorMessage: 'Por favor, digite sua senha',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(height: _screenSize.height * 0.04),
                  ReusableRaisedButton(
                    buttonText: 'CADASTRAR',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.kBASE_ROUTE);
                    },
                  ),
                ],
              ),
            ),
            Material(
              child: ReusableAcceptTerms(
                withCheckbox: true,
                startingText: 'Ao continuar, você concorda com os ',
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            )
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

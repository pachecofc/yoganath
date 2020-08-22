import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoganath/models/user.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/buildNavigationBar.dart';
import 'package:yoganath/widgets/reusableAcceptTerms.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // TODO Remove default arguments after testing
  final TextEditingController _nameController =
      TextEditingController(text: 'Fabio Pacheco');

  final TextEditingController _emailController =
      TextEditingController(text: 'pachecofc@msn.com');

  final TextEditingController _passController =
      TextEditingController(text: '123abc');

  String _nameErrorMessage = '';
  String _emailErrorMessage = '';
  String _passErrorMessage = '';
  String _generalErrorMessage = '';

  void _validateFields() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passController.text;

    if (name.length >= 3) {
      setState(() {
        _nameErrorMessage = '';
        _generalErrorMessage = '';
      });
    } else {
      setState(() {
        _nameErrorMessage = 'Nome precisa ter mais que 2 caracteres';
      });
    }

    if (email.isNotEmpty && email.contains('@')) {
      setState(() {
        _emailErrorMessage = '';
        _generalErrorMessage = '';
      });
    } else {
      setState(() {
        _emailErrorMessage = 'Prencha o e-mail utilizando @';
      });
    }

    if (password.length >= 6) {
      setState(() {
        _passErrorMessage = '';
        _generalErrorMessage = '';
      });
    } else {
      setState(() {
        _passErrorMessage = 'Senha precisa ter mais que 5 caracteres';
      });
    }

    if (_nameErrorMessage == '' &&
        _emailErrorMessage == '' &&
        _passErrorMessage == '' &&
        _generalErrorMessage == '') {
      AppUser appUser = AppUser();
      appUser.name = name;
      appUser.email = email;
      appUser.password = password;

      // _signupUser(appUser);
    }
  }

  Text buildErrorMessage(BuildContext context, String errorMessage) {
    return Text(
      errorMessage,
      style: Theme.of(context)
          .textTheme
          .caption
          .copyWith(color: Theme.of(context).errorColor),
    );
  }

  void _signupUser(AppUser appUser) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
      email: appUser.email,
      password: appUser.password,
    )
        .then((firebaseUser) {
      Navigator.pushReplacementNamed(context, RouteGenerator.kBASE_ROUTE);
    }).catchError((error) {
      setState(() {
        _generalErrorMessage =
            'Erro ao cadastrar usuário. Verifique os campos e tente novamente.';
      });
    });
  }

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
            Column(
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
                buildErrorMessage(context, _nameErrorMessage),
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
                buildErrorMessage(context, _emailErrorMessage),
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
                buildErrorMessage(context, _passErrorMessage),
                SizedBox(height: _screenSize.height * 0.04),
                ReusableRaisedButton(
                  buttonText: 'CADASTRAR',
                  onPressed: () {
                    _validateFields();
                  },
                ),
                buildErrorMessage(context, _generalErrorMessage),
              ],
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

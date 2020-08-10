import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/cancelConfirmationDialog.dart';
import 'package:yoganath/widgets/reusableDangerButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Account extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Minha Conta'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5.0,
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
                      SizedBox(
                        height: 32.0,
                      ),
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
                      SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ReusableTextFormField(
                          textEditingController: _passController,
                          isObscure: true,
                          suffixIcon: Icon(Icons.visibility),
                          label: 'Senha',
                          hint: null,
                          errorMessage: 'Por favor, digite sua senha',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ReusableTextFormField(
                          textEditingController: _phoneController,
                          isObscure: false,
                          label: 'Telefone',
                          hint: '(85) 98765-1234',
                          errorMessage: null,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ReusableTextFormField(
                          textEditingController: _dateController,
                          isObscure: false,
                          label: 'Data de nascimento',
                          hint: '01/jul/1985',
                          errorMessage: null,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      ReusableRaisedButton(
                        buttonText: 'SALVAR ALTERAÇÕES',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteGenerator.kPROFILE_ROUTE);
                        },
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      ReusableDangerButton(
                          buttonText: 'Excluir conta',
                          onPressed: () {
                            showAlertDialog(context);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    final String _accountCancelConfirmTitle = 'Conta Cancelada';
    final String _accountCancelConfirmMessage =
        'Sentimos muito que tenha cancelado sua conta. Esperamos te ver novamente em breve.';
    final String _title = 'Tem certeza?';
    final String _content = 'Excluir sua conta irá apagar permanentemente '
        'seus dados, mas isso **não** irá cancelar sua assinatura. Vá até '
        'Perfil > Assinatura para mais informações.';

    showDialog(
      context: context,
      builder: (context) {
        return Platform.isIOS
            ? IosAlertDialog(
                title: _title,
                content: _content,
                accountCancelConfirmMessage: _accountCancelConfirmMessage,
                accountCancelConfirmTitle: _accountCancelConfirmTitle)
            : AndroidAlertDialog(
                title: _title,
                content: _content,
                accountCancelConfirmMessage: _accountCancelConfirmMessage,
                accountCancelConfirmTitle: _accountCancelConfirmTitle);
      },
    );
  }
}

class AndroidAlertDialog extends StatelessWidget {
  const AndroidAlertDialog({
    Key key,
    @required String title,
    @required String content,
    @required String accountCancelConfirmMessage,
    @required String accountCancelConfirmTitle,
  })  : _title = title,
        _content = content,
        _accountCancelConfirmMessage = accountCancelConfirmMessage,
        _accountCancelConfirmTitle = accountCancelConfirmTitle,
        super(key: key);

  final String _title;
  final String _content;
  final String _accountCancelConfirmMessage;
  final String _accountCancelConfirmTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: ReusableSubtitle(text: _title),
      content: Text(_content),
      actions: [
        ReusableRaisedButton(
          buttonText: 'MANTER CONTA',
          onPressed: () {
            Navigator.pushReplacementNamed(context, RouteGenerator.kBASE_ROUTE);
          },
        ),
        ReusableDangerButton(
          buttonText: 'Excluir conta',
          onPressed: () {
            showCancelConfirmationDialog(context, _accountCancelConfirmMessage,
                _accountCancelConfirmTitle);
          },
        ),
      ],
    );
  }
}

class IosAlertDialog extends StatelessWidget {
  const IosAlertDialog({
    Key key,
    @required String title,
    @required String content,
    @required String accountCancelConfirmMessage,
    @required String accountCancelConfirmTitle,
  })  : _title = title,
        _content = content,
        _accountCancelConfirmMessage = accountCancelConfirmMessage,
        _accountCancelConfirmTitle = accountCancelConfirmTitle,
        super(key: key);

  final String _title;
  final String _content;
  final String _accountCancelConfirmMessage;
  final String _accountCancelConfirmTitle;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(_title),
      content: Text(_content),
      actions: [
        CupertinoDialogAction(
          child: Text(
            'MANTER CONTA',
            style: TextStyle(color: Theme.of(context).buttonColor),
          ),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pushReplacementNamed(context, RouteGenerator.kBASE_ROUTE);
          },
        ),
        CupertinoDialogAction(
          child: Text(
            'Excluir conta',
            style: TextStyle(
              color: Color(0xffA2001D),
            ),
          ),
          onPressed: () {
            showCancelConfirmationDialog(context, _accountCancelConfirmMessage,
                _accountCancelConfirmTitle);
          },
        ),
      ],
    );
  }
}

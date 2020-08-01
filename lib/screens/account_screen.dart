import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableDangerButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

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
          title: Text('Perfil'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ReusableTitle(text: 'Minha Conta', isPremium: false),
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
                              context, RouteGenerator.kBASE_ROUTE);
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
                      // RaisedButton(onPressed: null)
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
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: ReusableSubtitle(text: 'Tem certeza?'),
          titlePadding: EdgeInsets.all(43.0),
          content: Text(
              'Excluir sua conta irá apagar permanentemente seus dados, mas isso **não** irá cancelar sua assinatura. Vá até Perfil > Assinatura para mais informações.'),
          contentPadding: EdgeInsets.fromLTRB(43.0, 0.0, 43.0, 26.0),
          actions: <Widget>[
            ReusableRaisedButton(
                buttonText: 'MANTER CONTA',
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.kBASE_ROUTE);
                }),
            ReusableDangerButton(
                buttonText: 'Excluir conta',
                onPressed: () {
                  showCancelConfirmationDialog(context);
                }),
          ],
        );
      },
    );
  }

  void showCancelConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: ReusableSubtitle(text: 'Conta Cancelada'),
          titlePadding: EdgeInsets.all(43.0),
          content: Text(
              'Sentimos muito que tenha cancelado sua conta. Esperamos te ver novamente em breve.'),
          contentPadding: EdgeInsets.fromLTRB(43.0, 0.0, 43.0, 26.0),
          actions: <Widget>[
            ReusableRaisedButton(
                buttonText: 'SAIR',
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteGenerator.kLOGIN_ROUTE);
                }),
          ],
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableCheckBox.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Signup extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    width: MediaQuery.of(context).size.width * 0.848,
                  ),
                ),
                SizedBox(
                  height: 61.54,
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
                        height: 50.0,
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
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ReusableTextFormField(
                          textEditingController: _passController,
                          isObscure: true,
                          label: 'Senha',
                          hint: null,
                          errorMessage: 'Por favor, digite sua senha',
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      ReusableRaisedButton(
                        buttonText: 'CADASTRAR',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 53.0,
                ),
                ReusableCheckboxListTile(
                  checkTitle:
                      'Ao continuar, você concorda com os Termos de Uso e Política de Privacidade do YogaNath.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

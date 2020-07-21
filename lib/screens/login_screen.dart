import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String _email = '';
  String _password = '';
  String _formData = '';
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
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
                  height: 70.54,
                ),
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
                          hint: 'meu@email.com',
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
                      RaisedButton(
                          child: Text('ENTRAR'),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              setState(() {
                                _formData =
                                    'E-mail: $_email; Senha: $_password.';
                              });
                              print(_formData);
                            }
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Text(
                  'Ainda não é cadastrado?',
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('Cadastrar'),
                ),
                SizedBox(
                  height: 70.0,
                ),
                CheckboxListTile(
                    title: Text(
                        'Ao continuar, você concorda com os Termos de Uso e Política de Privacidade do YogaNath.'),
                    value: _checked,
                    onChanged: (bool newValue) {
                      setState(() {
                        _checked = newValue;
                      });
                    },
                    activeColor: Theme.of(context).colorScheme.secondaryVariant,
                    controlAffinity: ListTileControlAffinity.platform),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

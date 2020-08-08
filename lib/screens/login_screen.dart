import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableCheckBox.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Color(0xff996E48),
      ),
      child: SafeArea(
        child: Scaffold(
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
                        ReusableRaisedButton(
                          buttonText: 'ENTRAR',
                          onPressed: () {
                            // TODO remove prints after testing
                            print(
                                'width: ${MediaQuery.of(context).size.width}');
                            print(
                                'height: ${MediaQuery.of(context).size.height}');
                            Navigator.pushReplacementNamed(
                                context, RouteGenerator.kBIRTHDAY_ROUTE);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    'Ainda não é cadastrado?',
                  ),
                  ReusableFlatButton(
                    buttonText: 'Cadastrar',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteGenerator.kSIGNUP_ROUTE);
                    },
                  ),
                  SizedBox(
                    height: 70.0,
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
      ),
    );
  }
}

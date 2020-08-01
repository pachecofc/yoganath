import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableDangerButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Subscription extends StatelessWidget {
  final TextEditingController _planType = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Assinatura'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      ReusableTitle(text: 'Minha Assinatura', isPremium: false),
                      SizedBox(
                        height: 5.0,
                      ),
                      ReusableTextFormField(
                        textEditingController: _planType,
                        isObscure: false,
                        label: 'Plano',
                        hint: null,
                        errorMessage: null,
                        keyboardType: TextInputType.text,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      ReusableTextFormField(
                        textEditingController: _expiryDate,
                        isObscure: false,
                        label: 'Data de validade',
                        hint: null,
                        errorMessage: null,
                        keyboardType: TextInputType.text,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 150.0,
                child: Column(
                  children: <Widget>[
                    ReusableRaisedButton(
                      buttonText: 'RENOVAR ASSINATURA',
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kBASE_ROUTE);
                      },
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    ReusableDangerButton(
                        buttonText: 'Cancelar assinatura',
                        onPressed: () {
                          // Ask for confirmation
                          Navigator.pushNamed(context,
                              RouteGenerator.kCANCELSUBSCRIPTION_ROUTE);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

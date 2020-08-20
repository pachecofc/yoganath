import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/buildNavigationBar.dart';
import 'package:yoganath/widgets/reusableDangerButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Subscription extends StatelessWidget {
  final TextEditingController _planType = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageBody = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    ReusableTextFormField(
                      textEditingController: _planType,
                      isObscure: false,
                      label: 'Plano',
                      hint: 'Plano Premium',
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
                      hint: '20/ago/2021',
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
          ),
          Container(
            height: 150.0,
            child: Column(
              children: <Widget>[
                ReusableRaisedButton(
                  buttonText: 'RENOVAR ASSINATURA',
                  onPressed: () {
                    Navigator.pushNamed(context, RouteGenerator.kPROFILE_ROUTE);
                  },
                ),
                SizedBox(
                  height: 32.0,
                ),
                ReusableDangerButton(
                    buttonText: 'Cancelar assinatura',
                    onPressed: () {
                      // Ask for confirmation
                      Navigator.pushNamed(
                          context, RouteGenerator.kCANCELSUBSCRIPTION_ROUTE);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
    var appBarTitle = Text('Minha Assinatura');

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

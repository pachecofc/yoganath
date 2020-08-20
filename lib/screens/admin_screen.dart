import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/utilities/buildNavigationBar.dart';
import 'package:yoganath/utilities/setOrientation.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  void deactivate() {
    super.deactivate();
    setOrientation(Orientation.portrait);
  }

  @override
  Widget build(BuildContext context) {
    setOrientation(Orientation.landscape);
    var appBarTitle = Text('Área de Administração');
    var pageBody = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          MediaQuery.of(context).size.height >= 360
              ? AdminHeader()
              : Container(),
          Expanded(
            // Usar widget DataTable
            child: Material(child: Text('Lista vai aqui...')),
          ),
        ],
      ),
    );
    return SafeArea(
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: buildCupertinoNavigationBar(context, appBarTitle),
              child: pageBody)
          : Scaffold(
              appBar: AppBar(
                title: appBarTitle,
              ),
              body: pageBody,
            ),
    );
  }
}

class AdminHeader extends StatelessWidget {
  final TextEditingController _search = TextEditingController();
  static const List<String> kTableTitle = [
    'Nome',
    'E-mail',
    'Telefone',
    'Data nascimento',
    'Plano Premium?'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableTitle(
                    text: 'Usuários Cadastrados', isPremium: false),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: ReusableTextFormField(
                    textEditingController: _search,
                    isObscure: false,
                    suffixIcon: Platform.isIOS
                        ? Icon(
                            CupertinoIcons.search,
                            color: Theme.of(context).primaryColor,
                          )
                        : Icon(Icons.search),
                    label: 'Termo de busca',
                    hint: 'Digite o termo de busca',
                    errorMessage: null,
                    keyboardType: TextInputType.text),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              for (String title in kTableTitle)
                Expanded(
                  child: Material(
                    child: Text(title),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

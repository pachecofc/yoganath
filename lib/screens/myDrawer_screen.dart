import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';

class MyDrawer extends StatelessWidget {
  final List<Widget> aboutBoxChildren = <Widget>[
    SizedBox(height: 24),
    Text('YogaNath é um aplicativo para práticas de yoga.'),
  ];

  ListTile buildListTile(BuildContext context, String title, String routeName) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        primary: false,
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Configurações do Perfil',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildListTile(context, 'Conta', RouteGenerator.kACCOUNT_ROUTE),
          buildListTile(
              context, 'Assinatura', RouteGenerator.kSUBSCRIPTION_ROUTE),
          buildListTile(context, 'Suporte', RouteGenerator.kSUPPORT_ROUTE),
          buildListTile(context, 'Conheça a Nath', RouteGenerator.kABOUT_ROUTE),
          buildListTile(
              context, 'Administração do app', RouteGenerator.kADMIN_ROUTE),
          AboutListTile(
            icon: Icon(Icons.info),
            applicationIcon: Image.asset(
              'assets/images/logo.jpg',
              height: 24.0,
              width: 48.0,
            ),
            applicationName: 'YogaNath',
            applicationVersion: '1.0.0',
            applicationLegalese: '(c) 2020 AppLab',
            aboutBoxChildren: aboutBoxChildren,
          ),
          ReusableRaisedButton(
              buttonText: 'ENCERRAR SESSÃO',
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

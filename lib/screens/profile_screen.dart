import 'package:flutter/material.dart';
import 'package:yoganath/screens/achievements_screen.dart';
import 'package:yoganath/screens/calendar_screen.dart';
import 'package:yoganath/screens/ranking_screen.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: ReusableTitle(text: 'Meu Perfil', isPremium: false),
        bottom: TabBar(controller: _tabController, tabs: <Widget>[
          width > 360 ? Text('Conquistas') : Icon(Icons.flare),
          width > 360 ? Text('Ranking') : Icon(Icons.filter_1),
          width > 360 ? Text('Calendário') : Icon(Icons.event),
        ]),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      endDrawer: MyDrawer(),
      body: TabBarView(controller: _tabController, children: <Widget>[
        Achievements(),
        Ranking(),
        Calendar(),
      ]),
    );
  }
}

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

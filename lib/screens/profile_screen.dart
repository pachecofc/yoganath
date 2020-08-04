import 'package:flutter/material.dart';
import 'package:yoganath/screens/achievements_screen.dart';
import 'package:yoganath/screens/calendar_screen.dart';
import 'package:yoganath/screens/ranking_screen.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/setOrientation.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTitle.dart';
import 'package:yoganath/widgets/reusableYogaPoints.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: Drawer(
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
            buildListTile(
                context, 'Sobre o YogaNath', RouteGenerator.kABOUT_ROUTE),
            buildListTile(
                context, 'Administração do app', RouteGenerator.kADMIN_ROUTE),
            ReusableRaisedButton(
                buttonText: 'ENCERRAR SESSÃO',
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => scaffoldKey.currentState.openEndDrawer(),
            ),
          ),
          PageContent(),
        ],
      ),
    );
  }

  ListTile buildListTile(BuildContext context, String title, String routeName) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}

class PageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          ReusableTitle(text: 'Meu Perfil', isPremium: false),
          ProfileHeader(),
          TabBar(
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            unselectedLabelColor: Colors.black45,
            tabs: [
              Tab(text: 'Conquistas'),
              Tab(text: 'Ranking'),
              Tab(text: 'Calendário'),
            ],
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                Achievements(),
                Ranking(),
                Calendar(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Avatar
          Column(
            children: <Widget>[
              Image.asset(
                'assets/images/meditation.png',
                width: 60.0,
                height: 68.09,
              ),
              ReusableFlatButton(buttonText: 'INSERIR FOTO', onPressed: () {}),
            ],
          ),
          // User name and level
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('João Silva'),
              ),
              Text('Iniciante'),
            ],
          ),
          // User score
          ReusableYogaPoints(score: 512),
        ],
      ),
    );
  }
}

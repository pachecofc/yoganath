import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/screens/achievements_screen.dart';
import 'package:yoganath/screens/calendar_screen.dart';
import 'package:yoganath/screens/ranking_screen.dart';
import 'package:yoganath/widgets/navigationTabs.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

import 'settings_screen.dart';

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
    final ReusableTitle _title =
        ReusableTitle(text: 'Meu Perfil', isPremium: false);

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableTitle(text: 'Meu Perfil', isPremium: false),
                    GestureDetector(
                      child: Icon(CupertinoIcons.settings),
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => IosProfileOptions(),
                        );
                      },
                    ),
                  ],
                ),
                NavigationTabs()
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: _title,
              bottom: TabBar(controller: _tabController, tabs: <Widget>[
                width > 375 ? Text('Conquistas') : Icon(Icons.flare),
                width > 375 ? Text('Ranking') : Icon(Icons.filter_1),
                width > 375 ? Text('Calendário') : Icon(Icons.event),
              ]),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
            ),
            endDrawer: AndroidProfileOptions(),
            body: TabBarView(controller: _tabController, children: <Widget>[
              Achievements(),
              Ranking(),
              Calendar(),
            ]),
          );
  }
}

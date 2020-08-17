import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yoganath/screens/learn_screen.dart';
import 'package:yoganath/screens/practice_screen.dart';
import 'package:yoganath/screens/profile_screen.dart';
import 'package:yoganath/screens/sadhana_screen.dart';
import 'package:yoganath/screens/schedule_screen.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/constants.dart';

class Base extends StatefulWidget {
  Base({this.fromFeedback = false});
  final bool fromFeedback;

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Sadhana(),
    Practice(),
    Schedule(),
    Learn(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // If a student arrived here after giving feedback
    // for a yoga class, redirect him/her to profile tab.
    if (widget.fromFeedback) {
      setState(() {
        _selectedIndex = 4;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Padding pageBody = Padding(
      padding: const EdgeInsets.all(16.0),
      // Must not be wrapped in a SingleChildScrollView
      child: _widgetOptions.elementAt(_selectedIndex),
    );

    const List<BottomNavigationBarItem> _bottomBarItems =
        <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.spa),
        title: Text('Jornada'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.accessibility_new),
        title: Text('Práticas'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        title: Text('Agenda'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        title: Text('Estudos'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text('Perfil'),
      ),
    ];
    return SafeArea(
      child: Platform.isIOS
          ? CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                activeColor: ColorConstants.kTabBarActiveColor,
                inactiveColor: ColorConstants.kTabBarInactiveColor,
                items: _bottomBarItems,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
              tabBuilder: (BuildContext context, int index) {
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return Scaffold(
                      body: pageBody,
                    );
                  },
                  onGenerateRoute: RouteGenerator.generateRoute,
                );
              })
          : Scaffold(
              body: pageBody,
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Theme.of(context).bottomAppBarColor,
                items: _bottomBarItems,
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                fixedColor: Colors.black87,
                onTap: _onItemTapped,
              ),
            ),
    );
  }
}

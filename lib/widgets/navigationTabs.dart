import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/screens/achievements_screen.dart';
import 'package:yoganath/screens/calendar_screen.dart';
import 'package:yoganath/screens/ranking_screen.dart';

class NavigationTabs extends StatefulWidget {
  @override
  _NavigationTabsState createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  // Creates the Tab titles with icons
  Map<int, Widget> iconMap = {
    0: Icon(Icons.flare),
    1: Icon(Icons.filter_1),
    2: Icon(Icons.event),
  };
  // Shows the respective widget associated with the Tab
  List<Widget> childWidgets = [
    Material(child: Achievements()),
    Material(child: Ranking()),
    Material(child: Calendar()),
  ];
  // By default, the first tab is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSlidingSegmentedControl(
          children: iconMap, // The tabs which are assigned in the form of map
          onValueChanged: (value) {
            // Callback function executed when user changes the Tabs
            setState(() {
              selectedIndex = value;
            });
          },
          groupValue: selectedIndex,
          thumbColor: Theme.of(context)
              .primaryColor, // The current selected Index or key
        ),
        Container(
          child: childWidgets[selectedIndex],
          height: MediaQuery.of(context).size.height * 0.7,
        )
      ],
    );
  }
}

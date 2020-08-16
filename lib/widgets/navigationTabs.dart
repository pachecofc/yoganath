import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  // Creates the Tab titles with icons
  Map<int, Widget> textMap = {
    0: Text('Conquistas'),
    1: Text('Ranking'),
    2: Text('Calendário'),
  };
  // Shows the respective widget associated with the Tab
  List<Widget> childWidgets = [
    // Achievements(),
    Text('Conquistas'),
    Text('Ranking'),
    Text('Calendário'),
  ];
  // By default, the first tab is selected
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CupertinoSlidingSegmentedControl(
          children: width > 375
              ? textMap
              : iconMap, // The tabs which are assigned in the form of map
          onValueChanged: (value) {
            // Callback function executed when user changes the Tabs
            setState(() {
              selectedIndex = value;
            });
          },
          groupValue: selectedIndex, // The current selected Index or key
        ),
        childWidgets[selectedIndex],
      ],
    );
  }
}

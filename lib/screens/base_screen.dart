import 'package:flutter/material.dart';
import 'package:yoganath/screens/practice_screen.dart';
import 'package:yoganath/screens/sadhana_screen.dart';
import 'package:yoganath/screens/schedule_screen.dart';

class Base extends StatefulWidget {
  // Base({Key key}) : super(key: key);

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Sadhana(),
    Practice(),
    Schedule(),
    Text(
      'Index 2: Estudos',
    ),
    Text(
      'Index 2: Perfil',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        // body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
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
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          fixedColor: Colors.black87,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Text('1o'),
            title: Text(
              'Bruce Lee',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('2000 YP'),
            trailing: Image.asset(
              'assets/images/first.png',
              height: 24,
              width: 24,
            ),
          ),
          ListTile(
            leading: Text('2o'),
            title: Text(
              'Chuck Norris',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('1900 YP'),
            trailing: Image.asset(
              'assets/images/second.png',
              height: 24,
              width: 24,
            ),
          ),
          ListTile(
            leading: Text('3o'),
            title: Text(
              'Van Damme',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('1800 YP'),
            trailing: Image.asset(
              'assets/images/third.png',
              height: 24,
              width: 24,
            ),
          ),
          ListTile(
            title: Text(
              'João Silva',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('512 YP'),
            leading: Text('15o'),
          ),
        ],
      ),
    );
  }
}

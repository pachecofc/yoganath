import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Bruce Lee',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('2000 YP'),
            leading: Image.asset('assets/images/first.png'),
          ),
          ListTile(
            title: Text(
              'Chuck Norris',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('1900 YP'),
            leading: Image.asset('assets/images/second.png'),
          ),
          ListTile(
            title: Text(
              'Van Damme',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('1800 YP'),
            leading: Image.asset('assets/images/third.png'),
          ),
          ListTile(
            title: Text(
              'João Silva',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('512 YP'),
            leading: Text(
              '15o',
              style: TextStyle(fontSize: 26.0),
            ),
          ),
        ],
      ),
    );
  }
}

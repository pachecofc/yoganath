import 'package:flutter/material.dart';

class Asanas extends StatefulWidget {
  @override
  _AsanasState createState() => _AsanasState();
}

class _AsanasState extends State<Asanas> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Ásanas'),
        ),
      ),
    );
  }
}

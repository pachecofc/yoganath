import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/screens/class_screen.dart';
import 'package:yoganath/utilities/setOrientation.dart';
import 'package:yoganath/widgets/reusableSubtitle.dart';

class AsanaInfo extends StatefulWidget {
  @override
  _AsanaInfoState createState() => _AsanaInfoState();
}

class _AsanaInfoState extends State<AsanaInfo> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    setOrientation(Orientation.landscape);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _visible ? Container() : Class(),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: AsanaBenefits(),
            ),
            Positioned(
              right: 8.0,
              child: IconButton(
                icon: Platform.isIOS
                    ? Icon(
                        CupertinoIcons.info,
                        color: Theme.of(context).accentColor,
                        size: 40.0,
                      )
                    : Icon(
                        Icons.info_outline,
                        color: Theme.of(context).accentColor,
                        size: 40.0,
                      ),
                onPressed: () {
                  setState(() {
                    _visible = !_visible;
                  });
                },
                tooltip: 'Mais info',
              ),
            ),
            //PageContent(),
          ],
        ),
      ),
    );
  }
}

class AsanaBenefits extends StatelessWidget {
  final List<String> _benefits = [
    'Dor nas costas',
    'Melhora digestão',
    'Fortalece as pernas'
  ];

  final List<String> _muscles = ['Pernas', 'Costas', 'Tornozelos'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        Container(
          color: Colors.white,
          width: size.width * 0.92,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/trikonasana.jpg'),
                  maxRadius: size.height * 0.1,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                        title: ReusableSubtitle(text: 'Benefícios da Postura')),
                  ),
                  Expanded(
                    child: ListTile(
                        title: ReusableSubtitle(text: 'Músculos Trabalhados')),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: buildBenefits(context, _benefits),
                    ),
                    Expanded(
                      child: buildBenefits(context, _muscles),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).bottomAppBarColor,
          ),
        ),
      ],
    );
  }

  ListView buildBenefits(BuildContext context, List<String> listName) {
    return ListView(
      children: listName
          .map(
            (listItem) => ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Theme.of(context).accentColor,
              ),
              title: Text(listItem),
            ),
          )
          .toList(),
    );
  }
}

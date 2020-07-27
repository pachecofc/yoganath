import 'package:flutter/material.dart';
import 'package:yoganath/widgets/reusableFlatButton.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          ReusableTitle(text: 'Meu Perfil', isPremium: false),
          ProfileHeader(),
          ProfileTabs(),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
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
      padding: const EdgeInsets.symmetric(vertical: 21.0),
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
          Column(
            children: <Widget>[
              Image.asset(
                'assets/images/lotus.png',
                width: 24.0,
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('512'),
              ),
              Text('YogaPoints'),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileTabs extends StatelessWidget {
  const ProfileTabs();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      tabs: [
        Tab(icon: Icon(Icons.directions_car)),
        Tab(icon: Icon(Icons.directions_transit)),
        Tab(icon: Icon(Icons.directions_bike)),
      ],
    );
  }
}

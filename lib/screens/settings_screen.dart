import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/utilities/constants.dart';
import 'package:yoganath/widgets/reusableDangerButton.dart';

class AboutYogaNath extends StatelessWidget {
  final List<Widget> aboutBoxChildren = <Widget>[
    SizedBox(height: 24),
    Text('YogaNath é um aplicativo para práticas de yoga.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActionSheetAction(
            onPressed: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Sobre o YogaNath'),
                  content: Column(
                    children: [
                      AppInfo.appIcon,
                      Text(AppInfo.kAppName),
                      Text(AppInfo.kAppVersion),
                      Text(AppInfo.kAppLegalese),
                      aboutBoxChildren[0],
                      Text('Licenças disponíveis em Settings '
                          '-> YogaNath -> Acknowledgements.'),
                    ],
                  ),
                  actions: [
                    CupertinoButton(
                      child: Text('Fechar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
            child: Text('Sobre o YogaNath'),
          )
        : AboutListTile(
            icon: Icon(Icons.info),
            applicationIcon: AppInfo.appIcon,
            applicationName: AppInfo.kAppName,
            applicationVersion: AppInfo.kAppVersion,
            applicationLegalese: AppInfo.kAppLegalese,
            aboutBoxChildren: aboutBoxChildren,
          );
  }
}

class AndroidProfileOptions extends StatelessWidget {
  ListTile buildListTile(BuildContext context, String title, String routeName) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        primary: false,
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              AuxProfileOptions.kDrawerTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildListTile(context, AuxProfileOptions.kDrawerAccount,
              RouteGenerator.kACCOUNT_ROUTE),
          buildListTile(context, AuxProfileOptions.kDrawerSubscription,
              RouteGenerator.kSUBSCRIPTION_ROUTE),
          buildListTile(context, AuxProfileOptions.kDrawerSupport,
              RouteGenerator.kSUPPORT_ROUTE),
          buildListTile(context, AuxProfileOptions.kDrawerAbout,
              RouteGenerator.kABOUT_ROUTE),
          buildListTile(context, AuxProfileOptions.kDrawerAdmin,
              RouteGenerator.kADMIN_ROUTE),
          AboutYogaNath(),
          ReusableDangerButton(
              buttonText: 'ENCERRAR SESSÃO',
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, RouteGenerator.kLOGIN_ROUTE);
              })
        ],
      ),
    );
  }
}

class IosProfileOptions extends StatelessWidget {
  const IosProfileOptions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        AuxProfileOptions.kDrawerTitle,
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pushNamed(context, RouteGenerator.kACCOUNT_ROUTE);
          },
          child: Text(AuxProfileOptions.kDrawerAccount),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pushNamed(context, RouteGenerator.kSUBSCRIPTION_ROUTE);
          },
          child: Text(AuxProfileOptions.kDrawerSubscription),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pushNamed(context, RouteGenerator.kSUPPORT_ROUTE);
          },
          child: Text(AuxProfileOptions.kDrawerSupport),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pushNamed(context, RouteGenerator.kABOUT_ROUTE);
          },
          child: Text(AuxProfileOptions.kDrawerAbout),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pushNamed(context, RouteGenerator.kADMIN_ROUTE);
          },
          child: Text(AuxProfileOptions.kDrawerAdmin),
        ),
        AboutYogaNath(),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pushReplacementNamed(context, RouteGenerator.kLOGIN_ROUTE);
        },
        child: Text(
          'Encerrar Sessão',
          style: TextStyle(color: Theme.of(context).errorColor),
        ),
      ),
    );
  }
}

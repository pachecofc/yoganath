import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/screens/asanaInfo_screen.dart';
import 'package:yoganath/utilities/buildNavigationBar.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Asanas extends StatefulWidget {
  @override
  _AsanasState createState() => _AsanasState();
}

class _AsanasState extends State<Asanas> {
  @override
  Widget build(BuildContext context) {
    var pageBody = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ReusableTextFormField(
                textEditingController: null,
                isObscure: false,
                suffixIcon: Platform.isIOS
                    ? Icon(
                        CupertinoIcons.search,
                        color: Theme.of(context).primaryColor,
                      )
                    : Icon(Icons.search),
                label: 'Termo de busca',
                hint: 'Digite o termo de busca',
                errorMessage: null,
                keyboardType: TextInputType.text),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              children: <Widget>[
                ReusableMidiaCard(
                  imageName: 'padmasana.png',
                  isChecked: false,
                  firstTextLine: 'Padmasana',
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) {
                        return CupertinoPopupSurface(
                          child: AsanaInfo(),
                        );
                      },
                    );
                  },
                ),
                ReusableMidiaCard(
                  imageName: 'adho-mukha.png',
                  isChecked: false,
                  firstTextLine: 'Adho mukha svanasana',
                ),
                ReusableMidiaCard(
                  imageName: 'padmasana.png',
                  isChecked: false,
                  firstTextLine: 'Padmasana',
                ),
                ReusableMidiaCard(
                  imageName: 'adho-mukha.png',
                  isChecked: false,
                  firstTextLine: 'Adho mukha svanasana',
                ),
                ReusableMidiaCard(
                  imageName: 'padmasana.png',
                  isChecked: false,
                  firstTextLine: 'Padmasana',
                ),
                ReusableMidiaCard(
                  imageName: 'adho-mukha.png',
                  isChecked: false,
                  firstTextLine: 'Adho mukha svanasana',
                ),
                ReusableMidiaCard(
                  imageName: 'padmasana.png',
                  isChecked: false,
                  firstTextLine: 'Padmasana',
                ),
                ReusableMidiaCard(
                  imageName: 'adho-mukha.png',
                  isChecked: false,
                  firstTextLine: 'Adho mukha svanasana',
                ),
                ReusableMidiaCard(
                  imageName: 'padmasana.png',
                  isChecked: false,
                  firstTextLine: 'Padmasana',
                ),
                ReusableMidiaCard(
                  imageName: 'adho-mukha.png',
                  isChecked: false,
                  firstTextLine: 'Adho mukha svanasana',
                ),
                ReusableMidiaCard(
                  imageName: 'padmasana.png',
                  isChecked: false,
                  firstTextLine: 'Padmasana',
                ),
                ReusableMidiaCard(
                  imageName: 'adho-mukha.png',
                  isChecked: false,
                  firstTextLine: 'Adho mukha svanasana',
                ),
              ],
            ),
          ),
        ],
      ),
    );
    var appBarTitle = Text('Ásanas');

    return SafeArea(
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: buildCupertinoNavigationBar(context, appBarTitle),
              child: pageBody,
            )
          : Scaffold(
              appBar: AppBar(title: appBarTitle),
              body: pageBody,
            ),
    );
  }
}

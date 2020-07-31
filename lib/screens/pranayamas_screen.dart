import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Pranayamas extends StatefulWidget {
  @override
  _PranayamasState createState() => _PranayamasState();
}

class _PranayamasState extends State<Pranayamas> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Práticas Avulsas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              ReusableTitle(text: 'Pranayamas', isPremium: false),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ReusableTextFormField(
                    textEditingController: null,
                    isObscure: false,
                    suffixIcon: Icon(Icons.search),
                    label: 'Termo de busca',
                    hint: 'Digite o termo de busca',
                    errorMessage: null,
                    keyboardType: TextInputType.text),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 16.0,
                  children: <Widget>[
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                    ReusableMidiaCard(
                      imageName: 'pranayama.png',
                      isChecked: false,
                      firstTextLine: 'Bhramari Pranayama',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

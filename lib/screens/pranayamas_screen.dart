import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

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
          title: Text('Pranayamas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
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
                  crossAxisSpacing: 8.0,
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

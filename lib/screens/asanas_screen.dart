import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Asanas extends StatefulWidget {
  @override
  _AsanasState createState() => _AsanasState();
}

class _AsanasState extends State<Asanas> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ásanas'),
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
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 16.0,
                  children: <Widget>[
                    ReusableMidiaCard(
                      imageName: 'padmasana.png',
                      isChecked: false,
                      firstTextLine: 'Padmasana',
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.kADHOC_ROUTE);
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
        ),
      ),
    );
  }
}

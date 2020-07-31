import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Meditation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Práticas Avulsas'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ReusableTitle(text: 'Timer para Meditação', isPremium: false),
                SizedBox(height: 31.0),
                SizedBox(
                  height: 183,
                  width: 301,
                  child: ReusableMidiaCard(
                      imageName: 'meditating.jpg', isChecked: false),
                ),
                SizedBox(height: 54.0),
                AdjustTimer(),
                SizedBox(height: 25.5),
                Sound(),
                SizedBox(height: 46.5),
                ReusableRaisedButton(
                    buttonText: 'INICIAR',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteGenerator.kFEEDBACK_ROUTE);
                    }),
                ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Icons.check_box,
                      color: Theme.of(context).accentColor,
                    ),
                    onPressed: () {},
                  ),
                  title: Text('Escutar instrução introdutória'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Sound extends StatefulWidget {
  @override
  _SoundState createState() => _SoundState();
}

class _SoundState extends State<Sound> {
  String _selectedSound = 'Escolha um som';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedSound,
      items: [
        DropdownMenuItem(
          child: Text('Escolha um som'),
          value: 'Escolha um som',
        ),
        DropdownMenuItem(
          child: Text('Cachoeira'),
          value: 'Cachoeira',
        ),
        DropdownMenuItem(
          child: Text('Pássaros'),
          value: 'Pássaros',
        ),
        DropdownMenuItem(
          child: Text('Sino Tibetano'),
          value: 'Sino Tibetano',
        ),
        DropdownMenuItem(
          child: Text('Rio'),
          value: 'Rio',
        ),
      ],
      onChanged: (value) {
        setState(() {
          _selectedSound = value;
        });
      },
    );
  }
}

class AdjustTimer extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _hourController = TextEditingController();
  final _minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 70.0,
              child: ReusableTextFormField(
                textEditingController: _hourController,
                isObscure: false,
                label: 'Hora',
                hint: '0',
                errorMessage: null,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: 70.0,
              child: ReusableTextFormField(
                textEditingController: _minuteController,
                isObscure: false,
                label: 'Minutos',
                hint: '0',
                errorMessage: 'Digite um valor entre zero e 59.',
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

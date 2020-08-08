import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Meditation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Timer para Meditação'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: _screenSize.height * 0.27,
                  width: _screenSize.width * 0.54,
                  child: ReusableMidiaCard(
                      imageName: 'meditating.jpg', isChecked: false),
                ),
                SizedBox(height: _screenSize.height * 0.07),
                AdjustTimer(),
                SizedBox(height: _screenSize.height * 0.07),
                Sound(),
                SizedBox(height: _screenSize.height * 0.07),
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

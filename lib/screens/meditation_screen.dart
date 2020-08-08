import 'package:flutter/material.dart';
import 'package:yoganath/services/routeGenerator.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';

class Meditation extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();

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
              children: [
                SizedBox(
                  height: _screenSize.height * 0.27,
                  width: _screenSize.width * 0.54,
                  child: ReusableMidiaCard(
                      imageName: 'meditating.jpg', isChecked: false),
                ),
                SizedBox(height: _screenSize.height * 0.07),
                ChooseTime(
                    formKey: _formKey,
                    screenSize: _screenSize,
                    hourController: _hourController,
                    minuteController: _minuteController),
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

class ChooseTime extends StatelessWidget {
  const ChooseTime({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required Size screenSize,
    @required TextEditingController hourController,
    @required TextEditingController minuteController,
  })  : _formKey = formKey,
        _screenSize = screenSize,
        _hourController = hourController,
        _minuteController = minuteController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final Size _screenSize;
  final TextEditingController _hourController;
  final TextEditingController _minuteController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: _screenSize.width * 0.34,
                child: ReusableTextFormField(
                  textEditingController: _hourController,
                  isObscure: false,
                  label: 'Hora',
                  hint: '0',
                  errorMessage:
                      'Por favor, digite um número maior ou igual a zero',
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                width: _screenSize.width * 0.34,
                child: ReusableTextFormField(
                    textEditingController: _minuteController,
                    isObscure: false,
                    label: 'Minutos',
                    hint: null,
                    errorMessage:
                        'Por favor, digite um número maior ou igual a zero',
                    keyboardType: TextInputType.number),
              ),
            ],
          ),
          SizedBox(height: _screenSize.height * 0.07),
          ChooseSound(),
          SizedBox(height: _screenSize.height * 0.07),
          ReusableRaisedButton(
            buttonText: 'INICIAR',
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, RouteGenerator.kFEEDBACK_ROUTE);
            },
          ),
        ],
      ),
    );
  }
}

class ChooseSound extends StatefulWidget {
  @override
  _ChooseSoundState createState() => _ChooseSoundState();
}

class _ChooseSoundState extends State<ChooseSound> {
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

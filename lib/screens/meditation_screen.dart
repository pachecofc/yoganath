import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoganath/screens/feedback_screen.dart';
import 'package:yoganath/utilities/buildDropdown.dart';
import 'package:yoganath/utilities/buildNavigationBar.dart';
import 'package:yoganath/utilities/dropdownLists.dart';
import 'package:yoganath/widgets/reusableDropdown.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:yoganath/widgets/reusableRaisedButton.dart';

class Meditation extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    var pageBody = Padding(
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
            ChooseTime(
              formKey: _formKey,
              screenSize: _screenSize,
            ),
            Material(
              child: ListTile(
                leading: Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                title: Text('Escutar instrução introdutória'),
              ),
            ),
          ],
        ),
      ),
    );
    var appBarTitle = Text('Timer para Meditação');

    return SafeArea(
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              child: pageBody,
              navigationBar: buildCupertinoNavigationBar(context, appBarTitle),
            )
          : Scaffold(
              appBar: AppBar(
                title: appBarTitle,
              ),
              body: pageBody,
            ),
    );
  }
}

class ChooseTime extends StatelessWidget {
  const ChooseTime({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required Size screenSize,
  })  : _formKey = formKey,
        _screenSize = screenSize,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final Size _screenSize;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CupertinoTimerPicker(onTimerDurationChanged: (value) {
            print(value);
          }),
          ChooseSound(),
          SizedBox(height: _screenSize.height * 0.07),
          ReusableRaisedButton(
            buttonText: 'INICIAR',
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (_) {
                    return CupertinoPopupSurface(
                      child: ClassFeedback(),
                    );
                  });
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
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GestureDetector(
            child: Material(
              child: Text('Escolha um som'),
            ),
            onTap: () async {
              await buildDropdownPopup(context, sounds);
            },
          )
        : AndroidDropdown(sourceList: sounds);
  }
}

import 'package:flutter/material.dart';
import 'package:yoganath/utilities/setOrientation.dart';
import 'package:yoganath/widgets/reusableTextFormField.dart';
import 'package:yoganath/widgets/reusableTitle.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  void deactivate() {
    super.deactivate();
    setOrientation(Orientation.portrait);
  }

  @override
  Widget build(BuildContext context) {
    setOrientation(Orientation.landscape);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Área de Administração'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              MediaQuery.of(context).size.height > 410
                  ? AdminHeader()
                  : Container(),
              Expanded(
                child: Text('Lista vai aqui...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminHeader extends StatelessWidget {
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.21,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableTitle(
                    text: 'Usuários Cadastrados', isPremium: false),
              ),
              Expanded(
                child: ReusableTextFormField(
                    textEditingController: _search,
                    isObscure: false,
                    label: 'Termo de busca',
                    hint: 'Digite o termo de busca',
                    errorMessage: null,
                    keyboardType: TextInputType.text),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text('Nome'),
              ),
              Expanded(
                child: Text('E-mail'),
              ),
              Expanded(
                child: Text('Telefone'),
              ),
              Expanded(
                child: Text('Data nascimento'),
              ),
              Expanded(
                child: Text('Plano Premium?'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

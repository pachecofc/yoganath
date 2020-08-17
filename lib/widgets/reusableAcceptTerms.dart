import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReusableAcceptTerms extends StatefulWidget {
  @override
  _ReusableAcceptTermsState createState() => _ReusableAcceptTermsState();
}

class _ReusableAcceptTermsState extends State<ReusableAcceptTerms> {
  TapGestureRecognizer _termsRecognizer;
  TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()..onTap = _openTerms;
    _privacyRecognizer = TapGestureRecognizer()..onTap = _openPrivacy;
  }

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  void _openTerms() {
    print('Abrir termos de uso');
  }

  void _openPrivacy() {
    print('Abrir política de privacidade');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (newValue) {}),
        Container(
          width: MediaQuery.of(context).size.width * 0.77,
          child: RichText(
            text: TextSpan(
              text: 'Ao continuar, você concorda com os ',
              style: Theme.of(context).textTheme.caption,
              children: <TextSpan>[
                TextSpan(
                  text: 'Termos de Uso',
                  style: TextStyle(decoration: TextDecoration.underline),
                  recognizer: _termsRecognizer,
                ),
                TextSpan(
                  text: ' e ',
                ),
                TextSpan(
                  text: 'Política de Privacidade',
                  style: TextStyle(decoration: TextDecoration.underline),
                  recognizer: _privacyRecognizer,
                ),
                TextSpan(
                  text: ' do YogaNath.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

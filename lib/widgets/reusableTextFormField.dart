import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReusableTextFormField extends StatelessWidget {
  ReusableTextFormField({
    @required this.textEditingController,
    @required this.isObscure,
    this.suffixIcon,
    @required this.label,
    @required this.hint,
    @required this.errorMessage,
    @required this.keyboardType,
    this.readOnly = false,
  });

  final TextEditingController textEditingController;
  final bool isObscure;
  final Widget suffixIcon;
  final String label;
  final String hint;
  final String errorMessage;
  final TextInputType keyboardType;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IosTextField(
            keyboardType: keyboardType,
            textEditingController: textEditingController,
            readOnly: readOnly,
            hint: hint,
            suffixIcon: suffixIcon,
            isObscure: isObscure,
            errorMessage: errorMessage)
        : AndroidTextField(
            keyboardType: keyboardType,
            textEditingController: textEditingController,
            readOnly: readOnly,
            label: label,
            hint: hint,
            suffixIcon: suffixIcon,
            isObscure: isObscure,
            errorMessage: errorMessage);
  }
}

class AndroidTextField extends StatelessWidget {
  const AndroidTextField({
    Key key,
    @required this.keyboardType,
    @required this.textEditingController,
    @required this.readOnly,
    @required this.label,
    @required this.hint,
    @required this.suffixIcon,
    @required this.isObscure,
    @required this.errorMessage,
  }) : super(key: key);

  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final bool readOnly;
  final String label;
  final String hint;
  final Widget suffixIcon;
  final bool isObscure;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: textEditingController,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        suffixIcon: suffixIcon,
      ),
      cursorColor: Theme.of(context).primaryColor,
      obscureText: isObscure,
    );
  }
}

class IosTextField extends StatelessWidget {
  const IosTextField({
    Key key,
    @required this.keyboardType,
    @required this.textEditingController,
    @required this.readOnly,
    @required this.hint,
    @required this.suffixIcon,
    @required this.isObscure,
    @required this.errorMessage,
  }) : super(key: key);

  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final bool readOnly;
  final String hint;
  final Widget suffixIcon;
  final bool isObscure;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      clearButtonMode: OverlayVisibilityMode.editing,
      keyboardType: keyboardType,
      controller: textEditingController,
      readOnly: readOnly,
      placeholder: hint,
      suffix: suffixIcon,
      obscureText: isObscure,
      cursorColor: Theme.of(context).primaryColor,
    );
  }
}

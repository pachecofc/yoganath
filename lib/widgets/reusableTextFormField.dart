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

class AndroidTextField extends StatefulWidget {
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
  _AndroidTextFieldState createState() => _AndroidTextFieldState();
}

class _AndroidTextFieldState extends State<AndroidTextField> {
  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.textEditingController,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        filled: true,
        suffixIcon: widget.suffixIcon,
      ),
      cursorColor: Theme.of(context).primaryColor,
      obscureText: widget.isObscure,
      validator: (value) {
        if (value.isEmpty) {
          return widget.errorMessage;
        }
        return null;
      },
    );
  }
}

class IosTextField extends StatefulWidget {
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
  _IosTextFieldState createState() => _IosTextFieldState();
}

class _IosTextFieldState extends State<IosTextField> {
  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      keyboardType: widget.keyboardType,
      controller: widget.textEditingController,
      readOnly: widget.readOnly,
      placeholder: widget.hint,
      suffix: widget.suffixIcon,
      obscureText: widget.isObscure,
      cursorColor: Theme.of(context).primaryColor,
      onSubmitted: (value) {
        if (value.isEmpty) {
          return widget.errorMessage;
        }
        return null;
      },
    );
  }
}

import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  ReusableTextFormField(
      {@required this.textEditingController,
      @required this.isObscure,
      this.suffixIcon,
      @required this.label,
      @required this.hint,
      @required this.errorMessage,
      @required this.keyboardType});

  final TextEditingController textEditingController;
  final bool isObscure;
  final Widget suffixIcon;
  final String label;
  final String hint;
  final String errorMessage;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        suffixIcon: suffixIcon,
      ),
      cursorColor: Theme.of(context).colorScheme.primary,
      obscureText: isObscure,
      validator: (typedEmail) {
        if (typedEmail.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}

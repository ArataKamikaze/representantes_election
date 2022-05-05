import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  TextEditingController controller;
  Function(String?)? onSaved;
  String? Function(String?)? validator;

  InputField({
    Key? key,
    required  this.controller,
    required  this.onSaved,
    required  this.validator,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Senha'),
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      controller: this.controller,
      onSaved: onSaved,
      validator:validator,
    );
  }
}

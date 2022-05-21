import 'package:flutter/material.dart';

class InputField extends TextFormField {
  TextEditingController controller;
  Function(String?)? onSaved;
  String? Function(String?)? validator;
  bool obscureText = false;
  final String label;
  final Widget? prefix;
  final Widget? sufix;

  static BuildContext? context;
  
  InputField({
    Key? key,
    required BuildContext context,
    required  this.controller,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.label = "",
    this.prefix,
    this.sufix
    }) : super(
      key: key,
      textAlignVertical: TextAlignVertical.bottom,
      style: TextStyle(color: Color(0xFF6C757D),),
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          prefixIcon: prefix,
          suffixIcon: sufix,
          hintText: label,
          contentPadding: EdgeInsets.only(bottom: 16),
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.zero
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.zero
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        controller: controller,
        onSaved: onSaved,
        validator:validator,
      );

}
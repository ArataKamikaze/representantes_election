// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends TextFormField {
  
  @override
  TextEditingController controller;
  
  @override
  Function(String?)? onSaved;
  
  @override
  String? Function(String?)? validator;
  bool obscureText = false;
  bool isTextArea = false;
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
    this.sufix,
    this.isTextArea = false
    }) : super(
      key: key,
      
      textAlignVertical: TextAlignVertical.bottom,
      style: const TextStyle(color: Color(0xFF6C757D),),
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          prefixIcon: prefix,
          suffixIcon: sufix,
          hintText: label,
          contentPadding: const EdgeInsets.only(bottom: 16),
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
        keyboardType: isTextArea? TextInputType.multiline : TextInputType.emailAddress,
        obscureText: obscureText,
        controller: controller,
        onSaved: onSaved,
        validator:validator,
        minLines: isTextArea? 6 : 1,
        maxLines: isTextArea ? null : 1,
      );
}
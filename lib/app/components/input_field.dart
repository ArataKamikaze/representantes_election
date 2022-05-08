import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  TextEditingController controller;
  Function(String?)? onSaved;
  String? Function(String?)? validator;
  bool obscureText = false;
  String label;
  Widget? prefix;
  Widget? sufix;

  InputField({
    Key? key,
    required  this.controller,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.label = "",
    this.prefix,
    this.sufix
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEDEDED),
      height: 45,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
          style: TextStyle(color: Color(0xFF6C757D),),
        decoration: InputDecoration(
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
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText,
        controller: this.controller,
        onSaved: onSaved,
        validator:validator,
        
      ),
    );
  }
}

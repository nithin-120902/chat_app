// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  InputTextField({required this.obscureText,required this.type,required this.onChanged,required this.HintText});

  final void Function(String?) onChanged;
  bool obscureText ;
  TextInputType type;
  String HintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: type,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: HintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}

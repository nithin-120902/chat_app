// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.title, required this.color, required this.onPressed});

  final Color color;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 15.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

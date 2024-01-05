import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String placeHolder;
  final bool obscureText;
  IconButton? suffixIcon;
  final FormFieldValidator? formFieldValidator;

  AppTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.placeHolder,
    this.formFieldValidator,
    this.obscureText = false,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: formFieldValidator,
        decoration: InputDecoration(
            labelText: label,
            hintText: placeHolder,
            suffixIcon: suffixIcon
        ),
      ),
    );
  }
}
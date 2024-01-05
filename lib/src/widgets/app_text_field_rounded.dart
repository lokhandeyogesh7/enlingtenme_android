import 'package:enlightenme/src/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTextFieldRounded extends StatelessWidget {
  const AppTextFieldRounded({
    Key? key,
    required this.controller,
    this.label,
    this.placeHolder,
    this.obscureText = false,
    this.formFieldValidator,
    this.maxLines,
    this.keyboardType,
    this.multiLine = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String? label;
  final String? placeHolder;
  final bool obscureText;
  final FormFieldValidator? formFieldValidator;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool multiLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: formFieldValidator,
      maxLines: maxLines,
      keyboardType:keyboardType,
      expands: multiLine,
      decoration: InputDecoration(
        hintStyle: const TextStyle(fontSize: 17),
        hintText: placeHolder,
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.darkyellow)),
      ),
    );
  }
}
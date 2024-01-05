import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const SubTitleText(
      {Key? key,
        required this.text,
        this.fontSize = 16,
        this.color = Colors.grey,
        this.fontWeight = FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}
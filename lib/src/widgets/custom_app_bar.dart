import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar.screen({
    required String title,
    List<Widget>? actions,
  }) : super(title: Text(title),backgroundColor: Colors.white,elevation: 4);
}
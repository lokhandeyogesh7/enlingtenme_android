import 'package:enlightenme/src/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();

  static ThemeData lightTheme = ThemeData(
      backgroundColor: AppColors.background,
      primaryColor: AppColors.background,
      cardTheme: CardTheme(color: AppColors.background),
      textTheme: TextTheme(bodyText1: TextStyle(color: AppColors.black)),
      iconTheme: IconThemeData(color: AppColors.dodgerblue),
      bottomAppBarColor: AppColors.background,
      dividerColor: AppColors.lightGrey,
      primaryTextTheme:
      TextTheme(bodyText1: TextStyle(color: AppColors.black)));

  static TextStyle titleStyle =
  const TextStyle(color: AppColors.black, fontSize: 16);
  static TextStyle subTitleStyle =
  const TextStyle(color: AppColors.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
  const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
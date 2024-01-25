import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white, appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18));
}

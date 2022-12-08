import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  fontFamily: 'Ubuntu',
  backgroundColor: backgroundColor,
  scaffoldBackgroundColor: backgroundColor,
  primaryColor: primaryColor,
  primaryColorLight: primaryColorLight,
  primaryColorDark: primaryColorDark,
  errorColor: errorColor,
  focusColor: secondaryColor,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(secondaryColor),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: secondaryColor,
        width: 2.0,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColorDark,
  ),
);

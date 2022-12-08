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
  bottomAppBarColor: secondaryColor,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(primaryColor),
      textStyle: MaterialStateProperty.all(text),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: secondaryColor,
        width: 2.0,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0.0,
    titleTextStyle: headline2.bold.copyWith(color: primaryColor),
    iconTheme: const IconThemeData(
      color: secondaryColor,
    ),
    centerTitle: false,
  ),
);

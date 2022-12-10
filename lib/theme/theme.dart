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
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: primaryColor,
      ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(primaryColor),
      textStyle: MaterialStateProperty.all(text),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: backgroundColor,
    titleSpacing: 0.0,
    elevation: 0.0,
    titleTextStyle: headline2.bold.copyWith(color: primaryTextColor),
    iconTheme: const IconThemeData(
      color: primaryTextColor,
    ),
    centerTitle: false,
  ),
);

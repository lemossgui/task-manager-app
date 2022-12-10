import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';

const headline2 = TextStyle(
  fontSize: 28.0,
  color: primaryTextColor,
);

const headline = TextStyle(
  fontSize: 22.0,
  color: primaryTextColor,
);

const title = TextStyle(
  fontSize: 18.0,
  color: primaryTextColor,
);

const subtitle = TextStyle(
  fontSize: 16.0,
  color: primaryTextColor,
);

const text = TextStyle(
  fontSize: 14.0,
  color: primaryTextColor,
);

const smallText = TextStyle(
  fontSize: 12.0,
  color: primaryTextColor,
);

extension FontsFunctions on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
}

import 'package:flutter/material.dart';

const headline2 = TextStyle(
  fontSize: 28.0,
);

const headline = TextStyle(
  fontSize: 22.0,
);

const title = TextStyle(
  fontSize: 18.0,
);

const subtitle = TextStyle(
  fontSize: 16.0,
);

const text = TextStyle(
  fontSize: 14.0,
);

const smallText = TextStyle(
  fontSize: 12.0,
);

extension FontsFunctions on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
}

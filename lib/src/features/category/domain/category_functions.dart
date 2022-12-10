import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

extension CategoryFunctions on CategoryModel {
  Color get color {
    final color =
        categoryColors.firstWhere((item) => item.key == colorKey).value;
    return color ?? Colors.transparent;
  }

  String get colorDescription {
    return categoryColors
        .firstWhere((item) => item.key == colorKey)
        .description;
  }
}

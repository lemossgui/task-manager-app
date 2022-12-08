import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';

class PriorityColorItem {
  final String key;
  final Color? value;

  PriorityColorItem({
    required this.key,
    required this.value,
  });
}

final priorityColors = [
  PriorityColorItem(
    key: 'low',
    value: Colors.green,
  ),
  PriorityColorItem(
    key: 'medium',
    value: Colors.amber,
  ),
  PriorityColorItem(
    key: 'high',
    value: Colors.deepOrange[400],
  ),
  PriorityColorItem(
    key: 'very_high',
    value: Colors.redAccent[700],
  ),
];

Color getPriorityColorValue(String? key) {
  final color = priorityColors.firstWhere((item) => item.key == key).value;
  return color ?? primaryColor;
}

import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

extension PriorityFunctions on PriorityModel {
  Color get color {
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

    final color = priorityColors.firstWhere((item) => item.key == key).value;
    return color ?? Colors.transparent;
  }
}

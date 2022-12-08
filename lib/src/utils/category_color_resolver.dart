import 'package:flutter/material.dart';

class CategoryColorItem {
  final String key;
  final String description;
  final Color? value;

  CategoryColorItem({
    required this.key,
    required this.description,
    required this.value,
  });
}

final categoryColors = [
  CategoryColorItem(
    key: 'red',
    description: 'Vermelho',
    value: Colors.red,
  ),
  CategoryColorItem(
    key: 'pink',
    description: 'Rosa',
    value: Colors.pink[200],
  ),
  CategoryColorItem(
    key: 'lilac',
    description: 'Lilás',
    value: Colors.purple[200],
  ),
  CategoryColorItem(
    key: 'purple',
    description: 'Roxo',
    value: Colors.deepPurple,
  ),
  CategoryColorItem(
    key: 'blue',
    description: 'Azul',
    value: Colors.blue,
  ),
  CategoryColorItem(
    key: 'light_blue',
    description: 'Azul Claro',
    value: Colors.lightBlue[200],
  ),
  CategoryColorItem(
    key: 'cyan',
    description: 'Ciano',
    value: Colors.cyan,
  ),
  CategoryColorItem(
    key: 'green',
    description: 'Verde',
    value: Colors.green,
  ),
  CategoryColorItem(
    key: 'light_green',
    description: 'Verde Claro',
    value: Colors.lightGreen[200],
  ),
  CategoryColorItem(
    key: 'yellow',
    description: 'Amarelo',
    value: Colors.yellow,
  ),
  CategoryColorItem(
    key: 'orange',
    description: 'Laranja',
    value: Colors.orange,
  ),
  CategoryColorItem(
    key: 'brown',
    description: 'Marrom',
    value: Colors.brown,
  ),
];

Color getCategoryColorValue(String? key) {
  final color = categoryColors.firstWhere((item) => item.key == key).value;
  return color ?? Colors.transparent;
}

String getCategoryColorDescription(String? key) {
  return categoryColors.firstWhere((item) => item.key == key).description;
}

import 'package:flutter/material.dart';

class ColorItem {
  final String key;
  final String description;
  final Color? value;

  ColorItem({
    required this.key,
    required this.description,
    required this.value,
  });
}

final colors = [
  ColorItem(
    key: 'red',
    description: 'Vermelho',
    value: Colors.red,
  ),
  ColorItem(
    key: 'pink',
    description: 'Rosa',
    value: Colors.pink[200],
  ),
  ColorItem(
    key: 'lilac',
    description: 'Lilás',
    value: Colors.purple[200],
  ),
  ColorItem(
    key: 'purple',
    description: 'Roxo',
    value: Colors.deepPurple,
  ),
  ColorItem(
    key: 'blue',
    description: 'Azul',
    value: Colors.blue,
  ),
  ColorItem(
    key: 'light_blue',
    description: 'Azul Claro',
    value: Colors.lightBlue[200],
  ),
  ColorItem(
    key: 'cyan',
    description: 'Ciano',
    value: Colors.cyan,
  ),
  ColorItem(
    key: 'green',
    description: 'Verde',
    value: Colors.green,
  ),
  ColorItem(
    key: 'light_green',
    description: 'Verde Claro',
    value: Colors.lightGreen[200],
  ),
  ColorItem(
    key: 'yellow',
    description: 'Amarelo',
    value: Colors.yellow,
  ),
  ColorItem(
    key: 'orange',
    description: 'Laranja',
    value: Colors.orange,
  ),
  ColorItem(
    key: 'brown',
    description: 'Marrom',
    value: Colors.brown,
  ),
];

Color getColorValueByKey(String? key) {
  return colors.firstWhere((item) => item.key == key).value ??
      Colors.transparent;
}

String getColorDescriptionByKey(String? key) {
  return colors.firstWhere((item) => item.key == key).description;
}

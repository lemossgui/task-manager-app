import 'dart:convert';

class CategoryModel {
  final int id;
  final String description;
  final String color;

  CategoryModel({
    required this.id,
    required this.description,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'description': description});
    result.addAll({'color': color});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      color: map['color'] ?? '',
    );
  }

  static List<CategoryModel> listFromMap(List<dynamic> list) {
    return list.map((map) => CategoryModel.fromMap(map)).toList();
  }
}

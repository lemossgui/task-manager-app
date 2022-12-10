import 'package:task_manager/task_manager.dart';

class CategoryModel extends Searchable {
  final int id;
  final String description;
  final String colorKey;

  CategoryModel({
    required this.id,
    required this.description,
    required this.colorKey,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'description': description});
    result.addAll({'colorKey': colorKey});

    return result;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      colorKey: map['colorKey'] ?? '',
    );
  }

  static List<CategoryModel> listFromMap(List<dynamic> list) {
    return list.map((map) => CategoryModel.fromMap(map)).toList();
  }

  @override
  String get searchable => description;
}

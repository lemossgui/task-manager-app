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

  @override
  String get searchable => description;
}

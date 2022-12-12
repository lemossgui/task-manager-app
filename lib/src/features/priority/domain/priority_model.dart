import 'package:task_manager/task_manager.dart';

class PriorityModel extends Searchable {
  final int id;
  final String description;
  final String key;

  PriorityModel({
    required this.id,
    required this.description,
    required this.key,
  });

  @override
  String get searchable => description;
}

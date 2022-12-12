import 'package:task_manager/task_manager.dart';

class TaskModel {
  final int id;
  final String title;
  final String description;
  final CategoryModel category;
  final PriorityModel priority;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}

import 'package:task_manager/task_manager.dart';

class TaskMapper extends AbstractMapper<TaskModel> {
  final CategoryMapper categoryMapper;
  final PriorityMapper priorityMapper;

  TaskMapper({
    required this.categoryMapper,
    required this.priorityMapper,
  });

  @override
  TaskModel fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: categoryMapper.fromMap(map['category']),
      priority: priorityMapper.fromMap(map['priority']),
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate']),
      status: map['status'],
    );
  }

  @override
  Map<String, dynamic> toMap(TaskModel model) {
    return <String, dynamic>{
      'id': model.id,
      'title': model.title,
      'description': model.description,
      'category': categoryMapper.toMap(model.category),
      'priority': priorityMapper.toMap(model.priority),
      'startDate': model.startDate.millisecondsSinceEpoch,
      'endDate': model.endDate.millisecondsSinceEpoch,
      'status': model.status,
    };
  }
}

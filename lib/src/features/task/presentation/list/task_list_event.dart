import 'package:task_manager/task_manager.dart';

abstract class TaskListEvent {}

class NavigateToTaskForm extends TaskListEvent {
  final TaskModel? task;

  NavigateToTaskForm({
    this.task,
  });
}

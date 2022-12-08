import 'package:task_manager/task_manager.dart';

class TaskListBloC extends BloC<TaskListEvent> {
  static const route = '/task_list';

  @override
  void onReady() async {
    await _loadAllTasks();
    super.onReady();
  }

  Future<void> _loadAllTasks() async {
    return;
  }

  @override
  void handleEvent(TaskListEvent event) {
    if (event is NavigateToTaskForm) {
      _navigateToTaskForm(event.task);
    }
  }

  void _navigateToTaskForm(TaskModel? task) async {
    final saved = await toNamed(
      TaskFormBloC.route,
      arguments: task,
    );

    if (saved == true) {
      _loadAllTasks();
    }
  }
}

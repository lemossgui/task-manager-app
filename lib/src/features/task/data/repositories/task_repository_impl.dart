import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskStore remote;

  TaskRepositoryImpl({
    required this.remote,
  });
  @override
  AsyncResult<List<TaskModel>, String> findAllCurrentDay() {
    return remote.findAllCurrentDay();
  }

  @override
  AsyncResult<int, String> save(TaskModel model) {
    return remote.save(model);
  }
}

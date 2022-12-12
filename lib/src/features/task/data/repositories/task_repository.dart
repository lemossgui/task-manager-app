import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

abstract class TaskRepository {
  AsyncResult<int, String> save(TaskModel model);
  AsyncResult<List<TaskModel>, String> findAllCurrentDay();
}

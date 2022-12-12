import 'package:task_manager/task_manager.dart';

class TaskInjector extends Injector {
  @override
  void dependencies() {
    put(
      TaskMapper(
        categoryMapper: find(),
        priorityMapper: find(),
      ),
    );

    put<TaskStore>(
      TaskRemoteImpl(
        mapper: find(),
      ),
    );

    put<TaskRepository>(
      TaskRepositoryImpl(
        remote: find(),
      ),
    );

    lazyPut(
      () => TaskListBloC(),
      fenix: true,
    );

    lazyPut(
      () => TaskFormBloC(
        categoryRepository: find(),
        priorityRepository: find(),
      ),
      fenix: true,
    );
  }
}

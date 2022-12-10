import 'package:task_manager/task_manager.dart';

class TaskInjector extends Injector {
  @override
  void dependencies() {
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

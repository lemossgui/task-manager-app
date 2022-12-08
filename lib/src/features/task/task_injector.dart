import 'package:task_manager/task_manager.dart';

class TaskInjector extends Injector {
  @override
  void dependencies() {
    lazyPut(
      () => TaskListBloC(),
    );

    lazyPut(
      () => TaskFormBloC(
        categoryRepository: find(),
        priorityRepository: find(),
      ),
    );
  }
}

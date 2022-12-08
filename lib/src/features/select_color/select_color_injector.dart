import 'package:task_manager/task_manager.dart';

class SelectColorInjector extends Injector {
  @override
  void dependencies() {
    lazyPut(
      () => SelectColorBloC(
        categoryRepository: find(),
      ),
    );
  }
}

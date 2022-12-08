import 'package:task_manager/task_manager.dart';

class RootInjector extends Injector {
  @override
  void dependencies() {
    lazyPut(
      () => RootBloC(
        sessionRepository: find(),
      ),
    );
  }
}

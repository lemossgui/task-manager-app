import 'package:task_manager/task_manager.dart';

class HomeInjector extends Injector {
  @override
  void dependencies() {
    /// BloC
    lazyPut(
      () => HomeBloC(),
    );
  }
}

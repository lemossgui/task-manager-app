import 'package:task_manager/task_manager.dart';

class MainInjector extends Injector {
  @override
  void dependencies() {
    SessionInjector().dependencies();
    RootInjector().dependencies();
    LoginInjector().dependencies();
    HomeInjector().dependencies();
  }
}

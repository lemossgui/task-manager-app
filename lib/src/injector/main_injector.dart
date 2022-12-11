import 'package:task_manager/src/features/select_color/select_color_injector.dart';
import 'package:task_manager/task_manager.dart';

class MainInjector extends Injector {
  @override
  void dependencies() {
    SessionInjector().dependencies();
    RootInjector().dependencies();
    LoginInjector().dependencies();
    UserInjector().dependencies();
    HomeInjector().dependencies();
    CategoryInjector().dependencies();
    SelectColorInjector().dependencies();
    PriorityInjector().dependencies();
    TaskInjector().dependencies();
  }
}

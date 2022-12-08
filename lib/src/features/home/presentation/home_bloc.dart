import 'package:task_manager/task_manager.dart';

enum HomeKey {
  currentIndex,
}

class HomeBloC extends BloC<HomeEvent> {
  static const route = '/home';

  @override
  void handleEvent(HomeEvent event) {}
}

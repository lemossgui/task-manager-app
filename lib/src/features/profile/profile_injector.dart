import 'package:task_manager/task_manager.dart';

class ProfileInjector extends Injector {
  @override
  void dependencies() {
    lazyPut(
      () => ProfileBloC(
        sessionRepository: find(),
      ),
      fenix: true,
    );
  }
}

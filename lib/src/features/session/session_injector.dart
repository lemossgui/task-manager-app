import 'package:task_manager/task_manager.dart';

class SessionInjector extends Injector {
  @override
  void dependencies() {
    put<SessionStore>(
      SessionLocalImpl(),
    );

    put<SessionRepository>(
      SessionRepositoryImpl(
        local: find(),
      ),
    );
  }
}

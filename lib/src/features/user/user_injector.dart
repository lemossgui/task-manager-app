import 'package:task_manager/task_manager.dart';

class UserInjector extends Injector {
  @override
  void dependencies() {
    put<UserStore>(
      UserRemoteImpl(),
    );

    put<UserRepository>(
      UserRepositoryImpl(
        remote: find(),
      ),
    );

    lazyPut(
      () => UserFormBloC(
        repository: find(),
        loginRepository: find(),
        sessionRepository: find(),
      ),
      fenix: true,
    );
  }
}

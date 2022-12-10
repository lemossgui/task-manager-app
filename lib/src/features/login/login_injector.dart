import 'package:task_manager/task_manager.dart';

class LoginInjector extends Injector {
  @override
  void dependencies() {
    put<LoginStore>(
      LoginRemoteImpl(),
    );

    put<LoginRepository>(
      LoginRepositoryImpl(
        remote: find(),
      ),
    );

    lazyPut(
      () => LoginBloC(
        repository: find(),
        sessionRepository: find(),
      ),
      fenix: true,
    );
  }
}

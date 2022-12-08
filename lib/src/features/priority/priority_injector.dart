import 'package:task_manager/task_manager.dart';

class PriorityInjector extends Injector {
  @override
  void dependencies() {
    put<PriorityStore>(
      PriorityRemoteImpl(),
    );

    put<PriorityRepository>(
      PriorityRepositoryImpl(
        remote: find(),
      ),
    );
  }
}

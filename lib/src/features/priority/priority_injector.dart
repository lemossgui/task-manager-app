import 'package:task_manager/task_manager.dart';

class PriorityInjector extends Injector {
  @override
  void dependencies() {
    put(
      PriorityMapper(),
    );

    put<PriorityStore>(
      PriorityRemoteImpl(
        mapper: find(),
      ),
    );

    put<PriorityRepository>(
      PriorityRepositoryImpl(
        remote: find(),
      ),
    );
  }
}

import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class SessionRepositoryImpl implements SessionRepository {
  final SessionStore local;

  SessionRepositoryImpl({
    required this.local,
  });

  @override
  AsyncResult<String, String> save(SessionModel model) {
    return local.save(model);
  }

  @override
  AsyncResult<SessionModel, String> get() {
    return local.get();
  }

  @override
  AsyncResult<String, String> clear() {
    return local.clear();
  }

  @override
  Future<bool> get isLogged async {
    final result = await get();
    return result.isSuccess();
  }
}

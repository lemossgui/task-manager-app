import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

abstract class SessionRepository {
  AsyncResult<String, String> save(SessionModel model);
  AsyncResult<SessionModel, String> get();
  AsyncResult<String, String> clear();
  Future<bool> get isLogged;
}

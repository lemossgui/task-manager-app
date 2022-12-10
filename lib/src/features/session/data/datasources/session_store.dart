import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

abstract class SessionStore {
  AsyncResult<String, String> clear();
  AsyncResult<SessionModel, String> get();
  AsyncResult<String, String> save(SessionModel model);
}

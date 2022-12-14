import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

abstract class LoginRepository {
  AsyncResult<String, String> doLogin({
    required CredentialsModel credentials,
  });
}

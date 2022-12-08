import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class LoginRepositoryImpl extends BaseConnector implements LoginRepository {
  final LoginStore remote;

  LoginRepositoryImpl({
    required this.remote,
  });

  @override
  AsyncResult<String, String> doLogin({
    required CredentialsModel credentials,
  }) async {
    return remote.doLogin(credentials: credentials);
  }
}

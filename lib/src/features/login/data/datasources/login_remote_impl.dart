import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class LoginRemoteImpl extends BaseConnector implements LoginStore {
  final _baseUrl = '/authentication/login';

  @override
  AsyncResult<String, String> doLogin({
    required CredentialsModel credentials,
  }) async {
    try {
      final body = credentials.toMap();
      final responseRaw = await post(_baseUrl, body);
      final response = Response.fromMap(responseRaw.body);
      if (response.isSuccess) {
        return Success(response.params);
      }
      return Error(response.message);
    } on Exception catch (_) {
      return const Error('Falha ao realizar autenticação');
    }
  }
}

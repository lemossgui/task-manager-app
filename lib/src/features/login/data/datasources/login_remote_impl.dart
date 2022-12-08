import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class LoginRemoteImpl extends BaseConnector implements LoginStore {
  final _endpoint = '/authentication/login';

  @override
  AsyncResult<String, String> doLogin({
    required CredentialsModel credentials,
  }) async {
    try {
      final body = credentials.toMap();
      return post(_endpoint, body)
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on Exception catch (_) {
      return const Error('Falha ao realizar autenticação');
    }
  }
}

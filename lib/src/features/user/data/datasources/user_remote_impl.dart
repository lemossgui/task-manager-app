import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class UserRemoteImpl extends BaseConnector implements UserStore {
  final _endpoint = '/user';

  @override
  AsyncResult<int, String> save(UserModel model) async {
    try {
      final body = model.toMap();
      return post(_endpoint, body)
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on Exception catch (_) {
      return const Error('Falha ao salvar o usuário');
    }
  }
}

import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class UserRemoteImpl extends ConnectorAuth implements UserStore {
  final _endpoint = '/user';

  @override
  AsyncResult<String, String> save(UserModel model) async {
    try {
      final body = model.toMap();
      return post(_endpoint, body)
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on GetHttpException catch (_) {
      return const Error('Falha ao salvar o usuário');
    }
  }

  @override
  AsyncResult<int, String> updateName(int id, String name) async {
    try {
      final body = {'name': name};
      return patch('$_endpoint/$id/update-name', body)
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on GetHttpException catch (_) {
      return const Error('Falha ao alterar o nome do usuário');
    }
  }

  @override
  AsyncResult<int, String> updateEmail(int id, String email) async {
    try {
      final body = {'email': email};
      return patch('$_endpoint/$id/update-email', body)
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on GetHttpException catch (_) {
      return const Error('Falha ao alterar o e-mail do usuário');
    }
  }

  @override
  AsyncResult<int, String> updatePassword(
    int id,
    String oldPassword,
    String newPassword,
    String newPasswordConfirmation,
  ) async {
    try {
      final body = {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'newPasswordConfirmation': newPasswordConfirmation,
      };
      return patch('$_endpoint/$id/update-password', body)
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on GetHttpException catch (_) {
      return const Error('Falha ao alterar a senha do usuário');
    }
  }

  @override
  AsyncResult<int, String> updateReceivingNotitication(
    int id,
    bool notificationIsEnable,
  ) async {
    try {
      final body = {'notificationIsEnable': notificationIsEnable};
      return patch('$_endpoint/$id/update-receiving-notification', body)
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on GetHttpException catch (_) {
      return const Error('Falha ao alterar o recebimento de notificações');
    }
  }

  @override
  AsyncResult<UserModel, String> getLoggedUser() async {
    try {
      return get('$_endpoint/logged')
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.mapAndGetResult(
                (params) => UserModel.fromMap(params),
              ));
    } on GetHttpException catch (_) {
      return const Error('Falha ao obter o usuário');
    }
  }
}

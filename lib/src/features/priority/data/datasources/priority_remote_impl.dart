import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class PriorityRemoteImpl extends ConnectorAuth implements PriorityStore {
  final _endpoint = '/priority';

  @override
  AsyncResult<List<PriorityModel>, String> findAll() async {
    try {
      return get(_endpoint)
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.mapAndGetResult(
                (params) => PriorityModel.listFromMap(params),
              ));
    } on GetHttpException catch (_) {
      return const Error('Falha ao obter as prioridades');
    }
  }
}

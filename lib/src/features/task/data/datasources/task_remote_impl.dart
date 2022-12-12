import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class TaskRemoteImpl extends ConnectorAuth implements TaskStore {
  final _endpoint = '/task';

  final TaskMapper mapper;

  TaskRemoteImpl({
    required this.mapper,
  });

  @override
  AsyncResult<int, String> save(TaskModel model) async {
    try {
      return post(_endpoint, mapper.toMap(model))
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on GetHttpException catch (_) {
      return const Error('Falha ao salvar a tarefa');
    }
  }

  @override
  AsyncResult<List<TaskModel>, String> findAllCurrentDay() async {
    try {
      return get('$_endpoint/current-day')
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.mapAndGetResult(
                (params) => mapper.listFromMap(params),
              ));
    } on GetHttpException catch (_) {
      return const Error('Falha ao obter as tarefas do dia');
    }
  }
}

import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class CategoryRemoteImpl extends ConnectorAuth implements CategoryStore {
  final _endpoint = '/category';

  final CategoryMapper mapper;

  CategoryRemoteImpl({
    required this.mapper,
  });

  @override
  AsyncResult<String, String> saveAll(List<CategoryModel> list) {
    throw UnimplementedError('Não implementado remotamente');
  }

  @override
  AsyncResult<int, String> save(CategoryModel model) async {
    try {
      return post(_endpoint, mapper.toMap(model))
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on GetHttpException catch (_) {
      return const Error('Falha ao salvar a categoria');
    }
  }

  Result<T, String> fromResponse<T, E>(Response response) {
    if (response.isSuccess) {
      return Success(response.params);
    }
    return Error(response.message);
  }

  @override
  AsyncResult<int, String> update(int id, CategoryModel model) async {
    try {
      return put('$_endpoint/$id', mapper.toMap(model))
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on GetHttpException catch (_) {
      return const Error('Falha ao atualizar a categoria');
    }
  }

  @override
  AsyncResult<List<CategoryModel>, String> findAll() async {
    try {
      return get(_endpoint)
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.mapAndGetResult(
                (params) => mapper.listFromMap(params),
              ));
    } on GetHttpException catch (_) {
      return const Error('Falha ao obter as categorias');
    }
  }

  @override
  AsyncResult<int, String> deleteById(int id) async {
    try {
      return delete('$_endpoint/$id')
          .then((json) => Response.fromMap(json.body))
          .then((response) => response.getResult());
    } on GetHttpException catch (_) {
      return const Error('Falha ao excluir a categoria');
    }
  }
}

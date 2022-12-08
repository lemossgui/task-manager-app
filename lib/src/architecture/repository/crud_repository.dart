import 'package:task_manager/task_manager.dart';

abstract class CrudRepository<T> extends ListRepository<T> {
  Future<Response> save(T model);
  Future<Response> update(String id, T model);
  Future<Response> delete(String id);
}

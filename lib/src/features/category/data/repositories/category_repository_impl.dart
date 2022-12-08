import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryStore remote;

  CategoryRepositoryImpl({
    required this.remote,
  });

  @override
  AsyncResult<int, String> save(CategoryModel model) {
    return remote.save(model);
  }

  @override
  AsyncResult<int, String> update(int id, CategoryModel model) {
    return remote.update(id, model);
  }

  @override
  AsyncResult<List<CategoryModel>, String> findAll() {
    return remote.findAll();
  }

  @override
  AsyncResult<int, String> deleteById(int id) {
    return remote.deleteById(id);
  }
}

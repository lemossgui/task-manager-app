import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';

abstract class CategoryRepository {
  AsyncResult<int, String> save(CategoryModel model);
  AsyncResult<int, String> update(int id, CategoryModel model);
  AsyncResult<List<CategoryModel>, String> findAll({bool forceRemote});
  AsyncResult<int, String> deleteById(int id);
}

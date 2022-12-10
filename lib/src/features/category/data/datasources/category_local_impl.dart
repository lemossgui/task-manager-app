import 'package:shared_preferences/shared_preferences.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:task_manager/task_manager.dart';
import 'dart:convert';

class CategoryLocalImpl implements CategoryStore {
  final String _key = 'category';

  Future<SharedPreferences> get _box async {
    return SharedPreferences.getInstance();
  }

  @override
  AsyncResult<String, String> saveAll(List<CategoryModel> list) async {
    throw UnimplementedError('Não implementado localmente');
  }

  @override
  AsyncResult<int, String> save(CategoryModel model) {
    throw UnimplementedError('Não implementado localmente');
  }

  @override
  AsyncResult<int, String> update(int id, CategoryModel model) {
    throw UnimplementedError('Não implementado localmente');
  }

  @override
  AsyncResult<List<CategoryModel>, String> findAll() async {
    throw UnimplementedError('Não implementado localmente');
  }

  @override
  AsyncResult<int, String> deleteById(int id) {
    throw UnimplementedError('Não implementado localmente');
  }
}

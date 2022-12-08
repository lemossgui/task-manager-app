import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/task_manager.dart';

enum CategoryListKey {
  list;
}

class CategoryListBloC extends BloC<CategoryListEvent> {
  static const route = '/category_list';
  final CategoryRepository repository;

  CategoryListBloC({
    required this.repository,
  });

  @override
  void onReady() async {
    await _loadAllCategories();
    super.onReady();
  }

  List<String> get _colorsInUse {
    List<CategoryModel> categories = map[CategoryListKey.list];
    return categories.map((item) => item.color).toList();
  }

  Future<void> _loadAllCategories() async {
    final result = await repository.findAll();
    result.map(_onLoadAllSuccess).mapError(showFailure);
  }

  void _onLoadAllSuccess(List<CategoryModel> list) {
    dispatch<List<CategoryModel>>(list, key: CategoryListKey.list);
  }

  @override
  void handleEvent(CategoryListEvent event) {
    if (event is NavigateToCategoryForm) {
      _navigateToCategoryForm(event.category);
    } else if (event is ShowDeleteCategoryDialog) {
      _showDeleteCategoryDialog(event.category);
    }
  }

  void _navigateToCategoryForm(CategoryModel? category) async {
    final saved = await toNamed(
      CategoryFormBloC.route,
      arguments: category,
    );

    if (saved == true) {
      _loadAllCategories();
    }
  }

  void _showDeleteCategoryDialog(CategoryModel category) async {
    final deleted = await dialog(const CategoryDeleteDialog());
    if (deleted == true) {
      await doPersist(
        action: () async {
          final result = await repository.deleteById(category.id);
          result.map((_) {
            showSuccess('Categoria excluída com sucesso!');
            _loadAllCategories();
          }).mapError(showFailure);
        },
      );
    }
  }
}

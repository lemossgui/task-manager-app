import 'package:task_manager/task_manager.dart';

abstract class CategoryListEvent {}

class NavigateToCategoryForm extends CategoryListEvent {
  final CategoryModel? category;

  NavigateToCategoryForm({
    this.category,
  });
}

class ShowDeleteCategoryDialog extends CategoryListEvent {
  final CategoryModel category;

  ShowDeleteCategoryDialog({
    required this.category,
  });
}

import 'package:task_manager/task_manager.dart';

class CategoryMapper extends AbstractMapper<CategoryModel> {
  @override
  CategoryModel fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      description: map['description'],
      colorKey: map['colorKey'],
    );
  }

  @override
  Map<String, dynamic> toMap(CategoryModel model) {
    return <String, dynamic>{
      'id': model.id,
      'description': model.description,
      'colorKey': model.colorKey,
    };
  }
}

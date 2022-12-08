import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

class CategoryListPage extends ScreenView<CategoryListBloC> {
  const CategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            child: MyTextButton(
              onPressed: () {
                bloc.dispatchEvent(
                  NavigateToCategoryForm(),
                );
              },
              label: 'Adicionar',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: getListBasePadding(context),
        child: StreamBuilder<List<CategoryModel>>(
          stream: bloc.streamOf<List<CategoryModel>>(
            key: CategoryListKey.list,
          ),
          builder: (_, snapshot) {
            final list = snapshot.data ?? List.empty();
            return Column(
              children: list.map(_buildCategoryItem).toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryItem(CategoryModel category) {
    return ListCard(
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: getColorValueByKey(category.color),
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 40.0,
              width: 8.0,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    category.description,
                    style: subtitle.bold,
                  ),
                ),
                Text(
                  getColorDescriptionByKey(category.color),
                  style: text,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              bloc.dispatchEvent(
                NavigateToCategoryForm(category: category),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              bloc.dispatchEvent(
                ShowDeleteCategoryDialog(category: category),
              );
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}

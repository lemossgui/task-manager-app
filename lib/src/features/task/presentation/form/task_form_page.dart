import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

class TaskFormPage extends ScreenView<TaskFormBloC> {
  const TaskFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: bloc.streamOf<bool>(
        key: TaskFormKey.isEditing,
      ),
      builder: (_, snapshot) {
        final isEditing = snapshot.data ?? false;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tarefa'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0,
                ),
                child: MyTextButton(
                  onPressed: () => isEditing
                      ? bloc.dispatchEvent(UpdateTask())
                      : bloc.dispatchEvent(SaveTask()),
                  label: 'Salvar',
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: getBasePadding(context),
            child: Column(
              children: [
                _buildTitle(),
                _buildDescription(),
                _buildCategoryDropdown(),
                _buildPriorityDropdown(),
                _buildCard(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: MyCard(
        content: Container(
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return StreamTextField(
      stream: bloc.streamOf<String?>(
        key: TaskFormKey.title,
      ),
      onChanged: (value) => bloc.dispatch<String?>(
        value,
        key: TaskFormKey.title,
      ),
      hintText: 'Título',
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamTextField(
        stream: bloc.streamOf<String?>(
          key: TaskFormKey.description,
        ),
        onChanged: (value) => bloc.dispatch<String?>(
          value,
          key: TaskFormKey.description,
        ),
        hintText: 'Descrição',
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamDropdownButtonFormField<CategoryModel>(
        hintText: 'Categoria',
        streamItems: bloc.streamOf<List<CategoryModel>>(
          key: TaskFormKey.categories,
        ),
        streamSelected: bloc.streamOf<CategoryModel?>(
          key: TaskFormKey.category,
        ),
        onSelected: (value) {
          bloc.dispatch<CategoryModel?>(
            value,
            key: TaskFormKey.category,
          );
        },
        requiredField: true,
        buildItem: (item) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: getCategoryColorValue(item.color),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  height: 16.0,
                  width: 16.0,
                ),
              ),
              Text(
                item.description,
                style: text.semiBold,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPriorityDropdown() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamDropdownButtonFormField<PriorityModel>(
        hintText: 'Prioridade',
        streamItems: bloc.streamOf<List<PriorityModel>>(
          key: TaskFormKey.priorities,
        ),
        streamSelected: bloc.streamOf<PriorityModel?>(
          key: TaskFormKey.priority,
        ),
        onSelected: (value) {
          bloc.dispatch<PriorityModel?>(
            value,
            key: TaskFormKey.priority,
          );
        },
        requiredField: true,
        buildItem: (item) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.upgrade,
                  color: getPriorityColorValue(item.key),
                ),
              ),
              Text(
                item.description,
                style: text.semiBold,
              ),
            ],
          );
        },
      ),
    );
  }
}

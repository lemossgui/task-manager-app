import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

class TaskListPage extends ScreenView<TaskListBloC> {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildTasks(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return MyAppBar(
      title: 'Tarefas',
      actions: [
        MyTextButton(
          onPressed: () {
            bloc.dispatchEvent(NavigateToTaskForm());
          },
          label: 'Adicionar',
        ),
      ],
    );
  }

  Widget _buildTasks(BuildContext context) {
    return const EmptyListWidget(
      message: 'Você não possui tarefas cadastradas.',
    );
  }
}

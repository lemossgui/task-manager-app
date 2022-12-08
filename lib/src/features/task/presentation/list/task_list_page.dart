import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

class TaskListPage extends ScreenView<TaskListBloC> {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 16.0,
            ),
            child: MyTextButton(
              onPressed: () {
                bloc.dispatchEvent(NavigateToTaskForm());
              },
              label: 'Adicionar',
            ),
          ),
        ],
      ),
    );
  }
}

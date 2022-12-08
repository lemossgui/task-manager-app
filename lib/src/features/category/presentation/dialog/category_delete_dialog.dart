import 'package:get/get.dart';
import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class CategoryDeleteDialog extends StatelessWidget {
  const CategoryDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      titlePadding: const EdgeInsets.all(16.0),
      title: const Text('Atenção!'),
      contentPadding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 32.0,
      ),
      content: const Text('Deseja realmente excluir a categoria?'),
      actionsPadding: const EdgeInsets.only(right: 16.0, bottom: 12.0),
      actions: [
        MyTextButton(
          onPressed: () => Get.back<bool>(result: false),
          label: 'Fechar',
          backgroundColor: primaryColor,
        ),
        MyTextButton(
          onPressed: () => Get.back<bool>(result: true),
          label: 'Confirmar',
        ),
      ],
    );
  }
}

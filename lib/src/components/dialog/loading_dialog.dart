import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;

  const LoadingDialog({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      contentPadding: const EdgeInsets.all(32.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingWidget(
            message: message ?? 'Aguarde',
          ),
        ],
      ),
    );
  }
}

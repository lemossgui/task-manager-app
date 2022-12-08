import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

mixin HudMixin {
  void showSnackBar(
    String message, {
    String? title,
    required Color backgroundColor,
    SnackPosition? position,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
        snackPosition: position ?? SnackPosition.BOTTOM,
      ),
    );
  }

  void showSuccess(String message) {
    showSnackBar(
      message,
      backgroundColor: successColor,
    );
  }

  void showFailure(String message) {
    showSnackBar(
      message,
      backgroundColor: errorColor,
    );
  }

  void showWarning(String message) {
    showSnackBar(
      message,
      backgroundColor: warningColor,
    );
  }

  void showLoadingDialog({
    String? message,
    bool canDismiss = false,
  }) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10.0),
              message != null ? Text(message) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      barrierDismissible: canDismiss,
    );
  }
}

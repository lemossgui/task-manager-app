import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

mixin HudMixin {
  void showSnackBar(
    String message, {
    String? title,
    required Color backgroundColor,
    SnackPosition? position,
    Widget? icon,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        backgroundColor: backgroundColor,
        borderRadius: 16.0,
        margin: const EdgeInsets.all(16.0),
        duration: const Duration(seconds: 3),
        snackPosition: position ?? SnackPosition.BOTTOM,
        icon: icon,
        boxShadows: [
          BoxShadow(
            color: const Color.fromARGB(255, 71, 46, 46).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
    );
  }

  void showSuccess(String message) {
    showSnackBar(
      message,
      backgroundColor: successColor,
      icon: const Icon(
        Icons.check_circle_rounded,
        color: backgroundColorLight,
      ),
    );
  }

  void showInfo(String message) {
    showSnackBar(
      message,
      backgroundColor: infoColor,
      icon: const Icon(
        Icons.info_rounded,
        color: backgroundColorLight,
      ),
    );
  }

  void showWarning(String message) {
    showSnackBar(
      message,
      backgroundColor: warningColor,
      icon: const Icon(
        Icons.warning_rounded,
        color: backgroundColorLight,
      ),
    );
  }

  void showError(String message) {
    showSnackBar(
      message,
      backgroundColor: errorColor,
      icon: const Icon(
        Icons.cancel_rounded,
        color: backgroundColorLight,
      ),
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

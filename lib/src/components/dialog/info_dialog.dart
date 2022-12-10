import 'package:lottie/lottie.dart';
import 'package:task_manager/task_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoDialog extends StatelessWidget {
  final String message;

  const InfoDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      contentPadding: const EdgeInsets.only(top: 32.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/json/info.json',
            height: 48.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 16.0,
            ),
            child: Text(
              message,
              style: text,
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () => Get.back<bool>(result: false),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0.0),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(0.0),
              ),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0),
                  ),
                ),
              ),
            ),
            child: Container(
              height: 48.0,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: backgroundColorLight,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: Text(
                'Fechar',
                style: text.semiBold.copyWith(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

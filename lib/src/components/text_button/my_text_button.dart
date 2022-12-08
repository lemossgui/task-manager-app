import 'package:flutter/material.dart';
import 'package:task_manager/task_manager.dart';

class MyTextButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  const MyTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? secondaryColor,
        ),
        textStyle: MaterialStateProperty.all(text),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          label,
          style: text.semiBold.copyWith(
            color: textColor ?? secondaryTextColor,
          ),
        ),
      ),
    );
  }
}

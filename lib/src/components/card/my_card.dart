import 'package:flutter/material.dart';
import 'package:task_manager/theme/colors.dart';

class MyCard extends StatelessWidget {
  final Function? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final Widget content;

  const MyCard({
    Key? key,
    this.onTap,
    this.contentPadding,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
        onTap: onTap != null ? () => onTap?.call() : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: content,
        minVerticalPadding: 0.0,
      ),
    );
  }
}
